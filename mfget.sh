#!/bin/sh

confdir=`dirname "$0"`

if [ $# -lt 3 ]; then
  echo 'usage: '"$0"' <hostname> <library> <member>' 1>&2
  exit 1
fi

hostname=$1
lib=$2
member=$3

# load variable settings for the hostname.
. "$confdir"/mfvars.sh

echo "$ip" "$user" "$passwd"

ftp -p -n "$ip" <<END_SCRIPT
quote USER "$user"
quote PASS "$passwd"
cd '"$lib"'
pwd
get "$member"
END_SCRIPT
exit 0
