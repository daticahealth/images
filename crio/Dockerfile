FROM datica/crio-build:v1.9.0 as build

RUN make binaries

FROM debian:jessie
RUN apt-get update && \
    apt-get install -y lvm2 && \
    apt-get install -y thin-provisioning-tools && \
    apt-get install -y kmod

COPY --from=build /lib/* /lib/

COPY --from=build /usr/lib/x86_64-linux-gnu/libgpgme.so.11.13.0 /lib/libgpgme.so.11
COPY --from=build /usr/lib/x86_64-linux-gnu/libassuan.so.0.4.2 /lib/libassuan.so.0

COPY --from=build /usr/bin/runc /usr/bin/runc

COPY --from=build /go/src/github.com/kubernetes-incubator/cri-o/bin/* /usr/local/bin/