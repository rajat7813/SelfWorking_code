svn_revision=$1
echo "Using SVN revision $1 to tag Docker images"

cd /data/aws/wdts-web-for-ecs
cp /data/bamboo-home/xml-data/build-dir/EPCT-EPCT-JOB1/ePCTSharedLib/deploy/common-res.war ./
docker build -t wdts-web . --build-arg http_proxy=http://wcs.wipo.int:3128 --build-arg  https_proxy=http://wcs.wipo.int:3128
docker tag wdts-web:latest 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-web:latest 
docker tag wdts-web:latest 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-web:${svn_revision} 

cd /data/aws/wdts-business-for-ecs
docker build -t wdts-biz . --build-arg http_proxy=http://wcs.wipo.int:3128 --build-arg  https_proxy=http://wcs.wipo.int:3128
docker tag wdts-biz:latest 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-biz:latest 
docker tag wdts-biz:latest 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-biz:${svn_revision} 

cd /data/aws/wdts-notification-services-for-ecs
docker build -t wdts-notification . --build-arg http_proxy=http://wcs.wipo.int:3128 --build-arg  https_proxy=http://wcs.wipo.int:3128
docker tag wdts-notification:latest 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-notification:latest
docker tag wdts-notification:latest 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-notification:${svn_revision}

export  http_proxy=http://wcs.wipo.int:3128
export  https_proxy=http://wcs.wipo.int:3128
$(aws ecr get-login --no-include-email --region eu-central-1 --profile wdts-app-cicd)
docker push 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-web:latest 
docker push 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-web:${svn_revision} 

docker push 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-biz:latest 
docker push 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-biz:${svn_revision} 

docker push 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-notification:latest
docker push 770725503646.dkr.ecr.eu-central-1.amazonaws.com/wdts-app-notification:${svn_revision}

