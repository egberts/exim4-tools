

  mailman_transport:
    driver = pipe
    command = MAILMAN_WRAP \
              '${if def:local_part_suffix \
                    {${sg{$local_part_suffix}{-(\\w+)(\\+.*)?}{\$1}}} \
                    {post}}' \
              $local_part
    current_directory = MAILMAN_HOME
    home_directory = MAILMAN_HOME
    user = MAILMAN_USER
    group = MAILMAN_GROUP
