#!/bin/sh
while [ 1 ]
do

	if [ ! -z "$(ls -A $SYNC_DIR)" ]; then
	  if ! [ "$ALLOW_OVERWRITE" = "true" ]; then
			STATUS="$(svn --username "$SYNC_USER" --password "$SYNC_PASS" status -u "$SYNC_DIR" | grep -v Status)"
		else
			STATUS="$(svn --username "$SYNC_USER" --password "$SYNC_PASS" status -u "$SYNC_DIR" | grep -v Status | grep -v ?)"
		fi

		if ! [ -z "$STATUS"]; then
			date
			svn --username "$SYNC_USER" --password "$SYNC_PASS" revert -R "$SYNC_DIR"
			if ! [ "$ALLOW_OVERWRITE" = "true" ]; then
				svn --username "$SYNC_USER" --password "$SYNC_PASS" cleanup --remove-unversioned "$SYNC_DIR"
			fi
			svn --username "$SYNC_USER" --password "$SYNC_PASS" update "$SYNC_DIR"
		fi
	fi

	sleep "$SYNC_INT"
done
