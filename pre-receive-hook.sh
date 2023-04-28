#!/bin/bash

while read oldrev newrev refname; do
  branch_name=$(echo $refname | cut -d/ -f3-)
  pattern="^(feature|hotfix)\/[A-Za-z0-9_]+-[A-Za-z0-9_]+"

  if [[ ! "$branch_name" =~ $pattern ]]; then
    echo "Invalid branch name for $branch_name. Branch name should be in the format of 'feature/{ticket_name}-{issue-description}' or 'hotfix/{ticket_name}-{issue-description}'"
    exit 1
  fi
done

