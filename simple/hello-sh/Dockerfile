FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

RUN env | sort && \
    microdnf install shadow-utils && \
    useradd -r -u 1000 -g 0 -m -d /home/appuser -s /bin/bash appuser && \
    microdnf clean all

USER appuser
WORKDIR /home/appuser
# set default executable for the container:
ENTRYPOINT ["/entrypoint.sh"]
# provide default arguments:
#CMD ["--default-arg"]