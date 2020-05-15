[English](./README.md) | 简体中文
# vuepress-deploy

自动构建、部署`vuepress`应用到Github Pages，自由设置仓库、分支

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

> 如果不了解`github workflow`什么的，看下面的[详细教程](#step-by-step-guide)

## 参数

|  参数 | 含义 | 类型 | 是否必须
| :------------ | :------------ |:------------ |:------------ |
| `ACCESS_TOKEN` | github的token | `secrets`  |  **是** |
| `TARGET_REPO` | 目标仓库，例： `jenkey2011/blog`。**默认当前仓库** | `env` | **否** |
| `TARGET_BRANCH` | 目标仓库的分支，例：`gh-pages`。**默认 gh-pages**| `env` | **否** |
| `TARGET_LINK` | 目标仓库的完整链接，会覆盖目标仓库，用于其他平台，例：`https://user:${{ secrets.CODING_TOKEN }}@team.coding.net/team/repo.git`| `env` | **否** |
| `BUILD_SCRIPT` | 构建脚本 例： `yarn && yarn build` | `env` | **是** |
| `BUILD_DIR` | 构建产物的目录 e.g.: `blog/.vuepress/dist/` | `env` | **是** |
| `CNAME` | Github Pages 站点别名 | `env` | **no** |
## 详细教程

### 创建token

点击你的头像 > Settings > Developer settings > Personal access tokens > Generate new token. 
权限至少要勾选`repo`，不清楚的，直接无脑全选就行~ 问题不大，不要慌。

详细信息看：[https://help.github.com/en/github/authenticating-to-github/authorizing-a-personal-access-token-for-use-with-saml-single-sign-on](https://help.github.com/en/github/authenticating-to-github/authorizing-a-personal-access-token-for-use-with-saml-single-sign-on)

### 创建secrets

你的vuepress项目源码仓库下 > Settings > Secrets， 创建`ACCESS_TOKEN`， 值就填写你刚才创建的token，确定。

### 创建一个任务文件

在项目根目录下，创建`.github/workflows`，然后再创建一个 `.yml`文件，名字随便取，例：`vuepress-deploy.yml`。

详细信息看：[https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow)

