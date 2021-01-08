#!/bin/bash

yum install httpd -y
chkconfig httpd on
yum update -y
shutdown -r now
