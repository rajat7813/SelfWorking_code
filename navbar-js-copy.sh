root_dir=$epctBuildDir    ###this will be the ePCT working directory when the script is called from Bamboo
dev_navbar_dir=$root_dir/common-res/src/main/webapp/navbar/dev
dev_wipo_navbar_dir=$root_dir/common-res/src/main/webapp/navbar/dev/wipo-navbar
dev_wipo_polyfills_dir=$root_dir/common-res/src/main/webapp/navbar/dev/polyfills
dev_wipo_polyfills_bundles_dir=$root_dir/common-res/src/main/webapp/navbar/dev/polyfills/bundles
dev_wipo_navbar_assets_locales_appDisplay_dir=$root_dir/common-res/src/main/webapp/navbar/dev/wipo-navbar/assets/locales/appDisplay
dev_wipo_navbar_assets_locales_appKeywords_dir=$root_dir/common-res/src/main/webapp/navbar/dev/wipo-navbar/assets/locales/appKeywords
dev_wipo_navbar_assets_locales_common_dir=$root_dir/common-res/src/main/webapp/navbar/dev/wipo-navbar/assets/locales/common

acc_navbar_dir=$root_dir/common-res/src/main/webapp/navbar/acc
acc_wipo_navbar_dir=$root_dir/common-res/src/main/webapp/navbar/acc/wipo-navbar
acc_wipo_polyfills_dir=$root_dir/common-res/src/main/webapp/navbar/acc/polyfills
acc_wipo_polyfills_bundles_dir=$root_dir/common-res/src/main/webapp/navbar/acc/polyfills/bundles
acc_wipo_navbar_assets_locales_appDisplay_dir=$root_dir/common-res/src/main/webapp/navbar/acc/wipo-navbar/assets/locales/appDisplay
acc_wipo_navbar_assets_locales_appKeywords_dir=$root_dir/common-res/src/main/webapp/navbar/acc/wipo-navbar/assets/locales/appKeywords
acc_wipo_navbar_assets_locales_common_dir=$root_dir/common-res/src/main/webapp/navbar/acc/wipo-navbar/assets/locales/common

prd_navbar_dir=$root_dir/common-res/src/main/webapp/navbar/prd
prd_wipo_navbar_dir=$root_dir/common-res/src/main/webapp/navbar/prd/wipo-navbar
prd_wipo_polyfills_dir=$root_dir/common-res/src/main/webapp/navbar/prd/polyfills
prd_wipo_polyfills_bundles_dir=$root_dir/common-res/src/main/webapp/navbar/prd/polyfills/bundles
prd_wipo_navbar_assets_locales_dir=$root_dir/common-res/src/main/webapp/navbar/prd/wipo-navbar/assets/locales
prd_wipo_navbar_assets_locales_appDisplay_dir=$root_dir/common-res/src/main/webapp/navbar/prd/wipo-navbar/assets/locales/appDisplay
prd_wipo_navbar_assets_locales_appKeywords_dir=$root_dir/common-res/src/main/webapp/navbar/prd/wipo-navbar/assets/locales/appKeywords
prd_wipo_navbar_assets_locales_common_dir=$root_dir/common-res/src/main/webapp/navbar/prd/wipo-navbar/assets/locales/common

###copy DEV navbar files
dev_source_dir=/data/epct/navbar/dev
cd $dev_source_dir
mkdir -p $dev_wipo_navbar_assets_locales_appDisplay_dir
mkdir -p $dev_wipo_navbar_assets_locales_appKeywords_dir
mkdir -p $dev_wipo_navbar_assets_locales_common_dir

cp webcomponents-ce.js $dev_wipo_polyfills_bundles_dir/webcomponents-ce.js
cp webcomponents-sd.js $dev_wipo_polyfills_bundles_dir/webcomponents-sd.js
cp webcomponents-sd-ce.js $dev_wipo_polyfills_bundles_dir/webcomponents-sd-ce.js
cp webcomponents-sd-ce-pf.js $dev_wipo_polyfills_bundles_dir/webcomponents-sd-ce-pf.js

cp custom-elements-es5-adapter.js $dev_wipo_polyfills_dir/custom-elements-es5-adapter.js
cp polyfill-ie11.js $dev_wipo_polyfills_dir/polyfill-ie11.js
cp webcomponents-loader.js $dev_wipo_polyfills_dir/webcomponents-loader.js
cp webcomponents-loader-v2.js $dev_wipo_polyfills_dir/webcomponents-loader-v2.js

