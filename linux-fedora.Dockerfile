FROM registry.fedoraproject.org/fedora-minimal:34

# prepare dependencies
RUN microdnf -y update && microdnf -y upgrade && microdnf -y clean all
RUN microdnf -y install git libffi-devel make automake libtool valgrind-devel openssl-devel && microdnf -y clean all

# clone libngu from source
RUN cd /tmp && git clone https://github.com/switck/libngu.git

# install libngu python dependencies
RUN python -m pip install --no-cache-dir -r /tmp/libngu/requirements.txt

# install submodules
RUN for d in /tmp/libngu/libs/* ; do cd $d && git submodule update --init . ; done

# make libngu
RUN cd /tmp/libngu && make min-one-time

## todo - make and verify tests
