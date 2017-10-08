#!/bin/bash
ORIGIN_PATH="./nugu_stagefright_liblist/"
LIB_PATH="./system/lib/"

cat library_list.txt | \
while read line
do
	if [ -n "$line" ] ; then
		cp -R ${ORIGIN_PATH}${line} ${LIB_PATH}${line}
	fi
done