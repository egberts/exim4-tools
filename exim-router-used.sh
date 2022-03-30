#!/bin/bash
# File: exim-router-show.sh
# Title: Show which 'router' is used, given an email address
#
echo "Show which Exim4 router used, given an email"

if [ "$USER" != 'root' ]; then
  echo "Cannot run this script as '$USER' user; re-run as 'root'; aborted."
  exit 13
fi
echo

EXIM4_BIN="$(which exim4)"
if [ -z "$EXIM4_BIN" ]; then
  echo "Binary file 'exim4' not found; aborted."
  exit 9
fi

DEFAULT_EMAIL="test@example.invalid"
if [ -z "$1" ]; then
  read -rp "Enter in email address: "
  if [ -z "$REPLY" ]; then
    EMAIL_ADDR="$DEFAULT_EMAIL"
  else
    EMAIL_ADDR="$REPLY"
  fi
else
  EMAIL_ADDR="$1"
fi
echo "Email address used: $EMAIL_ADDR"
echo
echo "Executing: exim -bt -d -v $EMAIL_ADDR $2 $3 $4"

#shellcheck disable=SC2086
${EXIM4_BIN} -bt -d -v ${EMAIL_ADDR}  $2 $3 $4
retsts=$?
if [ $retsts -ne 0 ]; then
  echo "Error code $retsts in exim4"
  exit $retsts
fi
echo
echo "Done."

