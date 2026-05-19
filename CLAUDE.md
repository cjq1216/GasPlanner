# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

Dugong Gas Planner - 面向休闲潜水员的气体规划 Web 应用。基于 Angular 20 + TypeScript，支持离线 PWA 模式。

**在线实例**: https://dugong.online/

## 常用命令

```bash
# 安装依赖（首次克隆后必须运行）
npm run build-lib

# 开发调试
npm start

# 生产构建
npm run build

# 测试
npm test                    # planner 应用测试
npm run test-lib           # scuba-physics 库测试
npm run test-ci            # CI 模式（ChromeHeadless + 覆盖率）

# 代码检查
npm run lint

# E2E 测试
npm run e2e

# PWA 本地测试
npm run start-pwa
```

## 项目结构

```
projects/
├── planner/          # 主应用 (Angular PWA)
│   └── src/app/
│       ├── calculators/   # 各种计算器组件（SAC、Nitrox、Gas Props 等）
│       ├── controls/      # 可复用控件（altitude、salinity、tank-size 等）
│       ├── diff/          # 潜水对比功能
│       └── planner/       # 核心潜水规划组件
└── scuba-physics/    # 共享库 - 潜水物理计算核心
    └── src/lib/
        ├── services/     # 核心服务（减压计算、气体消耗等）
        └── ...            # Bühlmann ZHL-16C 算法实现等
```

## 架构要点

- **双项目结构**: `scuba-physics` 是 ng-packagr 库，被 `planner` 应用依赖。先修改库再构建应用
- **scuba-physics 库** 包含核心潜水计算逻辑（Bühlmann ZHL-16C 算法、GF 控制等），是独立发布的包
- **规划器应用** 通过 `npm run build-lib` 先构建库，再通过 `npm start` 或 `npm run build` 运行
- **测试隔离**: 库测试和应用测试分开运行，避免循环依赖问题

## 技术栈

- Angular 20.3 + RxJS 7.8
- ng-packagr 构建共享库
- Plotly.js 图表
- Angular Service Worker (PWA)
- Maskito 输入掩码

## 环境要求

- Node.js: 24.15.0 (见 `.nvmrc`)
- Angular CLI: 通过 `npm install -g @angular/cli` 全局安装