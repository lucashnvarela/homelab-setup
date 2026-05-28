#!/bin/bash

host="$1"

sequence_id=$(echo -n $host | sha256sum | cut -c1-12)

curl -sS \
  -H "Priority: urgent" \
  -H "Title: Upstream Unhealthy [${HOSTNAME}]" \
  -d "Host \"${host}\" health_status: unhealthy" \
  -u :${NTFY_TOKEN} \
  "https://ntfy.${DOMAIN}/${NTFY_TOPIC}/${sequence_id}"
