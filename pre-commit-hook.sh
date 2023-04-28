# #!/bin/bash

# echo "Running pre-commit hook"

# BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD | sed 's/^refs\/heads\///')

# if ! [[ $BRANCH_NAME =~ ^(feature|hotfix)\/[a-z0-9]+-[0-9]+-[a-z0-9-]+(-[a-z0-9-]+)*$
#  ]]; then
#   echo "Invalid branch name [$BRANCH_NAME]. Branch name should be in the format of 'feature/{board-name}-{ticket-number}-{ticket-name}' or 'hotfix/{board-name}-{ticket-number}-{ticket-name}'"
#   exit 1
# fi

# exit 0


#!/bin/bash

echo "Running pre-commit hook"

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD | sed 's/^refs\/heads\///')

if [[ $BRANCH_NAME == "main" ]]; then
  # echo "Committing to main branch is allowed."
  exit 0
elif [[ $BRANCH_NAME =~ ^release\/[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  # echo "Committing to release branch is allowed."
  exit 0
elif ! [[ $BRANCH_NAME =~ ^(feature|hotfix)\/[a-z0-9]+-[0-9]+-[a-z0-9-]+(-[a-z0-9-]+)*$ ]]; then
  echo "Invalid branch name [$BRANCH_NAME]. Branch name should be in the format of 'feature/{board-name}-{ticket-number}-{ticket-name}' or 'hotfix/{board-name}-{ticket-number}-{ticket-name}'"
  exit 1
fi

exit 0
