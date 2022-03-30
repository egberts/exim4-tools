
# An Exim4 main config for laptops, dial-ups, and spotty cellular coverage

If your host is not permanently connected to the 
Internet, you may want to turn on queueing for remote 
addresses, while allowing Exim to perform local 
deliveries immediately. 

You can do this by setting:

    queue_remote_domains = *
