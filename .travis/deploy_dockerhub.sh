#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
REPO_NAME=`echo $TRAVIS_REPO_SLUG | cut -d'/' -f2`
echo $REPO_NAME
docker build -f Dockerfile -t $DOCKER_USER/$REPO_NAME:$TAG .
docker push $DOCKER_USER/$REPO_NAME:$TAG
# docker push $TRAVIS_REPO_SLUG

