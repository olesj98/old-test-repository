#!/bin/bash

# branch_name_ibm=$1
# branch_name_target=$2
# # add new-origin pekao repo (one time action)
# git remote add new-origin https://github.com/olesj98/new-test-transfer.git
# # checkout to target ibm branch
# # git checkout $branch_name_ibm
# # # pull from target ibm branch
# # git pull
# # create and checkout to new temporary local branch with pekao target name
# git checkout -b $branch_name_target
# # pull from ibm target branch
# git pull origin $branch_name_ibm
# # push to upstream new branch in pekao repo ??upstream??
# git push -u new-origin $branch_name_target
# # checkout to ibm target branch
# git checkout $branch_name_ibm
# # delete temporary pekao target branch
# git branch -d $branch_name_target

branch=$1
branch_compare=$2

# for commit in $(git rev-list HEAD)
# do
#     echo $commit
#     # if git ls-tree --name-only -r $commit; then
#         # exit 0
#     # fi
# done

git log $branch..$branch_compare --format="%h - %ad - %s" --date=format:'%b %d %Y'