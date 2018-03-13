FROM datica/crio-build:latest as build

RUN make binaries

FROM debian:jessie
RUN apt-get update && \
    apt-get install lvm2 && \
    apt-get install thin-provisioning-tools

COPY --from=build /lib/* /lib/

COPY --from=build bin/* /usr/local/bin/