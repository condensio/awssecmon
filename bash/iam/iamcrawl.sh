#!/bin/bash

#
# This script allows you to inspect the policies attached to a given user
#

aws iam list-users --output=table

echo -n "Enter UserName> "
read user

aws iam list-attached-user-policies --user-name $user --output=json

echo -n "Enter PolicyArn> "
read arn

policy=`aws iam get-policy --policy-arn $arn`

echo $policy | jq .

version=`echo $policy | jq '.Policy.DefaultVersionId' | tr -d '"'`

aws iam get-policy-version --policy-arn  $arn  --version-id $version | jq .