cp wipo-navbar.js $dev_wipo_navbar_dir/wipo-navbar.js
cp wipo-navbar-comp.js $dev_wipo_navbar_dir/wipo-navbar-comp.js
cp version.html $dev_navbar_dir/version.html
cp appDisplay/*.json $dev_wipo_navbar_assets_locales_appDisplay_dir/
cp appKeywords/*.json $dev_wipo_navbar_assets_locales_appKeywords_dir/
cp common/*.json $dev_wipo_navbar_assets_locales_common_dir/

###copy ACC navbar files
acc_source_dir=/data/epct/navbar/acc
cd $acc_source_dir
mkdir -p $acc_wipo_navbar_assets_locales_appDisplay_dir
mkdir -p $acc_wipo_navbar_assets_locales_appKeywords_dir
mkdir -p $acc_wipo_navbar_assets_locales_common_dir

cp webcomponents-ce.js $acc_wipo_polyfills_bundles_dir/webcomponents-ce.js
cp webcomponents-sd.js $acc_wipo_polyfills_bundles_dir/webcomponents-sd.js
cp webcomponents-sd-ce.js $acc_wipo_polyfills_bundles_dir/webcomponents-sd-ce.js
cp webcomponents-sd-ce-pf.js $acc_wipo_polyfills_bundles_dir/webcomponents-sd-ce-pf.js

cp custom-elements-es5-adapter.js $acc_wipo_polyfills_dir/custom-elements-es5-adapter.js
cp polyfill-ie11.js $acc_wipo_polyfills_dir/polyfill-ie11.js
cp webcomponents-loader.js $acc_wipo_polyfills_dir/webcomponents-loader.js
cp webcomponents-loader-v2.js $acc_wipo_polyfills_dir/webcomponents-loader-v2.js
cp wipo-navbar.js $acc_wipo_navbar_dir/wipo-navbar.js
cp wipo-navbar-comp.js $acc_wipo_navbar_dir/wipo-navbar-comp.js
cp version.html $acc_navbar_dir/version.html
cp appDisplay/*.json $acc_wipo_navbar_assets_locales_appDisplay_dir/
cp appKeywords/*.json $acc_wipo_navbar_assets_locales_appKeywords_dir/
cp common/*.json $acc_wipo_navbar_assets_locales_common_dir/

###copy PRD navbar files
prd_source_dir=/data/epct/navbar/prd
cd $prd_source_dir
mkdir -p $prd_wipo_navbar_assets_locales_appDisplay_dir
mkdir -p $prd_wipo_navbar_assets_locales_appKeywords_dir
mkdir -p $prd_wipo_navbar_assets_locales_common_dir

cp webcomponents-ce.js $prd_wipo_polyfills_bundles_dir/webcomponents-ce.js
cp webcomponents-sd.js $prd_wipo_polyfills_bundles_dir/webcomponents-sd.js
cp webcomponents-sd-ce.js $prd_wipo_polyfills_bundles_dir/webcomponents-sd-ce.js
cp webcomponents-sd-ce-pf.js $prd_wipo_polyfills_bundles_dir/webcomponents-sd-ce-pf.js

cp custom-elements-es5-adapter.js $prd_wipo_polyfills_dir/custom-elements-es5-adapter.js
cp polyfill-ie11.js $prd_wipo_polyfills_dir/polyfill-ie11.js
cp webcomponents-loader.js $prd_wipo_polyfills_dir/webcomponents-loader.js
cp webcomponents-loader-v2.js $prd_wipo_polyfills_dir/webcomponents-loader-v2.js
cp wipo-navbar.js $prd_wipo_navbar_dir/wipo-navbar.js
cp wipo-navbar-comp.js $prd_wipo_navbar_dir/wipo-navbar-comp.js
cp version.html $prd_navbar_dir/version.html
cp appDisplay/*.json $prd_wipo_navbar_assets_locales_appDisplay_dir/
cp appKeywords/*.json $prd_wipo_navbar_assets_locales_appKeywords_dir/
cp common/*.json $prd_wipo_navbar_assets_locales_common_dir/

echo "......................................................."
echo "Listing content of $root_dir/common-res/src/main/webapp/navbar..."
ls -lR $root_dir/common-res/src/main/webapp/navbar

