BRANCH_NAME="hotfix0/FooBa123-baz123"
if ! [[ $BRANCH_NAME =~ ^(feature|hotfix)\/[A-Za-z0-9_]+-[A-Za-z0-9_]+ ]]; then echo "Invalid branch name"; fi

