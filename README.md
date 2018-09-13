# gandi-dyndns
How to update domain zones using gandi's APIs (shell only !)


## Quick Start : 
edit the shell and replace :
  - [x] the api key
  - [x] the domain you want to use
  - [x] the cname on which you want to apply dyndns
  
  

## How it works :
Step 1: get the Box IP address from http://api.ipify.org (this URL returns exactly the IPv4 address)  
Step 2 : pipe to xargs to put the Box IP address into the {} pseudo-variable  
Step 3 : use curl to call Gandi's API with following parameters:  
  * command = PUT (replace previous entries or create if needed)
  * header: content-type=application/json (required by API)
  * header: x-api-key=XXXX (to be replaced - required from a security point of view)
  * data:  rsset_ttl = 1800, rrset_values='IP address' (see APIs documentation)
  * path = /api/v5/domains/<example.com>/records/<my entry>/A
  

