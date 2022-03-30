

# `log_selectors`

You can pass additional log selector to the CLI using:

```bash
exim4 -d+all -Dlog_selector = +all <your_exim4_options>
```

# Known `log_selectors`

Known `log_selectors` are detailed in section 53.13:

* `8bitmime`, received 8BITMIME status usage
* `*acl_warn_skipped`             skipped warn statement in ACL
* `address_rewrite`              address rewriting
* `all_parents`                  all parents in => lines
* `arguments`                    command line arguments
* `*connection_reject`            connection rejections
* `*delay_delivery`               immediate delivery delayed
* `deliver_time`                 time taken to attempt delivery
* `delivery_size`                add S=nnn to => lines
* `*dkim`                         DKIM verified domain on <= lines
* `dkim_verbose`                 separate full DKIM verification result line, per signature
* `*dnslist_defer`                defers of DNS list (aka RBL) lookups
* `dnssec`                       DNSSEC secured lookups
* `*etrn`                         ETRN commands
* `*host_lookup_failed`           as it says
* `ident_timeout`                timeout for ident connection
* `incoming_interface`           local interface on <= and => lines
* `incoming_port`                remote port on <= lines
* `*lost_incoming_connection`     as it says (includes timeouts)
* `millisec`                     millisecond timestamps and RT,QT,DT,D times
* `*msg_id`                       on <= lines, Message-ID: header value
* `msg_id_created`               on <= lines, Message-ID: header value when one had to be added
* `outgoing_interface`           local interface on => lines
* `outgoing_port`                add remote port to => lines
* `*queue_run`                    start and end queue runs
* `queue_time`                   time on queue for one recipient
* `queue_time_overall`           time on queue for whole message
* `pid`                          Exim process id
* `pipelining`                   PIPELINING use, on <= and => lines
* `proxy`                        proxy address on <= and => lines
* `receive_time`                 time taken to receive message
* `received_recipients`          recipients on <= lines
* `received_sender`              sender on <= lines
* `*rejected_header`              header contents on reject log
* `*retry_defer`                  "retry time not reached"
* `return_path_on_delivery`      put return path on => and ** lines
* `sender_on_delivery`           add sender to => lines
* `*sender_verify_fail`           sender verification failures
* `*size_reject`                  rejection because too big
* `*skip_delivery`                delivery skipped in a queue run
* `*smtp_confirmation`            SMTP confirmation on => lines
* `smtp_connection`              incoming SMTP connections
* `smtp_incomplete_transaction`  incomplete SMTP transactions
* `smtp_mailauth`                AUTH argument to MAIL commands
* `smtp_no_mail`                 session with no MAIL commands
* `smtp_protocol_error`          SMTP protocol errors
* `smtp_syntax_error`            SMTP syntax errors
* `subject`                      contents of Subject: on <= lines
* `*taint`                        taint errors or warnings
* `*tls_certificate_verified`     certificate verification status
* `*tls_cipher`                   TLS cipher suite on <= and => lines
* `tls_peerdn`                   TLS peer DN on <= and => lines
* `tls_sni`                      TLS SNI on <= lines
* `unknown_in_list`              DNS lookup failed in list match

* `all`,                         all of the above

For all asterisked items, see section 53.15 for additional details in
`/usr/share/exim4/doc/spec.txt` file.

# Driver-specific log

You can insert `log_selectors` under `router` or `transport`.


# Field indicators

A           authenticator name (and optional id and sender)
C           SMTP confirmation on delivery
            command list for "no mail in SMTP session"
CV          certificate verification status
D           duration of "no mail in SMTP session"
DKIM        domain verified in incoming message
DN          distinguished name from peer certificate
DS          DNSSEC secured lookups
DT          on =>, == and ** lines: time taken for, or to attempt, a delivery
F           sender address (on delivery lines)
H           host name and IP address
I           local interface used
id          message id (from header) for incoming message
K           CHUNKING extension used
L           on <= and => lines: PIPELINING extension used
M8S         8BITMIME status for incoming message
P           on <= lines: protocol used
            on => and ** lines: return path
PRDR        PRDR extension used
PRX         on <= and => lines: proxy address
Q           alternate queue name
QT          on => lines: time spent on queue so far
            on "Completed" lines: time spent on queue
R           on <= lines: reference for local bounce
            on =>  >> ** and == lines: router name
RT          on <= lines: time taken for reception
S           size of message in bytes
SNI         server name indication from TLS client hello
ST          shadow transport name
T           on <= lines: message subject (topic)
TFO         connection took advantage of TCP Fast Open
            on => ** and == lines: transport name
U           local user or RFC 1413 identity
X           TLS cipher suite



