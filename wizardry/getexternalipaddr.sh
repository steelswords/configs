curl icanhazip.com
#curl ident.me
#curl ipecho.net ; echo
#curl ifconfig.me

## Finding external IP without relying on external services
### If you know your network interface name:

#LANG=c ifconfig <interface_name> | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'
