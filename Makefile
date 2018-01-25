image = arm-dev
workdir = /workdir

setup:
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker rmi --force multiarch/qemu-user-static:register

clean: rmi

build:
	docker build --rm -t $(image) .

rmi:
	docker rmi --force $(image)

shell: build
	docker run --rm \
		--interactive \
		--tty \
		--volume $(shell pwd):$(workdir) \
		--volume ~/.ssh:/root/.ssh \
		--volume ~/.vim:/root/.vim \
		--volume ~/.vimrc:/root/.vimrc \
		--volume ~/.git:/root/.git \
		--volume ~/.gitconfig:/root/.gitconfig \
		--workdir $(workdir) \
		$(image)
