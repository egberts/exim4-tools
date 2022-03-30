





deny    domains       = +local_domains
        local_parts   = ^[.] : ^.*[@%!/|]
        message       = Restricted characters in address

deny    domains       = !+local_domains
        local_parts   = ^[./|] : ^.*[@%!] : ^.*/\\.\\./
        message       = Restricted characters in address


 These statements are concerned with local parts that contain any of the characters “@”, “%”, “!”, “/”, “|”, or dots in unusual places. Although these characters are entirely legal in local parts (in the case of “@” and leading dots, only if correctly quoted), they do not commonly occur in Internet mail addresses.

The first three have in the past been associated with explicitly routed addresses (percent is still sometimes used – see the percent_hack_domains option). Addresses containing these characters are regularly tried by spammers in an attempt to bypass relaying restrictions, and also by open relay testing programs. Unless you really need them it is safest to reject these characters at this early stage. This configuration is heavy-handed in rejecting these characters for all messages it accepts from remote hosts. This is a deliberate policy of being as safe as possible.

The first rule above is stricter, and is applied to messages that are addressed to one of the local domains handled by this host. This is implemented by the first condition, which restricts it to domains that are listed in the local_domains domain list. The “+” character is used to indicate a reference to a named list. In this configuration, there is just one domain in local_domains, but in general there may be many.

The second condition on the first statement uses two regular expressions to block local parts that begin with a dot or contain “@”, “%”, “!”, “/”, or “|”. If you have local accounts that include these characters, you will have to modify this rule.

Empty components (two dots in a row) are not valid in RFC 2822, but Exim allows them because they have been encountered in practice. (Consider the common convention of local parts constructed as “first-initial.second-initial.family-name” when applied to someone like the author of Exim, who has no second initial.) However, a local part starting with a dot or containing “/../” can cause trouble if it is used as part of a filename (for example, for a mailing list). This is also true for local parts that contain slashes. A pipe symbol can also be troublesome if the local part is incorporated unthinkingly into a shell command line.

The second rule above applies to all other domains, and is less strict. This allows your own users to send outgoing messages to sites that use slashes and vertical bars in their local parts. It blocks local parts that begin with a dot, slash, or vertical bar, but allows these characters within the local part. However, the sequence “/../” is barred. The use of “@”, “%”, and “!” is blocked, as before. The motivation here is to prevent your users (or your users’ viruses) from mounting certain kinds of attack on remote sites. 
