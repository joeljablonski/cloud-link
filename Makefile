VERSION=v1.2
IMAGE_NAME=cloud-link
DOCKER_USERNAME=blockywire

TAG=${DOCKER_USERNAME}/${IMAGE_NAME}:${VERSION}

build:
	sudo docker build -t ${TAG} .

run:
	sudo docker run --rm --privileged -it \
	-v ${PWD}:/code \
	-w /code \
	--network host \
	${TAG}

login:
	sudo docker login -u ${DOCKER_USERNAME}

push:
	sudo docker push ${TAG}
	sudo rm $(HOME)/.docker/config.json

commit:
	git add .
	git commit -m '${m}'
	git push