#!/bin/bash

#
# This script allows you to inspect the policies attached to a given user
#

aws sns list-topics | jq .

echo -n "Enter TopicArn> "
read topic

aws sns list-subscriptions-by-topic --topic-arn $topic | jq .
