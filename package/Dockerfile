FROM ghcr.io/oracle/oraclelinux:7-slim

ARG KUBERNETES_RELEASE=v1.21.12
WORKDIR /usr/local/bin

RUN yum-config-manager --enable ol7_optional_latest && \
    yum-config-manager --enable ol7_addons

RUN yum update -y && \
    yum install -y bash curl \
    yum-config-manager --add-repo https://yum.oracle.com/repo/OracleLinux/OL7/olcne15/x86_64/ && \
    yum install -y kubectl-1.23.11-1.el7.x86_64 \
    yum clean all

COPY cleanup.sh /usr/local/bin/cleanup.sh
COPY verify.sh /usr/local/bin/verify.sh
RUN chmod +x /usr/local/bin/cleanup.sh /usr/local/bin/verify.sh

RUN mkdir /license
COPY README.md THIRD_PARTY_LICENSES.txt /license/

ENTRYPOINT ["/usr/local/bin/cleanup.sh"]
