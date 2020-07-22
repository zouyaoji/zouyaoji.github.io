# Cesium - 加载高德实时栅格路况图层

title: Cesium - 加载高德实时栅格路况图层
tags:

- Cesium

categories:

- Cesium

date: 2020-07-21 19:30:00

---

## 前言

最近有需要在Cesium中加载道路拥堵情况，像高德百度的思路应该是通过实时采集的数据来制成道路拥堵图，然后切片，根据一定时间频率更新切片。搜了一下网上有ol接入高德地图的例子，观察了一下ol中加载高度路况的例子中请求，发现是请求是`x={x}&y={y}&z={z}`这种表达的，说明在Cesium中是可以直接加载的，用`UrlTemplateImageryProvider`，用`vue-cesium`的话就是`vc-provider-imagery-urltemplate`组件，下面讲一下用`vue-cesium`加载高德路况图层的方法。

<!-- more -->

## 高德加载路况图层

废话不多说，直接上代码。

```vue
<template>
  <vc-viewer>
    <!-- 高德底图图层 -->
      <vc-layer-imagery>
      <vc-provider-imagery-urltemplate :url="urlBase"></vc-provider-imagery-urltemplate>
    </vc-layer-imagery>
    <!-- 高德路况图层 -->
    <vc-layer-imagery>
      <vc-provider-imagery-urltemplate :minimumLevel="6" :maximumLevel="20" :url="urlRoad"></vc-provider-imagery-urltemplate>
    </vc-layer-imagery>
  </vc-viewer>
</template>

<script>
export default {
  data () {
    return {
      urlRoad: 'https://tm.amap.com/trafficengine/mapabc/traffictile?v=1.0&x={x}&y={y}&z={z}&t=1595299423352',
      urlBase: 'https://webst01.is.autonavi.com/appmaptile?style=7&x={x}&y={y}&z={z}'
    }
  }
}
</script>
```

效果

![效果图](https://zouyaoji-1300719013.cos.ap-chengdu.myqcloud.com/zouyaoji.top/20200722085924.png)

问题探讨

- 实测cesium加载高德路况图层的时候最小层级是6，最大层级是20。另外还需要做跨域处理。
- 内网环境下，自己通过数据生成路况切片，还是个难题。

最后附上高德官方例子

- [加载栅格图](https://lbs.amap.com/api/javascript-api/example/thirdlayer/functile/)


The End!
