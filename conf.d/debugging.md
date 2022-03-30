For debug output during router/transport stage,

Use the `-d` option (implies setting `-v` as well) with `exim4` CLI.

```console
$ exim4 -d <your-exim4-options>

# or

# See all debug output
$ exim4 -d+all <your-exim4-options>

# or

# Only see filter debug output
$ exim4 -d-all+filter <your-exim4-options>

# or

# `-dd<options>` only examine daemon debugs and not subprocesses
$ exim4 -dd-all+filter <your-exim4-options>
```

## Debug options

    acl             ACL interpretation
    auth            authenticators
    deliver         general delivery logic
    dns             DNS lookups (see also resolver)
    dnsbl           DNS black list (aka RBL) code
    exec            arguments for execv() calls
    expand          detailed debugging for string expansions
    filter          filter handling
    hints_lookup    hints data lookups
    host_lookup     all types of name-to-IP address handling
    ident           ident lookup
    interface       lists of local interfaces
    lists           matching things in lists
    load            system load checks
    local_scan      can be used by local_scan() (see chapter 46)
    lookup          general lookup code and all lookups
    memory          memory handling
    noutf8          modifier: avoid UTF-8 line-drawing
    pid             modifier: add pid to debug output lines
    process_info    setting info for the process log
    queue_run       queue runs
    receive         general message reception logic
    resolver        turn on the DNS resolver's debugging output
    retry           retry handling
    rewrite         address rewriting
    route           address routing
    timestamp       modifier: add timestamp to debug output lines
    tls             TLS logic
    transport       transports
    uid             changes of uid/gid and looking up uid/gid
    verify          address verification logic
    all             almost all of the above (see below), and also -v
The default debug option (-d with no argument) omits only the 
following from `+all`:

* `expand`, 
* `filter`, 
* `interface`,
* `load`, 
* `memory`, 
* `pid`, 
* `resolver`, and 
* `timestamp`

# `debug\_print` statement
Also can insert at most ONE line of `debug_print` statement
in the router/transport action.

The `debug_print` output happens after checks for

* `domains`, 
* `local_parts`, and 
* `check_local_user`

but before any other preconditions are tested.


