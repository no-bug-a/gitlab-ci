#!/bin/bash

commitId=$(git rev-parse --short HEAD)
gitUrl=$(git remote get-url origin)
tagName=$(date '+%y%m%d-%H%M')-${commitId}

#获取git仓库 信息
if [[ $gitUrl == git@git* ]]; then
   gitRepositry=${gitUrl//git@git/reg}
   gitRepositry=${gitRepositry//://}
else
   gitRepositry=${gitUrl/https:\/\/git/reg}
fi

gitRepositry=${gitRepositry%.git}

appName=${gitRepositry##*/}

tarName=$appName${tagName}.tar

imageName=$appName:${tagName}

echo 'imageName--------------------->  '$imageName


mvn clean package docker:build -DskipTests -Dimage.taggedName=$imageName

docker rm -f $appName

docker run -d --name $appName -p 33000:33000 $imageName
