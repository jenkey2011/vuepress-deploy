[English](./README.md) | 简体中文
# vuepress-deploy ![visitor badge](https://count.jenkey2011.xyz/badge?id=jenkey2011.vuepress-deploy&label=page%20viewed)

自动构建、部署`vuepress`应用到Github Pages，自由设置仓库、分支

电报群: [https://t.me/joinchat/Cz9TxNMrjIs3OWQ1](https://t.me/joinchat/Cz9TxNMrjIs3OWQ1)

QQ群: 742434216

## 使用
在你项目仓库`.github/workflows`目录下创建一个 `.yml`文件，举例：`vuepress-deploy.yml`。

内容：

```yml
name: Build and Deploy
on: [push]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master

    - name: vuepress-deploy
      uses: jenkey2011/vuepress-deploy@master
      env:
        ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
        TARGET_REPO: username/repo
        TARGET_BRANCH: master
        BUILD_SCRIPT: yarn && yarn build
        BUILD_DIR: blog/.vuepress/dist/
```
上述配置的结果是：每次推送代码，将自动构建、部署到`username/repo`的`master`分支。就是这么简单~

## 示例

示例代码库: [https://github.com/jenkey2011/vuepress-deploy-demo](https://github.com/jenkey2011/vuepress-deploy-demo)

### 实例说明

两个库

- 源码库(`vuepress-deploy-demo`), 我们称为 `A`
- 部署目标代码库(`vuepress-deploy-demo-target`), 我们称为 `B`

共有三种部署情况，配置文件分别如下：

- `A` TO `A:gh_pages`: `deploy-to-current-repo-gh_pages.yml`
- `A` TO `B:master`: `deploy-to-other-repo-master.yml`
- `A` TO `B:custom_branch`: `deploy-to-other-repo-custom_branch.yml`

**在这看部署后的效果:**

- 流水线编译过程: [https://github.com/jenkey2011/vuepress-deploy-demo/actions](https://github.com/jenkey2011/vuepress-deploy-demo/actions)

- `A` TO `A:gh_pages`: [https://github.com/jenkey2011/vuepress-deploy-demo/tree/gh_pages](https://github.com/jenkey2011/vuepress-deploy-demo/tree/gh_pages)

- `A` TO `B:master`:[https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/master](https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/master)

- `A` TO `B:custom_branch`:[https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/custom_branch](https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/custom_branch)

- `B`仓库`Git-page`效果： [https://jenkey2011.github.io/vuepress-deploy-demo-target/](https://jenkey2011.github.io/vuepress-deploy-demo-target/)

> 如果不了解`github workflow`什么的，看下面的[详细教程](#step-by-step-guide)

## 参数

|  参数 | 含义 | 类型 | 是否必须
| :------------ | :------------ |:------------ |:------------ |
| `ACCESS_TOKEN` | github的token | `secrets`  |  **是** |
| `TARGET_REPO` | 目标仓库，例： `jenkey2011/blog`。**默认当前仓库** | `env` | **否** |
| `TARGET_BRANCH` | 目标仓库的分支，例：`gh-pages`。**默认 gh-pages**| `env` | **否** |
| `TARGET_LINK` | 目标仓库的完整链接，会覆盖目标仓库，用于其他平台，例：`https://user:${{ secrets.CODING_TOKEN }}@team.coding.net/team/repo.git`| `env` | **否** |
| `BUILD_SCRIPT` | 构建脚本 例： `yarn && yarn build` | `env` | **是** |
| `BUILD_DIR` | 构建产物的目录 例： `blog/.vuepress/dist/` | `env` | **是** |
| `COMMIT_MESSAGE` | 自动部署时的提交信息 例： `Auto deploy from Github Actions` | `env` | **否** |
| `CNAME` | Github Pages 站点别名 | `env` | **否** |
## 详细教程

### 创建token

点击你的头像 > Settings > Developer settings > Personal access tokens > Generate new token. 
权限至少要勾选`repo`，不清楚的，直接无脑全选就行~ 问题不大，不要慌。

### 创建secrets

你的vuepress项目源码仓库下 > Settings > Secrets， 创建`ACCESS_TOKEN`， 值就填写你刚才创建的token，确定。

### 创建一个任务文件

在项目根目录下，创建`.github/workflows`，然后再创建一个 `.yml`文件，名字随便取，例：`vuepress-deploy.yml`。

**详细信息**：

1. [使用个人访问令牌触发新工作流程](https://docs.github.com/cn/actions/reference/events-that-trigger-workflows#triggering-new-workflows-using-a-personal-access-token)
2. [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets)
3. [了解 GitHub Actions](https://docs.github.com/cn/actions/learn-github-actions)

## 赞助~

![r121mt.png](https://s3.ax1x.com/2020/12/17/r8pO4f.png)
