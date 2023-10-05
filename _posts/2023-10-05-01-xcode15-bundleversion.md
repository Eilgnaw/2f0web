---
layout: post
title: "Xcode15下修改其它target的版本号"
date: 2023-10-05
tags: [Xcode15,version,build]
categories: [Xcode]
--- 


在Xcode 15更新后，iOS项目中除了主程序之外的其他target（例如小组件、分享扩展等）中设置版本号的选项似乎不再可见，因此无法直接修改版本号。虽然可以在"Build Settings"中单独设置，但这可能会比较繁琐。下面提供了一个简单的解决方案：

#### 添加构建配置文件
- 打开Xcode并选择 "File" > "New File" > "Configuration Settings File" > "Next"。
- 名称可以默认，不需要为target选中复选框。
- ![xcode001](https://docs-assets.developer.apple.com/published/2644ce60d016773eec58777b20fa0216/build-configuration-creation@2x.png)

#### 添加配置到配置文件
- 在创建的配置文件中，将以下内容添加到配置文件中，其中MARKETING_VERSION对应于应用程序的版本号，CURRENT_PROJECT_VERSION对应于应用程序的构建号（Build）：

``` yaml
MARKETING_VERSION = 1.0.2
CURRENT_PROJECT_VERSION = 5
```

#### 将配置文件添加到项目配置
- 按照下面的操作将配置文件与项目配置相关联：
- ![xcode002](https://docs-assets.developer.apple.com/published/0923c1e0e0a76674a2cbdd81ca108379/build-configuration-mapping@2x.png)

#### 删除原项目中版本号设置
- 使用文本编辑器打开项目的 .xcodeproj 文件夹中的 project.pbxproj 文件。
- 搜索并删除所有与MARKETING_VERSION和CURRENT_PROJECT_VERSION相关的条目。

#### 编译项目并验证
- 重新编译项目后，你会注意到版本号和构建号已经根据配置文件的更改进行了更新。


#### 参考文档
- [Adding a build configuration file to your project](https://developer.apple.com/documentation/xcode/adding-a-build-configuration-file-to-your-project) 
