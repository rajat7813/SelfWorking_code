svn co https://Google-Baba/svn/project/trunk ./Test/
cd Test/
grep --exclude-dir ".svn" -RiIl 'search' | xargs sed -i 's/search/replace/g'
svn status
#svn add *
#svn commit -m "version2" *