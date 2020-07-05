#/bin/bash
echo "Enter in github repo owner: e.g https://github.com/OWNEROFREPO/REPO"
read OWNER
echo "OWNER: $OWNER"
echo "Enter in github repo name"
read REPO

NEW_URL="git@github.com:$OWNER/$REPO.git"


CHANGE_CMD="git remote set-url origin $NEW_URL"
`$CHANGE_CMD`

if [ $? -eq 0 ]
then
	echo "Success"
else
	echo "Failed"
fi
