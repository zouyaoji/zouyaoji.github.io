# 全栈开发学习：Vue2+Koa2 开发前后端分离项目一（登陆验证）

title: 全栈开发学习：Vue2+Koa2 开发前后端分离项目一（登陆验证）
tags:

- Vue
- Koa
- Quasar

categories:

- 前端学习
- 后端学习

date: 2018-08-30 19:30:00

---

## 前言

本文记录自己从零开始构建一个前后端分离的项目。之前学习了比较流行的 Vue，但仅会做一些展示页面，如处女作[成都送福物流](https://www.songluck.com/)。现在想做一些物流订单管理的功能，那自然离不开后台服务了。学习之路永无止境，通过一段时间的网络搜索学习，我了解到像我这样前端基础一般，后端服务基础为零的选手，后端服务就用 NodeJS 比较好上手一点，而且前端 Vue 项目也接触不少 NodeJS。本次我打算前端采用 Vue 全家桶和 Quasar Framework 完成，后端用 Koa2 和 MySQL。

本篇是登录验证的学习总结，主要是后端基础部分搭建，会用到[JSON-WEB-TOKEN](https://jwt.io/)。

<!-- more -->

## 准备工作

### 一、数据库

#### 1、安装 MySQL

到[MySQL 官网](https://dev.mysql.com/downloads/installer/)下载对应操作系统的 MySQL 并安装。

#### 2、表设计

用户表设计看了文章[浅谈数据库用户表结构设计，第三方登录](https://www.cnblogs.com/jiqing9006/p/5937733.html)觉得比较合理，用了2张表，users存用户基本信息，user_auths存用户授权信息。

### 二、构建项目

### 1、用koa脚手架初始化一个项目

（1）全局安装 koa 脚手架模板：

```code
npm install koa-generator -g
```

（2）用 koa 生成初始项目结构并下载依赖

```code
koa koa-test && cd koa-test && npm install
```

（3）运行

执行以下命令，访问[http://localhost:3000](http://localhost:3000)看见“Hello World Koa!”说明项目初始化成功。

```code
npm start
```

### 2、安装要用到的依赖并调整项目结构

会用到

```code
npm install --save koa-jwt mysql2 sequelize
```
