#!/bin/bash
echo "pre-cmmit hook running"
branch_name=$(git rev-parse --symbolic --abbrev-ref $1)
pattern="^(feature|hotfix)\/[A-Za-z0-9_]+-[A-Za-z0-9_]+"

if [[ ! "$branch_name" =~ $pattern ]]; then
  echo "Invalid branch name. Branch name should be in the format of 'feature/{ticket_name}-{issue-description}' or 'hotfix/{ticket_name}-{issue-description}'"
  exit 1
fi

