---
layout: post
title: "用 Xcode 编写 python"
date: 2023-02-01
description: "Xcode,python"
tag: [python,Xcode]
categories: [python,Xcode]
--- 

#### 前期准备
- 安装 Xcode 
- brew 安装 python
- 执行以下命令
``` shell
cd /opt/homebrew/bin
ln python3 xcodePython3
```

#### 新建项目
- Xcode 新建项目`Other - External Build System`
- Build Tool 填入 `/opt/homebrew/bin/xcodePython3`
- 在项目下新建文件 `Other - Empty` 文件名 `test.py`(自定义)

#### 配置
- `Edit Scheme - Info - Executable - Other...`
- 按快捷键`shift + cmd + G` 输入 `/opt/homebrew/bin/xcodePython3`
- 取消选择` Debug executable`
- `Edit Scheme - Arguments - + ` 输入 ``` test.py ```
- 勾选`Edit Scheme -Options - Working Directory `并输入项目路径



