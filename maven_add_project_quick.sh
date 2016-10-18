
Usage="
	$0 pkg appName [deleteSrcJava=Y]
ex:
	$0 com.sql spring_boot_jms N
"

if (($#<2)); then echo "$Usage"; exit 1; fi

pkg=$1
appName=$2

deleteSrcJava=$3

mvn archetype:generate -DgroupId=$pkg.$appName -DartifactId=$appName -DarchetypeArtifactId=maven-archetype-quickstart -Dversion=0.1 -DinteractiveMode=false

mkdir $appName/src/main/resources
mkdir $appName/src/test/resources

if [ "$deleteSrcJava" == "Y" -o "$deleteSrcJava" == "" ]; then
	find $appName/src/main/java -name "*.java" -exec rm -f {} \;
	find $appName/src/test/java -name "*.java" -exec rm -f {} \;
fi

ls -R $appName

