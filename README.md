English | [简体中文](./README.zh-CN.md)
# vuepress-deploy ![visitor badge](https://count.jenkey2011.xyz/badge?id=jenkey2011.vuepress-deploy&label=page%20viewed)
A GitHub Action to build and deploy Vuepress sites to GitHub Pages

Telegram Group: [https://t.me/joinchat/Cz9TxNMrjIs3OWQ1](https://t.me/joinchat/Cz9TxNMrjIs3OWQ1)

QQ Group: 742434216

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

## Demo 
see: [https://github.com/jenkey2011/vuepress-deploy-demo](https://github.com/jenkey2011/vuepress-deploy-demo)

## Detail

The following guides are based on some shared assumptions:

- Source code repository(`vuepress-deploy-demo`), we call it `A`
- Target repository(`vuepress-deploy-demo-target`), we call it `B`

There are three situations. Each situation corresponds to a deployment file. 

- `A` TO `A:gh_pages`: `deploy-to-current-repo-gh_pages.yml`
- `A` TO `B:master`: `deploy-to-other-repo-master.yml`
- `A` TO `B:custom_branch`: `deploy-to-other-repo-custom_branch.yml`

**Here we can see:**

- The action: [https://github.com/jenkey2011/vuepress-deploy-demo/actions](https://github.com/jenkey2011/vuepress-deploy-demo/actions)

- `A` TO `A:gh_pages`: [https://github.com/jenkey2011/vuepress-deploy-demo/tree/gh_pages](https://github.com/jenkey2011/vuepress-deploy-demo/tree/gh_pages)

- `A` TO `B:master`:[https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/master](https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/master)

- `A` TO `B:custom_branch`:[https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/custom_branch](https://github.com/jenkey2011/vuepress-deploy-demo-target/tree/custom_branch)

- The GitHub Pages of the repository B： [https://jenkey2011.github.io/vuepress-deploy-demo-target/](https://jenkey2011.github.io/vuepress-deploy-demo-target/)

> Step-by-Step Guide , please see the [Step-by-Step](#step-by-step-guide)


## Parameters

|  Parameter |  Description | Type | Required
| :------------ | :------------ |:------------ |:------------ |
| `ACCESS_TOKEN` | Personal access token | `secrets`  |  **Yes** |
| `TARGET_REPO` | The repository you want to deploy. e.g.:`jenkey2011/blog`. Default: **current repository** | `env` | **No** |
| `TARGET_BRANCH` | The branch you want to deploy. e.g.:`gh-pages`.Default: **gh-pages** | `env` | **No** |
| `TARGET_LINK` | The full address of the target repo will cover `TARGET_REPO` for other platforms. e.g.:`https://user:${{ secrets.CODING_TOKEN }}@team.coding.net/team/repo.git`. | `env` | **No** |
| `BUILD_SCRIPT` | The script to build the vuepress project. e.g.: `yarn && yarn build` | `env` | **Yes** |
| `BUILD_DIR` | The output of the build-script above. e.g.: `blog/.vuepress/dist/` | `env` | **Yes** |
| `COMMIT_MESSAGE` | The commit message supplied when pushing new changes e.g.: `Auto deploy from Github Actions` | `env` | **No** |
| `CNAME` | Alias Record of your site. | `env` | **No** |


## Step-by-Step Guide

### Create a personal access token

click your profile icon > Settings > Developer settings > Personal access tokens > Generate new token > At least check `repo`. Then you will get a token, copy it.

### Creating encrypted secrets

Under your repository name, click  Settings > Secrets > Type `ACCESS_TOKEN` in the "Name" input box && the the personal access token as value.

### Create a workflow file
If you repo doesn't already have one, create a workflow file. You must store workflows in the `.github/workflows` directory in the root of your repository.

In `.github/workflows`, add a `.yml` or `.yaml` file for your workflow. For example, `.github/workflows/vuepress-deploy.yml`.

**For more information**:

1. [Triggering new workflows using a personal access token](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#triggering-new-workflows-using-a-personal-access-token)
2. [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets)
3. [Learn GitHub Actions](https://docs.github.com/en/actions/learn-github-actions)
