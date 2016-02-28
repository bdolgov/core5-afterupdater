all: 
	true

install: rebuild.sh rebuild.xml
	[ ! -z "$(MGR)" ] || ( echo "Specify MGR" ; false )
	cp -f rebuild.sh /usr/local/mgr5/addon/
	cp -f rebuild.xml /usr/local/mgr5/etc/xml/$(MGR)_mod_rebuilder.xml
