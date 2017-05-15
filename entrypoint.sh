#!/bin/sh

if [ "$ALLOW_OVERWRITE" = "true" ] || [ -z "$(ls -A $SYNC_DIR)" ]; then
	svn --username "$SYNC_USER" --password "$SYNC_PASS" --force checkout "$SYNC_URL" "$SYNC_DIR"
fi

exec "$@"
