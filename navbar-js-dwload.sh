navbar_dev_dir=/data/epct/navbar/dev
navbar_dev_appDisplay_dir=/data/epct/navbar/dev/appDisplay
navbar_dev_appKeywords_dir=/data/epct/navbar/dev/appKeywords
navbar_dev_common_dir=/data/epct/navbar/dev/common
mkdir -p $navbar_dev_appDisplay_dir
mkdir -p $navbar_dev_appKeywords_dir
mkdir -p $navbar_dev_common_dir
navbar_acc_dir=/data/epct/navbar/acc
navbar_acc_appDisplay_dir=/data/epct/navbar/acc/appDisplay
navbar_acc_appKeywords_dir=/data/epct/navbar/acc/appKeywords
navbar_acc_common_dir=/data/epct/navbar/acc/common
mkdir -p $navbar_acc_appDisplay_dir
mkdir -p $navbar_acc_appKeywords_dir
mkdir -p $navbar_acc_common_dir
navbar_prd_dir=/data/epct/navbar/prd
navbar_prd_appDisplay_dir=/data/epct/navbar/prd/appDisplay
navbar_prd_appKeywords_dir=/data/epct/navbar/prd/appKeywords
navbar_prd_common_dir=/data/epct/navbar/prd/common
mkdir -p $navbar_prd_appDisplay_dir
mkdir -p $navbar_prd_appKeywords_dir
mkdir -p $navbar_prd_common_dir

cd $navbar_dev_dir
rm *
for resource in \
  https://www3dev.wipo.int/webcomponents/polyfills/bundles/webcomponents-ce.js \
  https://www3dev.wipo.int/webcomponents/polyfills/bundles/webcomponents-sd.js \
  https://www3dev.wipo.int/webcomponents/polyfills/bundles/webcomponents-sd-ce.js \
  https://www3dev.wipo.int/webcomponents/polyfills/bundles/webcomponents-sd-ce-pf.js \
  https://www3dev.wipo.int/webcomponents/polyfills/custom-elements-es5-adapter.js \
  https://www3dev.wipo.int/webcomponents/polyfills/polyfill-ie11.js \
  https://www3dev.wipo.int/webcomponents/polyfills/webcomponents-loader.js \
  https://www3dev.wipo.int/webcomponents/polyfills/webcomponents-loader-v2.js \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/wipo-navbar.js \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/wipo-navbar-comp.js \
  https://www3dev.wipo.int/webcomponents/version.html
do
   wget --no-check-certificate $resource
done

cd $navbar_dev_appDisplay_dir
rm *
for resource in \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ar.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/en.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/et.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/it.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ka.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ko.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/nl.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ru.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/de.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/es.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/fr.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ja.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/km.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/lt.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/pt.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/zh.json
  
do
   wget --no-check-certificate $resource
done

cd $navbar_dev_appKeywords_dir
rm *
for resource in \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ar.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/en.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/et.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/it.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ka.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ko.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/nl.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ru.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/de.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/es.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/fr.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ja.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/km.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/lt.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/pt.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/zh.json
  
do
   wget --no-check-certificate $resource
done

cd $navbar_dev_common_dir
rm *
for resource in \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ar.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/en.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/et.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/it.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ka.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ko.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/nl.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ru.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/de.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/es.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/fr.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ja.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/km.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/lt.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/pt.json \
  https://www3dev.wipo.int/webcomponents/wipo-navbar/assets/locales/common/zh.json
  
do
   wget --no-check-certificate $resource
done

