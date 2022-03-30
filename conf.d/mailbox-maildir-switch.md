

# For Maildir,

Add directory to MAIL env var.

File: /etc/bash.bashrc
```bash
    MAIL=$HOME/Maildir
```

Also, change `LOCAL_TRANSPORT` to `maildir_home`.

File: /etc/exim4/conf.d/main/00-my-settings
```bash
    LOCAL_DELIVERY = maildir_home
```


# for UNIX mbox (mailbox)

Add file to MAIL environment variable.

File: /etc/bash.bashrc
```bash
    MAIL=/var/mail/$USER
```

Also, change `LOCAL_TRANSPORT` to `mail_spool`.

File: /etc/exim4/conf.d/main/00-my-settings
```bash
    LOCAL_DELIVERY = mail_spool
```
