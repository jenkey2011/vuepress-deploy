#!/bin/sh

set -e

echo '' # see https://github.com/actions/toolkit/issues/168

# Build vuepress project
echo "==> Start building \n $BUILD_SCRIPT"
eval "$BUILD_SCRIPT"
echo "Build success"

# Change directory to the dest
echo "==> Changing directory to '$BUILD_DIR' ..."
cd $BUILD_DIR

# Get respository
if [[ -z "$TARGET_REPO" ]]; then
  REPOSITORY_NAME="${GITHUB_REPOSITORY}"
else
  REPOSITORY_NAME="$TARGET_REPO"
fi

# Get branch
if [[ -z "$TARGET_BRANCH" ]]; then
  DEPLOY_BRAN="gh-pages"
else
  DEPLOY_BRAN="$TARGET_BRANCH"
fi

# Final repository
DEPLOY_REPO="https://${ACCESS_TOKEN}@github.com/${REPOSITORY_NAME}.git"

echo "==> Prepare to deploy"

git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

if [ -z "$(git status --porcelain)" ]; then
    echo "The BUILD_DIR is setting error or nothing produced" && \
    echo "Exiting..."
    exit 0
fi

# Generate a CNAME file
if [ "$CNAME" ]; then
  echo "Generating a CNAME file..."
  echo $CNAME > CNAME
fi

echo "==> Starting deploying"

git add .
git commit -m 'Auto deploy'
git push --force $DEPLOY_REPO master:$DEPLOY_BRAN
rm -fr .git

cd $GITHUB_WORKSPACE

echo "Successfully deployed!" && \
echo "See: https://github.com/$REPOSITORY_NAME/tree/$DEPLOY_BRAN"
