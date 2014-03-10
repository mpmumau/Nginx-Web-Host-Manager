#!/bin/bash
#
# Push a stage or bare repo for a web host to the live instance.

LIVE_GIT="%LIVE_GIT%"

# Update the files in the stage instance
cd $LIVE_GIT
git pull origin master




