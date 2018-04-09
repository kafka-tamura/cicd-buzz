#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
REPO_NAME=`echo $TRAVIS_REPO_SLUG | cut -d'/' -f2`
echo $REPO_NAME
docker push $DOCKER_USER/$REPO_NAME
# docker push $TRAVIS_REPO_SLUG