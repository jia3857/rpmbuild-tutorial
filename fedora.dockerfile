FROM fedora:21

RUN yum update -y && \
    yum install -y rpm-build tar gcc sudo

# create rpmbuilder
RUN useradd rpmbuilder
USER rpmbuilder

# create working dir
RUN mkdir -p /home/rpmbuilder/hello-1.0
RUN mkdir -p /home/rpmbuilder/rpmbuild/{SOURCES,SPECS}
RUN chown rpmbuilder:rpmbuilder /home/rpmbuilder/rpmbuild/{SOURCES,SPECS}

# add source file
ADD ./hello.c /home/rpmbuilder/hello-1.0/hello.c
ADD ./hello.spec /home/rpmbuilder/rpmbuild/SPECS/hello.spec


# compile
WORKDIR /home/rpmbuilder/hello-1.0
RUN gcc -o hello hello.c && rm -rf hello.c

# packaging
WORKDIR /home/rpmbuilder/
RUN tar czvf hello-1.0.tar.gz hello-1.0 && \
    chmod 777 rpmbuild/SOURCES/ && \
    cp hello-1.0.tar.gz rpmbuild/SOURCES

# rpm create
WORKDIR /home/rpmbuilder/rpmbuild
RUN rpmbuild -bb -v SPECS/hello.spec

# install hello
USER root
RUN rpm -ivh RPMS/noarch/hello-1.0-1.noarch.rpm

CMD ["bin", "bash"]
