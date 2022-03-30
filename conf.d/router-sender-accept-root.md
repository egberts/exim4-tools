
# Accept root as a sender

This router driver will accept 'root' always as 'mail' account.

Since Exim 4.24, this 'root' account name has been disabled.
This was done to force mail administrator to create an
alias for 'root' and point it to their own account.

This router driver will circumvent this:

File: `/etc/exim4/conf.d/router/mmm_mail4root`
```ini
#
# File: mmm_mail4root
# Path: /etc/exim/conf.d/router
# Title: Always accept 'root' as a username
# Description:
#
#   deliver mail addressed to root to /var/mail/mail as user mail:mail
#   if it was not redirected in /etc/aliases or by other means
#   Exim cannot deliver as root since 4.24 (FIXED_NEVER_USERS)
#

mail4root:
  debug_print = "R: mail4root for $local_part@$domain"
  driver = redirect
  domains = +local_domains
  data = /var/mail/mail
  file_transport = address_file
  local_parts = root

  # put sysadmin's UID/GID instead of 'mail' here
  user = mail
  group = mail
```
