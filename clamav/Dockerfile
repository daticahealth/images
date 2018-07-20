FROM debian:stable

MAINTAINER Datica Admin <admin@datica.com>

ENV CLAMAV_VERSION 0.99.4

RUN echo "deb http://http.debian.net/debian/ stable main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://http.debian.net/debian/ stable-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/ stable/updates main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        clamav-daemon=${CLAMAV_VERSION}* \
        clamdscan=${CLAMAV_VERSION}* \
        clamav-freshclam=${CLAMAV_VERSION}* \
        libclamunrar7 \
        wget && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* && \
    wget -O /var/lib/clamav/main.cvd http://database.clamav.net/main.cvd && \
    wget -O /var/lib/clamav/daily.cvd http://database.clamav.net/daily.cvd && \
    wget -O /var/lib/clamav/bytecode.cvd http://database.clamav.net/bytecode.cvd && \
    chown clamav:clamav /var/lib/clamav/*.cvd && \
    mkdir /var/run/clamav && \
    chown clamav:clamav /var/run/clamav && \
    chmod 0770 /var/run/clamav && \
    mkdir /var/log/clamav/clamdscan && \
    chown clamav:clamav /var/log/clamav/clamdscan && \
    chmod 0770 /var/log/clamav/clamdscan && \
    sed -i 's/^Foreground .*$/Foreground true/g' /etc/clamav/clamd.conf && \
    sed -i 's/^Foreground .*$/Foreground true/g' /etc/clamav/freshclam.conf

ADD ./clamscan_hourly.sh /var/run/clamav
ADD ./run.sh /var/run/clamav
RUN chown clamav:clamav /var/run/clamav/clamscan_hourly.sh && \
    chmod 0770 /var/run/clamav/clamscan_hourly.sh && \
    ln /var/run/clamav/clamscan_hourly.sh /etc/cron.hourly/clamscan_hourly && \
    chown clamav:clamav /var/run/clamav/run.sh && \
    chmod 0770 /var/run/clamav/run.sh

CMD ["/var/run/clamav/run.sh"]
