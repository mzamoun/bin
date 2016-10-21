
Usage="
	$0 [maven_opts] pkg subpkg appName [deleteSrcJava=Y]
ex:
	$0 -X com.sqli wsj ws_jersey01 N
"

if (($#<3)); then echo "$Usage"; exit 1; fi

maven_opts=""
while $(echo $1 | grep "^-" >/dev/null 2>&1); do
	maven_opts="$maven_opts $1"
	shift
done

echo "
	maven_opts=$maven_opts
"

pkg=$1
subpkg=$2
appName=$3

deleteSrcJava=$4

archetypeGroupId=org.glassfish.jersey.archetypes
archetypeArtifactId=jersey-quickstart-grizzly2
archetypeVersion=2.23.2
version=0.1

mvn $maven_opts archetype:generate \
-DarchetypeGroupId=$archetypeGroupId -DarchetypeArtifactId=$archetypeArtifactId -DarchetypeVersion=$archetypeVersion \
-DgroupId=$pkg -Dpackage=$pkg.$subpkg -DartifactId=$appName -Dversion=$version \
-DinteractiveMode=false

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


