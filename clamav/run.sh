#!/bin/bash
/etc/init.d/cron start
freshclam -d -u root
