#!/bin/sh
docker run \
	--rm \
	-v "$HOME"/.docker/config.json:/kaniko/.docker/config.json:ro \
	-v /home/solaris/kaniko:/workspace \
	gcr.io/kaniko-project/executor:latest \
	--dockerfile /workspace/Dockerfile \
	--destination "volobuev/mtbt:0.0.1" \
	--context "dir:///workspace/"
