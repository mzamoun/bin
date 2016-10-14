SITE00=https://github.com/mzamoun

Usage="
	You must have README.md 
"
f=README.md

if [ ! -e $f ]; then echo "$Usage"; exit 1; fi

git init
files=$(ls -a | awk 'BEGIN {s=""} { if (NR>2 && $1 != ".git" && $1 != "target") {s = s " " $1;}  } END {print s}')
echo " files to add :
  $files

? Enter=OK; n=taper files" ; read zz;

if [ "$zz" == "n" ]; then echo -n "files= "; fi; read files

git add $files 
git commit -m "first commit"

proj=$(basename $PWD)

git remote add origin $SITE00/$proj.git
git push -u origin master




