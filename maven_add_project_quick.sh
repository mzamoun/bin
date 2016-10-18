
Usage="
	$0 pkg appName 
ex:
	$0 com.sql spring_boot_jms
"

if (($#<2)); then echo "$Usage"; exit 1; fi

pkg=$1
appName=$2

mvn archetype:generate -DgroupId=$pkg -DartifactId=$appName -DarchetypeArtifactId=maven-archetype-quickstart -Dversion=0.1 -DinteractiveMode=false

ls -R $appName

