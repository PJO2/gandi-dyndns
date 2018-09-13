# gandi-dyndns
How to update domain zones using gandi's APIs (shell only !)


## Quick Start : 
1. edit the script and replace :
   - [x] `XXX` by your api key (see https://doc.livedns.gandi.net/)
   - [x] `my_domain.com` by the domain you want to use
   - [x] `my_cname_entry` by the cname on which you want to apply dyndns
1. make the script executable
   - [x] chmod +x gandi-dyndns.sh
1. install the script into the crontab
   - [x] crontab -e
   - [x] 0,15,30,45 * * * * ./gandi-dyndns.sh > /dev/null 2> /dev/null
  

## How it works :
Step 1: get the Box IP address from http://api.ipify.org (this URL returns exactly the IPv4 address)  
Step 2: pipe to xargs to put the Box IP address into the {} pseudo-variable  
Step 3: use curl to call Gandi's API with following parameters:  

  | parameter | value |
  | ------ | ------ |
  | command | PUT (replace previous entries or create if needed) |
  | header |  content-type=application/json (required by API) |
  | header | x-api-key=`XXXX` (required from a security point of view) |
  | data | rsset_ttl = 1800, rrset_values='IP address' (see APIs documentation) |
  | path | /api/v5/domains/`my_domain.com`/records/`my_cname_entry`/A |

