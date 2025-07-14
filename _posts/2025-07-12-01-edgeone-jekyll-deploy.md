---
layout: post
title: "使用 Github Action 部署 Jekyll 静态站点到 EdgeOne"
date: 2025-07-12
tags: [EdgeOne,Jekyll,部署,CDN]
categories: [EdgeOne]
--- 
由于EdgeOne Pages 没有提供 Jekyll 构建功能,所以我们使用 Github Action 进行部署,以下是部署流程

#### 创建 EdgeOne 站点 和 API Token
- 登录[EdgeOne控制台](https://console.cloud.tencent.com/edgeone/zones)
- 选择 `Pages` 点击 `创建项目` ，选择 `直接上传`,随便选取一个 html 文件即可.
- 选择 `Pages` 选择 `API Token` ，点击 `创建API Token`,设置描述和过期时间.

#### 设置 Github 仓库 Secret
- 访问 GitHub 仓库页面
- 前往 `Settings` > `Secrets and variables` > `Actions`
- 点击 `New repository secret`
- 在 `Name` 输入 `EDGEONE_API_TOKEN`，在 `Secret` 输入 EdgeOne API token 的值

#### Jekyll 构建配置
- 在项目根目录创建 `.github/workflows/main.yml` 文件
- 配置自动构建和部署流程：

``` yaml
name: Build and Deploy Jekyll site to EdgeOne Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v4

      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.1'

      - name: Install dependencies
        run: |
          gem install bundler
          bundle install

      - name: Build Jekyll site
        run: bundle exec jekyll build
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22.11.0'
      
      - name: Deploy to EdgeOne Pages
        run: |
          REPO_NAME=$(echo "${GITHUB_REPOSITORY}" | cut -d '/' -f2)
          npx edgeone pages deploy ./_site -n "$REPO_NAME" -t ${{ secrets.EDGEONE_API_TOKEN }}
```
#### GitHub Actions 构建
当代码推送到 main 分支时，会触发以下构建和部署过程：
- checkout 到目标仓库
- 设置 Ruby
- 安装项目依赖
- 构建项目
- 部署到 EdgeOne Pages

#### 域名配置
- 在 EdgeOne Pages 控制台进入项目设置
- 添加自定义域名
- 配置 CNAME 记录指向 EdgeOne 提供的域名
- 等待 DNS 解析生效

#### 参考文档
- [EdgeOne 官方文档](https://edgeone.cloud.tencent.com/pages/document/162936635171454976)
- [Jekyll 官方文档](https://jekyllrb.com/docs/)