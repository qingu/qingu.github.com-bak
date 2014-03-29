#/bin/bash

TIME=`date "+%Y-%m-%d %H:%M:%S"`

git add *
git commit -a -m "$1-$TIME"
git push origin source
