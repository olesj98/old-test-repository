#!/bin/bash

branch_name_ibm=$1
branch_name_target=$2
# add new-origin pekao repo
git remote add new-origin https://github.com/olesj98/new-test-transfer.git
# checkout to target ibm branch
# git checkout $branch_name_ibm
# # pull from target ibm branch
# git pull
# create and checkout to new temporary local branch with pekao target name
git checkout -b $branch_name_target
# pull from ibm target branch
git pull --rebase origin $branch_name_ibm
# push to upstream new branch in pekao repo ??upstream??
git push -u new-origin $branch_name_target -f
# checkout to ibm target branch
git checkout $branch_name_ibm
# delete temporary pekao target branch
git branch -d $branch_name_target
