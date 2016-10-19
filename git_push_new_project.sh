. ~/bin/mz_env.sh

if [ "$URL_GIT_BASE" == "" ]; then echo " URL_GIT_BASE est vide; you must source your mz_env.sh before."; exit 1; fi

Usage="
	You must have README.md 
"
f=README.md

if [ ! -e $f ]; then echo "$Usage"; exit 1; fi

git init
files=$(ls -a | awk 'BEGIN {s=""} { if (NR>2 && $1 != ".git" && $1 != "target" && $1 != ".settings" ) {s = s " " $1;}  } END {print s}')
echo " files to add :
  $files

? Enter=OK; Or taper list of files" ; read zz;

if [ "$zz" != "" ]; then files=$zz; fi;

git add $files 
git commit -m "first commit"

proj=$(basename $PWD)

git remote add origin $URL_GIT_BASE/$proj.git
git push -u origin master




