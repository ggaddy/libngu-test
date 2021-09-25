# libngu-test
Containerized testing for libngu

### build
`podman build -t libngu-test -f=linux-fedora.Dockerfile`

### run tests (2021-09-25 why doesnt this work?)
```
podman run -it libngu-test bash
bash-5.1# cd /tmp/libngu && make test
(cd ngu/ngu_tests; make tests)
make[1]: Entering directory '/tmp/libngu/ngu/ngu_tests'
test x != x		# need virtualenv
make[1]: *** [Makefile:5: tests] Error 1
make[1]: Leaving directory '/tmp/libngu/ngu/ngu_tests'
make: *** [Makefile:26: test] Error 2
```
