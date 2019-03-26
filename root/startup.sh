#! /bin/sh

for i in /etc/dnsmasq.d/*.preconf
do
  conf=$(dirname $i)/$(basename $i .preconf).conf
  cp /dev/null $conf
  for h in $(cat $i)
  do
    echo "address=/$h/${PROXYIP}" >> $conf
  done
done

dnsmasq

# Run until stopped
trap "killall dnsmasq ; exit" TERM INT
sleep 2147483647d &
wait "$!"
