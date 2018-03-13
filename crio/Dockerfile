FROM datica/crio-build:latest as build

RUN make binaries

FROM alpine:latest
RUN apk update && \
    apk add lvm2 && \
    apk add thin-provisioning-tools

COPY --from=build /lib/* /lib/

COPY --from=build bin/* /usr/local/bin/