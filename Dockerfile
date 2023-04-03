FROM registry.dfmc.com.cn/datahub/trino:390
ARG RANGER_VERSION=2.3.0
COPY ranger/ranger-2.3.0-trino-plugin.tar.gz /root/
COPY ranger/install.properties /root/
RUN mkdir -p /root/$RANGER_VERSION
RUN tar xvf ${RANGER_VERSION}.tar.gz -C /root/${RANGER_VERSION} --strip-components 1 && \
    yes | cp -rf /root/install.properties /root/${RANGER_VERSION}/  && \
    /root/${RANGER_VERSION}/enable-trino-plugin.sh