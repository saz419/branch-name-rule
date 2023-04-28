#!/bin/bash

echo "Running pre-commit hook"

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD | sed 's/^refs\/heads\///')

echo "Branch name: $BRANCH_NAME"

if ! [[ $BRANCH_NAME =~ ^(feature|hotfix)\/[a-z0-9]+-[0-9]+-[a-z0-9-]+(-[a-z0-9-]+)*$
 ]]; then
  echo "Invalid branch name. Branch name should be in the format of 'feature/{ticket_name}-{issue-description}' or 'hotfix/{ticket_name}-{issue-description}'"
  exit 1
fi

exit 0
