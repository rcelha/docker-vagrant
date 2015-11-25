#!/bin/sh

set -ex;

apt update && apt install -y samba;

cp /tmp/smb.conf /etc/samba/smb.conf;

smbpasswd -a -n vagrant;
echo "vagrant
vagrant
" | smbpasswd -s vagrant;

update-rc.d smbd defaults
service smbd restart