#!/bin/bash

(sleep 3
cd /usr/local/mgr5/src
for a in *; do
	if [ -d "$a" -a -e "$a/.autorebuild" ]; then
		echo "Rebuilding $a..."
		pushd "$a"
			make clean
			make
			make install
		popd
	fi
done) >> /usr/local/mgr5/var/autoupdater.log 2>&1 & 
echo "Autoupdate queued" >> /usr/local/mgr5/var/autoupdater.log
#echo -ne 'Content-type: text/xml\r\n\r\n<?xml version="1.0" encoding="UTF-8"?>\n<doc />\n'
cat
