#!/bin/sh

# Copyright 2015 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Install prerequisites.
apt-get update

apt-get install -y -q --no-install-recommends \
  curl ca-certificates make g++ sudo bash

# Install Fluentd.
/usr/bin/curl -sSL https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent3.sh | sh

# Change the default user and group to root.
# Needed to allow access to /var/log/docker/... files.
sed -i -e "s/USER=td-agent/USER=root/" -e "s/GROUP=td-agent/GROUP=root/" /etc/init.d/td-agent

td-agent-gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 0.26.3
td-agent-gem install --no-document fluent-plugin-rewrite-tag-filter -v 2.0.2
td-agent-gem install --no-document fluent-plugin-record-modifier -v 1.0.2
td-agent-gem install --no-document fluent-plugin-multi-format-parser -v 1.0.0
td-agent-gem install --no-document fluent-plugin-elasticsearch -v 2.10.0
td-agent-gem install --no-document fluent-plugin-s3 -v 1.1.2
td-agent-gem install --no-document fluent-plugin-systemd -v 0.3.1
td-agent-gem install --no-document fluent-plugin-copy_ex -v 0.1.0

# Remove docs and postgres references
rm -rf /opt/td-agent/embedded/share/doc \
  /opt/td-agent/embedded/share/gtk-doc \
  /opt/td-agent/embedded/lib/postgresql \
  /opt/td-agent/embedded/bin/postgres \
  /opt/td-agent/embedded/share/postgresql

apt-get remove -y make g++
apt-get autoremove -y
apt-get clean -y

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
