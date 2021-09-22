#!/bin/bash
echo 'variable "AWS_Access_Key" { default = "'${AWS_Access_Key}'" }' >> amivar.tf
echo 'variable "AWS_Secret_Key" { default = "'${AWS_Secret_Key}'" }' >> amivar.tf
echo 'variable "AWS_Region" { default = "'${AWS_Region}'" }' >> amivar.tf
terraform init
terraform apply -auto-approve