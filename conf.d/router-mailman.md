
# An Exim4 router config for Mailman 

  mailman_router:
    driver = accept
    require_files = MAILMAN_HOME/lists/$local_part/config.pck
    local_part_suffix_optional
    local_part_suffix = -admin : -bounces : -bounces+* : \
                        -confirm : -confirm+* : \
                        -join : -leave : \
                        -owner : -request : \
                        -subscribe : -unsubscribe
    transport = mailman_transport
