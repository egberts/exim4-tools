#!/bin/bash
# File: strace-exim4-daemon.sh
# Title: Get all Process/File Activites of Exim4 daemon
#

echo "Strace all process/file activities of Exim4 daemon."
echo

UPDATE_EXIM4_CONF_BIN="$(which update-eximt4.conf)"
STRACE_PROCFILE_FILESPEC="/tmp/update-exim4.conf.strace"
STRACE_FILTER_FILESPEC="/tmp/update-exim4.conf.2.strace"

echo "Starting Exim4 daemon ..."
echo "Creating strace $STRACE_PROCFILE_FILESPEC ..."
strace -f -v -s 80 \
  -e trace=process,open,openat,read,write,connect,accept,access,renameat2,statfs,stat,newfstatat \
  bash -x "${UPDATE_EXIM4_CONF_BIN}" > "${STRACE_PROCFILE_FILESPEC}" 2>&1 
echo "$STRACE_PROCFILE_FILESPEC created."


echo "Narrowing strace output into $STRACE_FILTER_FILESPEC file ..."
grep -v fstat "${STRACE_PROCFILE_FILESPEC}" \
  | grep -E "(open|stat|exec|write|wr)" \
  | grep -v "x86_64-linux-gnu" \
  | grep -v "passwd" \
  | grep -v group | grep -v "ld.so.cache" \
  | grep -v "SIG" \
  | grep -v "/local" \
  | grep -v "/sed" \
  | grep -v "/tr" \
  | grep -v "/getop" \
  | grep -v "/dirname" \
  | grep -v "resumed" \
  | grep -v "/cat\"" \
  | grep -v "/selinux" \
  | grep -v "/grep" \
  | grep -v "/proc" \
  | grep -v "/rm\"" \
  | grep -v "/null\"" \
  | grep -v "nsswitch" \
  | grep -v "/touch" \
  | grep -v "/id\"" \
  | grep -v "/chown" \
  | grep -v "/ls\"" \
  | grep -v "/chmod" \
  | grep -v "/expr" \
  | grep -v "/bash" \
  | grep -v "write(2" \
  | tee "$STRACE_FILTER_FILESPEC" | less 

#  | grep -v "/mv\"" \   # we want to see file movement within bash
echo
echo "/tmp/update-exim4.conf.2.strace created."

echo
echo "Done."

