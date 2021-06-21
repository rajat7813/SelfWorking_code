###src=/data/bamboo-home/xml-data/build-dir/COMMON-CL-JOB1/mvn-repository/org/wipo/epct
###above is for devsrv3, below is for devsrv4
###src=/home/khodja/data/mvn-repo/org/wipo/epct
###ePCT Fast Track uses old maven repo, ePCT deployment and Branch use new 3.5.2 repo
###src=/home/khodja/data/mvn-repo-3.6.0/org/wipo/epct
src=/data2/mvn-repo-3.6.0/org/wipo/epct
####################################src=/home/khodja/data/mvn-repo-epct/org/wipo/epct

###version is a parameter passed from Bamboo, i.e: 4.0, 4.1, 4.2, .....
version=$1

rm ./ePCTSharedLib/deploy/*

for jar in $(find $src -name '*-'${version}'-SNAPSHOT-classes.jar')
do
   echo "copying $jar from maven repository to deploy/"
   final=$(echo $jar | sed 's/.*\///' | sed 's/-'${version}'-SNAPSHOT-classes.jar/.jar/')
   cp $jar ./ePCTSharedLib/deploy/$final
done

for jar in $(find $src -name '*-'${version}'-SNAPSHOT.jar')
do
   echo "copying $jar from maven repository to deploy/"
   final=$(echo $jar | sed 's/.*\///' | sed 's/-'${version}'-SNAPSHOT.jar/.jar/')
   cp $jar ./ePCTSharedLib/deploy/$final
done

for ear in $(find $src -name '*-'${version}'-SNAPSHOT.ear')
do
   echo "copying $ear from maven repository to deploy/"
   final=$(echo $ear | sed 's/.*\///' | sed 's/-'${version}'-SNAPSHOT.ear/.ear/')
   cp $ear ./ePCTSharedLib/deploy/$final
done

for war in $(find $src -name '*-'${version}'-SNAPSHOT.war')
do
   echo "copying $war from maven repository to deploy/"
   final=$(echo $war | sed 's/.*\///' | sed 's/-'${version}'-SNAPSHOT.war/.war/')
   cp $war ./ePCTSharedLib/deploy/$final
done

#cp ./PCTSC-web/target/ePCTforIB.war  ./ePCTSharedLib/deploy/ePCTforIB.war || true
#cp ./ePCTFilingReceiver/target/ePCTFilingReceiver*.war  ./ePCTSharedLib/deploy/ || true

cp ./PCTSC-web/target/ePCTforIB.war  ./ePCTSharedLib/deploy/ePCTforIB.war 
cp ./ePCTFilingReceiver/target/ePCTFilingReceiver*.war  ./ePCTSharedLib/deploy/ 

