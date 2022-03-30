
# Local sender '*'

my usecase is slightly different than that described in the bugzilla report. Not trying to get user sub-addressing but rather the ability to allow plussed addressing in the domain email forwards. This allows for some fairly convenient throwaway addresses as an anti-spam strategy. To achieve this, I've replaced the old "virtual_aliases_nostar" driver with the following two drivers:

# Router driver
```ini
virtual_aliases_suffix:
driver = redirect
allow_defer
allow_fail
local_part_suffix_optional
local_part_suffix = -* : +*
data = ${if exists{/etc/valiases/$domain}{${lookup{$local_part$local_part_suffix@$domain}lsearch{/etc/valiases/$domain}}}}
file_transport = address_file
group = mail
pipe_transport = virtual_address_pipe
retry_use_local_part
domains = lsearch;/etc/localdomains
```

# Router driver for aliases
```ini
virtual_aliases_nostar:
driver = redirect
allow_defer
allow_fail
local_part_suffix_optional
local_part_suffix = -* : +*
data = ${if exists{/etc/valiases/$domain}{${lookup{$local_part@$domain}lsearch{/etc/valiases/$domain}}}}
file_transport = address_file
group = mail
pipe_transport = virtual_address_pipe
retry_use_local_part
domains = lsearch;/etc/localdomains
#unseen
```

# References

* https://forums.cpanel.net/threads/plussed-addressing-in-exim.71412/
