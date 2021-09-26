FROM registry.fedoraproject.org/fedora-minimal:34

# prepare dependencies and cleanup after to keep image small
RUN microdnf -y update && microdnf -y upgrade && microdnf clean all && rm -rf /var/cache/yum
RUN microdnf -y install git libffi-devel make automake libtool valgrind-devel openssl-devel && microdnf clean all && rm -rf /var/cache/yum

# clone libngu from source
RUN cd /tmp && git clone https://github.com/switck/libngu.git

# install libngu python dependencies
RUN python -m pip install --no-cache-dir -r /tmp/libngu/requirements.txt

# install submodules
RUN for d in /tmp/libngu/libs/* ; do cd $d && git submodule update --init . ; done

# make libngu
RUN cd /tmp/libngu && make min-one-time

## todo - make and verify tests
