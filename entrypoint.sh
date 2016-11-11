#!/bin/sh

if [ -z "$(ls -A $SYNC_DIR)" ]; then
	svn --username "$SYNC_USER" --password "$SYNC_PASS" checkout "$SYNC_URL" "$SYNC_DIR"
fi

exec "$@"