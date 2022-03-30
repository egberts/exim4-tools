

# XXXX in username+XXXX@example.test

The part that has XXXX in username+XXXX@example.test email address.

Two config files required in `/etc/exim4/conf.d/router`

1.  `600_exim4-config_userforward`
2.  `900_exim4-config_userforward`

## Router File 600
In file `600_exim4-config_userformward`:
```ini
#
# File: 600_exim4-config_userforward
# Path: /etc/exim4/conf.d/router
#################################

# This router handles forwarding using traditional .forward files in users'
# home directories. It also allows mail filtering with a forward file
# starting with the string "# Exim filter" or "# Sieve filter".
#
# The no_verify setting means that this router is skipped when Exim is
# verifying addresses. Similarly, no_expn means that this router is skipped if
# Exim is processing an EXPN command.
#
# The check_ancestor option means that if the forward file generates an
# address that is an ancestor of the current one, the current one gets
# passed on instead. This covers the case where A is aliased to B and B
# has a .forward file pointing to A.
#
# The four transports specified at the end are those that are used when
# forwarding generates a direct delivery to a directory, or a file, or to a
# pipe, or sets up an auto-reply, respectively.
#
userforward:
  debug_print = "R: userforward for $local_part@$domain"
  driver = redirect
  domains = +local_domains
  check_local_user
  file = $home/.forward
  require_files = $local_part:$home/.forward

## BEGIN of subaddressing addendum
## source: https://forums.debian.net/viewtopic.php?p=286596

  local_part_suffix = -*
  local_part_suffix_optional

## END of subaddressing addendum

  no_verify
  no_expn
  check_ancestor
  allow_filter
  forbid_smtp_code = true
  directory_transport = address_directory
  file_transport = address_file
  pipe_transport = address_pipe
  reply_transport = address_reply
  skip_syntax_errors
  syntax_errors_to = real-$local_part@$domain
  syntax_errors_text = \
    This is an automatically generated message. An error has\n\
    been found in your .forward file. Details of the error are\n\
    reported below. While this error persists, you will receive\n\
    a copy of this message for every message that is addressed\n\
    to you. If your .forward file is a filter file, or if it is\n\
    a non-filter file containing no valid forwarding addresses,\n\
    a copy of each incoming message will be put in your normal\n\
    mailbox. If a non-filter file contains at least one valid\n\
    forwarding address, forwarding to the valid addresses will\n\
    happen, and those will be the only deliveries that occur.
```

## Router File 900
In file `900_exim4-config_local_user`:
```ini
#
# File: 900_exim4-config_local_user
# Path: /etc/exim4/router
# Title: Route to local user having subaddressing support
#########################################################

# This router matches local user mailboxes. If the router fails, the error
# message is "Unknown user".

local_user:
  debug_print = "R: local_user for $local_part@$domain"
  driver = accept
  domains = +local_domains
  check_local_user
  local_parts = ! root

## BEGIN of subaddressing addendum
## source: https://forums.debian.net/viewtopic.php?p=286596

  debug_print = "R: processing suffix subaddressing for $local_part@$domain"
  local_part_suffix = -* : +* : _* : .*
  local_part_suffix_optional

## END of subaddressing addendum

  transport = LOCAL_DELIVERY
  cannot_route_message = Unknown user
```


