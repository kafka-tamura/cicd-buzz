#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo "Building docker container"
echo $TRAVIS_REPO_SLUG
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
echo "Pushing to docker"
echo $TRAVIS_REPO_SLUG
docker push $TRAVIS_REPO_SLUG