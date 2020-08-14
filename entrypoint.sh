#!/bin/sh

edge -M $MTU -a $ADDRESS -c $COMMUNITY -k $KEY -l $SUPERNODE

if [ -z "$PINGCHECK" ]; then
  sleep 1
else
  ping -w 10 -c 1 "$PINGCHECK" >/dev/null
  if [ $? -ne 0 ]; then
    echo "failed to ping host: $PINGCHECK"
    return 1
  fi
fi

exec $@
