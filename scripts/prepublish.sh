CURRENT_GIT_TAG=`git describe`
CURRENT_VERSION_PARTS=(${CURRENT_GIT_TAG//./. })

echo "Running script before publish ..."

VNUM1=${CURRENT_VERSION_PARTS[0]}
VNUM2=${CURRENT_VERSION_PARTS[1]}
VNUM3=${CURRENT_VERSION_PARTS[2] + 1})
NEW_GIT_TAG="$VNUM1.$VNUM2.$VNUM3"

echo "Updating tag to ${NEW_GIT_TAG} ..."

echo "Building ..."
npm run build

echo "Setting npm package version ..."
npm version ${NEW_GIT_TAG}

echo "Setting git tag ..."
git tag -a ${NEW_GIT_TAG} - m "see CHANGELOG.md for version ${NEW_GIT_TAG}"

echo "Pushing to git ..."
git push --tags
git push