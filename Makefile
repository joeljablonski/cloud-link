REPO=joeljjablonski
NAME=cloud-link
VERSION=v1.0

TAG=${REPO}/${NAME}:${VERSION}

# build container
build:
	sudo docker build -t ${TAG} .

# push to dockerhub
push:
	sudo docker push ${TAG}
