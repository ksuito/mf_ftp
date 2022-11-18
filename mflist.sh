#!/bin/sh

confdir=`dirname "$0"`

if [ $# -lt 2 ]; then
  echo 'usage: '"$0"' <hostname> <library>' 1>&2
  exit 1
fi

hostname=$1
lib=$2

# load variable settings for the hostname.
. "$confdir"/mfvars.sh

echo "$ip" "$user" "$passwd"

ftp -p -n "$ip" <<END_SCRIPT
quote USER "$user"
quote PASS "$passwd"
cd '"$lib"'
pwd
ls
END_SCRIPT
exit 0
