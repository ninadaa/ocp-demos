FROM registry.access.redhat.com/ubi9/ubi-minimal

RUN useradd -m -s /bin/bash appuser

USER appuser
WORKDIR /home/appuser
RUN id && \
    env && \
    while true; do echo "Hello from container"; sleep 30; done