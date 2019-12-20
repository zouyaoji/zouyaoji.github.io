# Cesium - 量算

title: Cesium - 距离、面积、高度量算
tags:

- Cesium

categories:

- Cesium

date: 2019-12-20 19:30:00

---

## 前言

近期工作之余都在继续开发个人开源项目 **[vue-cesium](https://github.com/zouyaoji/vue-cesium)** ，在最近学习中发现自己之前码的代码不太优雅，不太精炼，所以花不少时间重构了第二版，获益匪浅。其中就发现之前做的量算功能结果不太合适，尤其是面积量算，看网上很少有正确的思路，所以在这儿记录核心代码，详细请移步 GitHub 查看，欢迎提 Issue、PR，顺便小手点个 Star 也可以。`vue-cesium` 在 2.0.3 版本将会优化量算组件。

<!-- more -->

## 距离量算

之前用的是 `Cartesian3.distance` 计算两点之间的距离，但这是不合适的，原因是 `Cartesian3.distance` 计算的是两点之间的直线距离，忽略了地球曲率，不太合理，应该改为量算测地距离(GeodesicDistance)。代码如下：

```js
/**
 * 根据传入坐标数组计算距离。
 * @param {Array.Cartesian3} positions 传入的坐标数组
 * @returns {Number} 返回长度数值。
 */
getDistance (positions) {
  // const { Cartesian3 } = Cesium
  let distance = 0
  for (let i = 0; i < positions.length - 1; i++) {
    // Cartesian3.distance 计算的是两点之间的直线距离，忽略了地球曲率，不太合理。
    // let s = Cartesian3.distance(positions[i], positions[i + 1])
    // 2.0.3 版本改为测地距离（GeodesicDistance）。
    let s = this.getGeodesicDistance(positions[i], positions[i + 1])
    distance = distance + s
  }
  return distance
},
/**
 * 返回两点之间的测地距离。
 * @param {Cartesian3} pointOne 第一个坐标点
 * @param {Cartesian3} pointTwo 第二个坐标点
 * @returns {Number} 返回两点之间的测地距离。
 */
getGeodesicDistance (pointOne, pointTwo) {
  const { Ellipsoid, EllipsoidGeodesic } = Cesium
  const pickedPointCartographic = Ellipsoid.WGS84.cartesianToCartographic(
    pointOne
  )
  const lastPointCartographic = Ellipsoid.WGS84.cartesianToCartographic(
    pointTwo
  )
  const geodesic = new EllipsoidGeodesic(
    pickedPointCartographic,
    lastPointCartographic
  )
  return geodesic.surfaceDistance
}
```

## 面积量算

之前用的是将笛卡尔坐标数组转经纬度然后构造 turf 的多边形对象，用 `@turf/area` 计算多边形面积，这很好，本身并没有问题，但美中不足的是这个实际上计算的是三维面投影到二维表名的投影面积，没有考虑高度。近期我才 GET 到正确的解决思路是将多边形分解成多个三角形，这点 Cesium 直接轻松做到，然后用[海伦公式](https://baike.baidu.com/item/%E6%B5%B7%E4%BC%A6%E5%85%AC%E5%BC%8F#1)计算面积。话不多说，上代码：

```js
/**
 * 用 @turf/area 获取传入坐标的构成的多边形的面积。
 * @param {Array.Cartesian}
 * @returns {Number} 返回面积数值。
 */
getProjectedArea (positions) {
  const { Cartographic, Math: CesiumMath } = Cesium
  let array = []
  for (let i = 0, len = positions.length; i < len; i++) {
    let cartographic = Cartographic.fromCartesian(positions[i])
    let longitude = CesiumMath.toDegrees(cartographic.longitude).toFixed(6)
    let latitude = CesiumMath.toDegrees(cartographic.latitude).toFixed(6)
    array.push({ x: longitude, y: latitude })
  }
  let arrs = []
  let tems = []
  arrs.push(tems)
  for (let i = 0, len = array.length; i < len; i++) {
    tems.push([array[i].x, array[i].y])
  }
  let polygons = {
    type: 'FeatureCollection',
    features: [
      {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'Polygon',
          coordinates: arrs
        }
      },
      {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'Polygon',
          coordinates: [[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]]
        }
      }
    ]
  }
  return area(polygons)
},
/**
 * 用海伦公式获取传入坐标的构成的多边形的面积。
 * @param {Array.Cartesian}
 * @returns {Number} 返回面积数值。
 */
getSurfaceArea (positions) {
  if (positions.length < 3) {
    return 0
  }
  const { Cartesian3, EllipsoidTangentPlane, Ellipsoid, Math: CesiumMath, PolygonGeometryLibrary, PolygonHierarchy, VertexFormat } = Cesium
  const perPositionHeight = true
  // 获取组成多边形的三角形。
  const tangentPlane = EllipsoidTangentPlane.fromPoints(
    positions,
    Ellipsoid.WGS84
  )
  const polygons = PolygonGeometryLibrary.polygonsFromHierarchy(
    new PolygonHierarchy(positions),
    tangentPlane.projectPointsOntoPlane.bind(tangentPlane),
    !perPositionHeight,
    Ellipsoid.WGS84
  )

  const geom = PolygonGeometryLibrary.createGeometryFromPositions(
    Ellipsoid.WGS84,
    polygons.polygons[0],
    CesiumMath.RADIANS_PER_DEGREE,
    perPositionHeight,
    VertexFormat.POSITION_ONLY
  )

  if (geom.indices.length % 3 !== 0 || geom.attributes.position.values.length % 3 !== 0) {
    // 不是三角形，无法计算。
    return 0
  }
  const coords = []
  for (let i = 0; i < geom.attributes.position.values.length; i += 3) {
    coords.push(
      new Cartesian3(
        geom.attributes.position.values[i],
        geom.attributes.position.values[i + 1],
        geom.attributes.position.values[i + 2]
      )
    )
  }
  let area = 0
  for (let i = 0; i < geom.indices.length; i += 3) {
    const ind1 = geom.indices[i]
    const ind2 = geom.indices[i + 1]
    const ind3 = geom.indices[i + 2]

    const a = Cartesian3.distance(coords[ind1], coords[ind2])
    const b = Cartesian3.distance(coords[ind2], coords[ind3])
    const c = Cartesian3.distance(coords[ind3], coords[ind1])

    // 海伦公式
    const s = (a + b + c) / 2.0
    area += Math.sqrt(s * (s - a) * (s - b) * (s - c))
  }
  return area
}
```

### 三角测量

三角测量的代码没啥说的，直接移步 Github 查看吧。


The End!
