# A second version which does not use xargs (busybox's xargs does not support -I 
# 

( curl -s  http://api.ipify.org && echo ) | while read IP
  do
     curl -H 'Content-type: application/json' \
                      -H 'x-api-key: XXXXXXXXXX' \
                      -X PUT \
                      -d "{ \"rrset_ttl\": 1800, \"rrset_values\": [\"$IP\"] }" \
                      https://dns.api.gandi.net/api/v5/domains/<mydomain.com>/records/<my host>/A
