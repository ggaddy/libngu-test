FROM registry.fedoraproject.org/fedora-minimal:34

# prepare dependencies
RUN microdnf -y update && microdnf -y upgrade
RUN microdnf -y install git libffi-devel make automake libtool valgrind-devel openssl-devel

# clone libngu from source
RUN cd /tmp && git clone https://github.com/switck/libngu.git

# install libngu python dependencies
RUN python -m pip install -r /tmp/libngu/requirements.txt

# install submodules
RUN cd /tmp/libngu/libs/cifra && git submodule update --init .
RUN cd /tmp/libngu/libs/secp256k1 && git submodule update --init .

# make libngu
RUN cd /tmp/libngu && make min-one-time

## todo - make and verify tests
