
Usage="
	$0 [repo_name]
if repo_name  == ''; then repo_name = current dir.

"
if [ "$1" == "--help" -o "$1" == "-h" ]; then
	echo "$Usage"; exit 1
fi

 repo_name=$1

 dir_name=`basename $(pwd)`

 if [ "$repo_name" = "" ]; then
 repo_name=$dir_name
 echo "Repo name = '$dir_name'"
 fi

 username=`git config github.user`
 if [ "$username" = "" ]; then
 echo "Could not find username, run 'git config --global github.user <username>'"
 invalid_credentials=1
 fi

email=$(git config user.email)
if [ "$email" == "" ]; then
	echo " Could not find email, run 'git config --global user.email <email>'"
	invalid_credentials=1
fi

 if [ "$invalid_credentials" == "1" ]; then
	 exit 1
 fi

 echo -n "Creating Github repository '$repo_name' ..."
 curl -u "$username" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}' 
 echo " done."

