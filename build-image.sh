#!/bin/bash

PREFIX=$1
VERSION=`grep VERSION weed/util/constants.go | awk '{print $3}' | sed 's/\"//g'`
BRANCH=master #`git symbolic-ref --short -q HEAD`
BUILD=`git rev-parse --short HEAD`

make
cp weed/weed docker
cd docker && docker build . -t ${PREFIX}/seaweedfs:v${VERSION}-${BRANCH}-${BUILD}