Usage="
	$0 msg files
"

if (($#<2)); then echo "$Usage"; exit 1; fi

msg=$1
shift
files=$*

git add $files

git commit -m "$msg"

git push

