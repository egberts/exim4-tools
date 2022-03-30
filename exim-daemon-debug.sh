#!/bin/bash
# File: exim4-daemon-debug.sh
# Title: Run exim4 in debug for troubleshooting
echo "Running exim4 daemon in debug mode ..."
echo

if [ "$USER" != 'root' ]; then
  echo "Must be in 'root' to debug exim4 daemon. Aborting ..."
  exit 255
fi

EXIM4_BIN="$(which exim4)"
if [ -z "$EXIM4_BIN" ]; then
  echo "File $EXIM4_BIN is not found; aborted."
  exit 9
fi

echo ${EXIM4_BIN} -d+all -bd -q30m -oX 587:465:25 -oP /run/exim4/exim.pid 
${EXIM4_BIN} -d+all -bd -q30m -oX 587:465:25 -oP /run/exim4/exim.pid 
echo $?

echo
echo "Done debugging exim4 daemon: exit code $retsts"

