#!/bin/bash
# File: smtp-tls-check.sh
# Title: Exercise a simple server-side-only TLS without SMTP DATA

echo "Exercise a simple server-side-only TLS without SMTP DATA"
echo

if [ "$USER" == 'root' ]; then
  echo "WARNING: Do not need to run this script as 'root'"
fi
echo

SWAKS_BIN="$(which swaks)"
if [ -z "$SWAKS_BIN" ]; then
  echo "Binary file swaks is missing; aborted."
  exit 9
fi

echo "On this host: $HOSTNAME"
echo "On this port: smtp(25)/tcp"

echo "Opening SMTP TLS via 'localhost' ..."
echo "Executing: swaks -a -tls  -q HELO -s localhost -au $USER -ap '<>'"
swaks -a -tls  -q HELO -s localhost -au $USER -ap '<>'
retsts=$?
if [ $retsts -ne 0 ]; then
  echo "Error code $retsts"
  exit $retsts
fi
echo
echo "Done."

