
accept  authenticated = *
        control       = submission

This statement accepts the address if the client host has authenticated itself. Submission mode is again specified, on the grounds that such messages are most likely to come from MUAs. The default configuration does not define any authenticators, though it does include some nearly complete commented-out examples described in 7.8. This means that no client can in fact authenticate until you complete the authenticator definitions. 
