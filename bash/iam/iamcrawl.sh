#!/bin/bash

#
# This script allows you to inspect the policies attached to a given user
#


echo "--> Listing all users"

aws iam list-users --output=text

echo "--> Dumping policies for a user"

echo -n "Enter User> "
read user

aws iam list-attached-user-policies --user-name $user --output=text

echo "--> Dumping policy info"

echo -n "Enter ARN> "
read arn

aws iam get-policy --policy-arn $arn 


echo -n "Enter Policy Version> "
read version

aws iam get-policy-version --policy-arn  $arn  --version-id $version
