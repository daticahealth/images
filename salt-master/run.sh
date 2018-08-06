#!/bin/bash
if [ "$SALT_MASTER_OF_MASTERS" = "True" ]; then
  service salt-syndic start
fi
/usr/bin/salt-master --log-level info
