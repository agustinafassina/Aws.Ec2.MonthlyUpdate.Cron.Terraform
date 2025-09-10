#!/bin/bash
sudo yum install -y jq

sudo yum update -y

sudo yum update --security
/bin/echo "It is okey" > /var/log/update-instance.log

exit 0