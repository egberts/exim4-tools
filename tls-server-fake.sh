#!/bin/bash
# File: tls-server-fake.sh
# Title: Set up fake TLS server for analysis of SMTP clients
#
echo "Start fake TLS server for analysis of SMTP clients"
echo

if [ "$USER" != 'root' ]; then
  echo "ssldump is a privilege network socket; re-run as 'root'; aborted."
  exit 13
fi

SSLDUMP="$(which ssldump)"
if [ -z "$SSLDUMP" ]; then
  echo "Binary file ssldump is missing; aborted."
  exit 9
fi

# Determine first non-lo netdev interface to use as a default
netdev_list=$(ip -o addr show | awk '{print $2}'|sort -u|xargs)
#shellcheck disable=SC2207
netdev_A=($(ip -o addr show | awk '{print $2}'))
echo "netdev_list: ${netdev_A[*]}"
for this_netdev in "${netdev_A[@]}"; do
  # echo "netdev: $this_netdev"
  if [ "$this_netdev" == 'lo' ]; then
    continue
  fi
  default_netdev="$this_netdev"
  break
done
echo "Available netdev interface(s): ${netdev_list[*]}"
if [ -n "$default_netdev" ]; then
  read_opt="-ei$default_netdev"
fi
#shellcheck disable=SC2086
read -rp "Enter in interface name: " ${read_opt?}
this_netdev="$REPLY"


PS3="Select port number: "
port_list=("465" "587" "443" "25")
port_desc=("submissions/SMTPS" "submission/STARTTLS" "https" "smtp")
select selected_port in "${port_list[@]}"; do
  if [ -z "$REPLY" ]; then
    continue
  fi
  this_port="$selected_port"
  break
done

echo "Port: ${port_desc[REPLY]} (${this_port}/tcp)"
echo "Executing: ssldump -d -i \"$this_netdev\" port $this_port  $1 $2 $3 $4 $5 $6"
#shellcheck disable=SC2086
ssldump -d -i "$this_netdev" port $this_port  $1 $2 $3 $4 $5 $6

