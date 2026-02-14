#!/bin/bash

git pull

if [ "$(git rev-list --count HEAD ^$(git describe --tags --abbrev=0))" -gt 0 ]; then
    TAG="v$(date +%Y%m%d%H%M)"
    git tag -a "$TAG" -m "Auto release $TAG"
    git push origin "$TAG"
else
    echo "No new commits since last tag"
fi
