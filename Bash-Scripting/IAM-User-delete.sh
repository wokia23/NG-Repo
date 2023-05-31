#!/bin/bash

user=Ansible-user
echo "User: $user"

user_policies=$(aws iam list-user-policies --user-name $user --query 'PolicyNames[*]' --output text)

echo "Deleting user policies: $user_policies"
for policy in $user_policies ;
do
  echo "aws iam delete-user-policy --user-name $user --policy-name $policy"
  aws iam delete-user-policy --user-name $user --policy-name $policy
done

user_attached_policies=$(aws iam list-attached-user-policies --user-name $user --query 'AttachedPolicies[*].PolicyArn' --output text)

echo "Detaching user attached policies: $user_attached_policies"
for policy_arn in $user_attached_policies ;
do
  echo "aws iam detach-user-policy --user-name $user --policy-arn $policy_arn"
  aws iam detach-user-policy --user-name $user --policy-arn $policy_arn
done

user_groups=$(aws iam list-groups-for-user --user-name $user --query 'Groups[*].GroupName' --output text)

echo "Detaching user attached group: $user_groups"
for group in $user_groups ;
do
  echo "aws iam remove-user-from-group --user-name $user --group-name $group"
  aws iam remove-user-from-group --user-name $user --group-name $group
done

user_access_keys=$(aws iam list-access-keys --user-name $user --query 'AccessKeyMetadata[*].AccessKeyId' --output text)

echo "Deleting user access keys: $user_accces_keys"
for key in $user_access_keys ;
do
  echo "aws iam delete-access-key --user-name $user --access-key-id $key"
  aws iam delete-access-key --user-name $user --access-key-id $key
done

echo "Deleting user login profile"
echo "aws iam delete-login-profile --user-name $user"
aws iam delete-login-profile --user-name $user

echo "Deleting user: $user"
echo "aws iam delete-user --user-name $user"
aws iam delete-user --user-name $user