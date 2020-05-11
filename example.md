# example

create rpm hello using rpmbuild.

```sh
docker build -t fedora -f ./fedora.dockerfile .
ocker run -it fedora /bin/bash
bash-4.3# hellow
bash: hellow: command not found
bash-4.3# hello
hello, world!
bash-4.3# exit
```
