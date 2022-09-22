#!/bin/sh

#WSL2 HOST
HOST_IP_ADDRESS=`cat /etc/resolv.conf|grep nameserver|awk '{print $2}'`
REMOTE_DOMAIN=hjsz.mooo.com


autossh -M 31234 -NfR 33389:$HOST_IP_ADDRESS:3389 huangjs@$REMOTE_DOMAIN


