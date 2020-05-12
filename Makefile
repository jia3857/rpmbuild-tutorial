DOCKER_ARG := --network=host

ALL: build

build:
	rm -f hello-1.0-1.noarch.rpm
	docker build $(DOCKER_ARG) -t fedora -f ./fedora.dockerfile .
	#docker cp $(docker create fedora):/home/rpmbuilder/rpmbuild/RPMS/noarch/hello-1.0-1.noarch.rpm hello-1.0-1.noarch.rpm
	docker cp $$(docker create fedora):/home/rpmbuilder/rpmbuild/RPMS/noarch/hello-1.0-1.noarch.rpm hello-1.0-1.noarch.rpm
