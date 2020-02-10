English | [简体中文](./README.zh-CN.md)
# vuepress-deploy

A GitHub Action to build and deploy Vuepress sites to GitHub Pages

## Usage
Create `vuepress-deploy.yml` in the `.github/workflows` directory in the root of your repository.

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

The action will auto deploy the vuepress project when you push your code. Enjoy!!!

> Step-by-Step Guide , please see the [Step-by-Step](#step-by-step-guide)


## Parameters

|  Parameter |  Description | Type | Required
| :------------ | :------------ |:------------ |:------------ |
| `ACCESS_TOKEN` | Personal access token | `secrets`  |  **Yes** |
| `TARGET_REPO` | The repository you want to deploy. e.g.:`jenkey2011/blog`. Default: **current repository** | `env` | **No** |
| `TARGET_REPO` | The branch you want to deploy. e.g.:`github-pages`.Default: **github-pages** | `env` | **No** |
| `BUILD_SCRIPT` | The script to build the vuepress project. e.g.: `yarn && yarn build` | `env` | **Yes** |
| `BUILD_DIR` | The output of the build-script above. e.g.: `blog/.vuepress/dist/` | `env` | **Yes** |


## Step-by-Step Guide

### Create a personal access token

click your profile icon > Settings > Developer settings > Personal access tokens > Generate new token > At least check `repo`. Then you will get a token, copy it.


For more information: [https://help.github.com/en/github/authenticating-to-github/authorizing-a-personal-access-token-for-use-with-saml-single-sign-on](https://help.github.com/en/github/authenticating-to-github/authorizing-a-personal-access-token-for-use-with-saml-single-sign-on)

### Creating encrypted secrets

Under your repository name, click  Settings > Secrets > Type `ACCESS_TOKEN` in the "Name" input box && the the personal access token as value.

For more information: [https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)

### Create a workflow file
If you repo doesn't already have one, create a workflow file. You must store workflows in the `.github/workflows` directory in the root of your repository.

In `.github/workflows`, add a `.yml` or `.yaml` file for your workflow. For example, `.github/workflows/vueoress-deploy.yml`.


For more information: [https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow)