# #!/bin/bash

# while read oldrev newrev refname; do
#   branch_name=$(echo $refname | cut -d/ -f3-)
#   pattern="^(feature|hotfix)\/[A-Za-z0-9_]+-[A-Za-z0-9_]+"

#   if [[ ! "$branch_name" =~ $pattern ]]; then
#     echo "Invalid branch name for $branch_name. Branch name should be in the format of 'feature/{ticket_name}-{issue-description}' or 'hotfix/{ticket_name}-{issue-description}'"
#     exit 1
#   fi
# done



#!/bin/bash

while read oldrev newrev refname
do
    branch=$(git rev-parse --symbolic --abbrev-ref $refname)

    if [[ "$branch" == "main" || "$branch" == "release/"* ]]; then
        continue
    fi

    if ! [[ "$branch" =~ ^(feature|hotfix)\/[a-z0-9]+-[0-9]+-[a-z0-9-]+(-[a-z0-9-]+)*$ ]]; then
        echo "Invalid branch name [$branch]. Branch name should be in the format of 'feature/{board-name}-{ticket-number}-{ticket-name}' or 'hotfix/{board-name}-{ticket-number}-{ticket-name}'"
        exit 1
    fi
done

exit 0
