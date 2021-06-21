Url=https://svn.wipo.int/svn/pctis/pct-sc/trunk/epct-parent/pom.xml

#$Url | cut -d "branch" -f 2 | cut -d "trunk" -f 2 

$Url | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$'