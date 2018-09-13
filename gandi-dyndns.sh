#
# update gandi dns with box ip
# to be installed into crontab with contab -e
# add 0,15,30,45 * * * * ./gandi-dyndns.sh > /dev/null 2> /dev/null
#
curl -s  http://api.ipify.org | 
     xargs -I {} curl -H 'Content-type: application/json' \
                      -H 'x-api-key: XXXXXXXXXXXXXX' \
                      -X PUT \
                      -d '{ "rrset_ttl": 1800, "rrset_values": ["{}"] }' \
                       https://dns.api.gandi.net/api/v5/domains/my_domain.com/records/my_cname_entry/A
  
