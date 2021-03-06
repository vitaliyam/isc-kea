#!/bin/sh
set -e
KEACONF=/etc/kea/kea-ca.conf
KEABIN=/usr/bin/kea-ctrl-agent

check_config () {
if [ -f $KEACONF ]; then
  $KEABIN -t $KEACONF
  if [ $? -eq 0 ]; then
    echo "Check file $KEACONF [OK]"
  else
    echo "Error in test kea file $KEACONF"
    exit 1
  fi
fi
}

check_config

exec "$@"
