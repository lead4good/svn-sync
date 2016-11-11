#!/bin/sh
while [ 1 ]
do
	
	if [ ! -z "$(ls -A $SYNC_DIR)" ] && [ ! -z "$(svn --username "$SYNC_USER" --password "$SYNC_PASS" status -u "$SYNC_DIR" | grep -v Status)" ]; then
		date
		svn --username "$SYNC_USER" --password "$SYNC_PASS" update "$SYNC_DIR"
		svn --username "$SYNC_USER" --password "$SYNC_PASS" cleanup --remove-unversioned "$SYNC_DIR"
	fi
	
	sleep "$SYNC_INT"
done
