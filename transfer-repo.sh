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

# ########################################################
# branch=$1
# branch_compare=$2

# for commit in $(git rev-list $branch_compare..$branch)
# do
#     echo $commit
#     # if git ls-tree --name-only -r $commit; then
#         # exit 0
#     # fi
# done

# ########################################################
# git rev-list $branch_compare..$branch --format="%h - %ad - %s" --date=format:'%b %d %Y'
# ########################################################

# # add the old repo as a remote repository 
# git remote add oldrepo https://github.com/olesj98/new-test-transfer.git

# # get the old repo commits
# git remote update

# # examine the whole tree
# git log --all --oneline --graph --decorate

# # copy (cherry-pick) the commits from the old repo into your new local one
# git cherry-pick sha-of-commit-one
# git cherry-pick sha-of-commit-two
# git cherry-pick sha-of-commit-three

# # check your local repo is correct
# git log

# # send your new tree (repo state) to github
# git push origin master

# # remove the now-unneeded reference to oldrepo
# git remote remove oldrepo
# ########################################################
branch=$1
branch_target=$2

git remote add -f repo_b_origin https://github.com/olesj98/new-test-transfer.git
git remote update
# git rev-list remotes/repo_b_origin/master..master --format="%h - %ad - %s" --date=format:'%b %d %Y'
# git diff remotes/repo_b_origin/master master
for commit in $(git rev-list remotes/repo_b_origin/$branch_target..$branch)
do
    echo $commit
    git cherry-pick $commit
    git push repo_b_origin $branch_target
done
git cherry-pick --continue
git remote rm repo_b_origin