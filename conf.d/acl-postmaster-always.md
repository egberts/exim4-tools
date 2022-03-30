

accept  local_parts   = postmaster
        domains       = +local_domains

This statement, which has two conditions, accepts an incoming address if the local part is postmaster and the domain is one of those listed in the local_domains domain list. The “+” character is used to indicate a reference to a named list. In this configuration, there is just one domain in local_domains, but in general there may be many.

The presence of this statement means that mail to postmaster is never blocked by any of the subsequent tests. This can be helpful while sorting out problems in cases where the subsequent tests are incorrectly denying access. 