export https_proxy=http://wcs.wipo.int:3128
cd $navbar_acc_dir
rm *
for resource in \
  https://www5.wipo.int/webcomponents/polyfills/bundles/webcomponents-ce.js \
  https://www5.wipo.int/webcomponents/polyfills/bundles/webcomponents-sd.js \
  https://www5.wipo.int/webcomponents/polyfills/bundles/webcomponents-sd-ce.js \
  https://www5.wipo.int/webcomponents/polyfills/bundles/webcomponents-sd-ce-pf.js \
  https://www5.wipo.int/webcomponents/polyfills/custom-elements-es5-adapter.js \
  https://www5.wipo.int/webcomponents/polyfills/polyfill-ie11.js \
  https://www5.wipo.int/webcomponents/polyfills/webcomponents-loader.js \
  https://www5.wipo.int/webcomponents/polyfills/webcomponents-loader-v2.js \
  https://www5.wipo.int/webcomponents/wipo-navbar/wipo-navbar.js \
  https://www5.wipo.int/webcomponents/wipo-navbar/wipo-navbar-comp.js \
  https://www5.wipo.int/webcomponents/version.html
  
do
   wget --no-check-certificate $resource
done

cd $navbar_acc_appDisplay_dir
rm *
for resource in \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ar.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/en.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/et.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/it.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ka.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ko.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/nl.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ru.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/de.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/es.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/fr.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/ja.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/km.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/lt.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/pt.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appDisplay/zh.json
  
do
   wget --no-check-certificate $resource
done

cd $navbar_acc_appKeywords_dir
rm *
for resource in \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ar.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/en.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/et.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/it.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ka.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ko.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/nl.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ru.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/de.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/es.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/fr.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/ja.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/km.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/lt.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/pt.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/appKeywords/zh.json
  
do
   wget --no-check-certificate $resource
done

cd $navbar_acc_common_dir
rm *
for resource in \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ar.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/en.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/et.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/it.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ka.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ko.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/nl.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ru.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/de.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/es.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/fr.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/ja.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/km.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/lt.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/pt.json \
  https://www5.wipo.int/webcomponents/wipo-navbar/assets/locales/common/zh.json 
  
do
   wget --no-check-certificate $resource
done


cd $navbar_prd_dir
rm *
for resource in \
  https://webcomponents.wipo.int/polyfills/bundles/webcomponents-ce.js \
  https://webcomponents.wipo.int/polyfills/bundles/webcomponents-sd.js \
  https://webcomponents.wipo.int/polyfills/bundles/webcomponents-sd-ce.js \
  https://webcomponents.wipo.int/polyfills/bundles/webcomponents-sd-ce-pf.js \
  https://webcomponents.wipo.int/polyfills/custom-elements-es5-adapter.js \
  https://webcomponents.wipo.int/polyfills/polyfill-ie11.js \
  https://webcomponents.wipo.int/polyfills/webcomponents-loader.js \
  https://webcomponents.wipo.int/polyfills/webcomponents-loader-v2.js \
  https://webcomponents.wipo.int/wipo-navbar/wipo-navbar.js \
  https://webcomponents.wipo.int/wipo-navbar/wipo-navbar-comp.js  \
  https://webcomponents.wipo.int/version.html
  
do
   wget --no-check-certificate $resource
done

cd $navbar_prd_appDisplay_dir
rm *
for resource in \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/ar.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/en.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/et.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/it.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/ka.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/ko.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/nl.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/ru.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/de.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/es.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/fr.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/ja.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/km.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/lt.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/pt.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appDisplay/zh.json

  
do
   wget --no-check-certificate $resource
done

cd $navbar_prd_appKeywords_dir
rm *
for resource in \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/ar.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/en.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/et.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/it.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/ka.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/ko.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/nl.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/ru.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/de.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/es.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/fr.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/ja.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/km.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/lt.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/pt.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/appKeywords/zh.json

  
do
   wget --no-check-certificate $resource
done

cd $navbar_prd_common_dir
rm *
for resource in \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/ar.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/en.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/et.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/it.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/ka.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/ko.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/nl.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/ru.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/de.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/es.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/fr.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/ja.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/km.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/lt.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/pt.json \
  https://webcomponents.wipo.int/wipo-navbar/assets/locales/common/zh.json

  
do
   wget --no-check-certificate $resource
done

echo "......................................................."
echo "Listing content of /data/epct/navbar..."
ls -lR /data/epct/navbar

