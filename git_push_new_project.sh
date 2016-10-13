SITE00=https://github.com/mzamoun

Usage="
	$0 README.md 
"
if (($#<1)); then echo "$Usage"; exit 1; fi

f=$1

if [ ! -e $f ]; then echo "$Usage"; exit 1; fi
if [ $f != "README.md" ]; then echo "$Usage"; exit 1; fi

git init
files=$(ls -a | egrep -v target )
echo " files to add :
  $files

? Enter=OK; n=taper files" ; read zz;

if [ "$zz" == "n" ]; then echo -n "files= "; fi; read files

git add $files 
git commit -m "first commit"

proj=$(basename $PWD)

git remote add origin $SITE00/$proj.git
git push -u origin master




