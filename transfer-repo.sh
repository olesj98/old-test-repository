#!/bin/bash
# Sometimes you need to move your existing git repository
# to a new remote repository (/new remote origin).
# Here are a simple and quick steps that does exactly this.
#
# Let's assume we call "old repo" the repository you wish
# to move, and "new repo" the one you wish to move to.
#
### Step 1. Make sure you have a local copy of all "old repo"
### branches and tags.
# Fetch all of the remote branches and tags:
# git fetch origin

# View all "old repo" local and remote branches:
# git branch -a

# If some of the remotes/ branches doesn't have a local copy,
# checkout to create a local copy of the missing ones:
# git checkout -b <branch> origin/<branch>

# Now we have to have all remote branches locally.
branch_name_ibm=$1
branch_name_target=$2

git checkout $branch_name_ibm
git pull

### Step 2. Add a "new repo" as a new remote origin:
git remote add new-origin https://github.com/olesj98/new-test-transfer.git

# git push -u new-origin BRANCHNAME -f
git checkout -b $branch_name_target
git push -u new-origin $branch_name_target -f
git branch -d $branch_name_target
# git push new-origin $branch_name_target -f
### Step 3. Push all local branches and tags to a "new repo".
# Push all local branches (note we're pushing to new-origin):
# ====
# git branch -D master

# git push -f new-origin master
# ====

# Push all tags:
# git push --tags new-origin


### Step 4. Remove "old repo" origin and its dependencies.
# View existing remotes (you'll see 2 remotes for both fetch and push)
# git remote -v

# Remove "old repo" remote:
# git remote rm origin

# Rename "new repo" remote into just 'origin':
# git remote rename new-origin origin


### Done! Now your local git repo is connected to "new repo" remote
### which has all the branches, tags and commits history.