#!/bin/bash
echo "192.168.0.149 bosh.sslip.io" >>/etc/hosts
cd cf-deployment
git checkout v0.4.0
bosh -n -d cf deploy \
  -o operations/bosh-lite.yml \
  --vars-store=deployment-vars.yml \
  -v system_domain=${DOMAIN}.nip.io \
  cf-deployment.yml
