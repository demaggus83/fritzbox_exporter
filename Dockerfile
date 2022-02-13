FROM scratch

ARG TARGETARCH

ENV USERNAME username
ENV PASSWORD password
ENV GATEWAY_URL http://fritz.box:49000
ENV LISTEN_ADDRESS 0.0.0.0:9042

EXPOSE 9042

WORKDIR /app
COPY metrics.json metrics-lua.json ./
COPY dist/go_multiarch_linux_$TARGETARCH/go_multiarch /fritzbox_exporter

CMD ./fritzbox_exporter -username $USERNAME -password $PASSWORD -gateway-url ${GATEWAY_URL} -listen-address ${LISTEN_ADDRESS}
