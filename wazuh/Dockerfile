FROM wazuh/wazuh:3.6.1_6.4.1

RUN apt-get update && apt-get install -y libsasl2-modules

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/entrypoint.sh"]