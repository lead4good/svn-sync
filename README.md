Simple docker container which keeps a working copy of a repository up to date

### Note: this container does nothing but keep an unchanged working copy of the specified repo. All changes you make to it will be reverted after every sync.

# Usage

To run it:

```bash
docker run --name svn-sync -d \
	-v svn:/svn \
	-e SYNC_USER=username \
	-e SYNC_PASS=password \
	-e SYNC_URL=https://svnrepo.com/path/to/repo/ \
	lead4good/svn-sync
```

The working copy will be checked out to the volume at '/svn' and thereafter synced every $SYNC_INT seconds (default =30). To change the volume path use the environment variable $SYNC_DIR. Be sure that during first setup the volume you pass to the container is empty or the environment variable $ALLOW_OVERWRITE is set to 'true', otherwise the repo won't be checked out.

