#!/bin/bash
# File: dns-edns-tester.sh
# Title: Exercise EDNS
#
echo "EDNS Tester for DNS"
echo
dig +short rs.dns-oarc.net TXT
echo
echo "Must be 4096+ buffer size"
echo "Must be 4023+ reply size"

dig tcf.rs.dns-oarc.net TXT
echo
echo "Done."
