
Usage="
	$0 pkg subpkg appName [deleteSrcJava=Y]
ex:
	$0 com.sql jms spring_boot_jms N
"

if (($#<3)); then echo "$Usage"; exit 1; fi

pkg=$1
subpkg=$2
appName=$3

deleteSrcJava=$4

mvn archetype:generate -DgroupId=$pkg.$subpkg -DartifactId=$appName -DarchetypeArtifactId=maven-archetype-quickstart -Dversion=0.1 -DinteractiveMode=false

echo "
	# $appName 
" > README.md

mkdir $appName/src/main/resources
mkdir $appName/src/test/resources

if [ "$deleteSrcJava" == "Y" -o "$deleteSrcJava" == "" ]; then
	find $appName/src/main/java -name "*.java" -exec rm -f {} \;
	find $appName/src/test/java -name "*.java" -exec rm -f {} \;
fi

ls -R $appName

echo -n " 
	Voulez vous le githuber ? Y/n " ; read zz

if [ "$zz" != "n" ]; then 
	cd $appName
	git_store_credential.sh
	git_add_new_repo_to_github.sh 
fi


