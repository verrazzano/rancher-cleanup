FROM ghcr.io/oracle/oraclelinux:8-slim

ARG KUBERNETES_RELEASE=v1.21.12
WORKDIR /usr/local/bin

RUN microdnf update -y --setopt=install_weak_deps=0 --setopt=tsflags=nodocs && \
    microdnf install -y dnf && \
    microdnf install -y 'dnf-command(config-manager)' && \
    dnf config-manager --add-repo http://yum.oracle.com/repo/OracleLinux/OL8/olcne17/x86_64 && \
    microdnf install -y kubectl-1.26.10-2.el8.x86_64 && \
    microdnf clean all && \
    rm -rf /var/cache/yum /var/lib/rpm/*

COPY cleanup.sh /usr/local/bin/cleanup.sh
COPY verify.sh /usr/local/bin/verify.sh
RUN chmod +x /usr/local/bin/cleanup.sh /usr/local/bin/verify.sh

RUN mkdir /license
COPY README.md THIRD_PARTY_LICENSES.txt /license/

ENTRYPOINT ["/usr/local/bin/cleanup.sh"]
