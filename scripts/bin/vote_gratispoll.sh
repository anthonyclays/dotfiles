#!/bin/sh
strindex() { 
  x="${1%%$2*}"
  [[ $x = $1 ]] && echo -1 || echo ${#x}
}

i=0

while [ 1 ]
do
/bin/echo -n "Extracting checksum... "
checksumfull="$(curl -s --socks5-hostname 127.0.0.1:9050 https://gratispoll.be/poll/$1/ | grep stemreq.get )"
echo $checksumfull
checksumpos=$(($(strindex "$checksumfull" "'c'") + 6))
echo $checksumpos
checksumfull=$(echo $checksumfull | cut -c$checksumpos-)
echo $checksumfull
checksumpos=$(strindex "$checksumfull" "'")
checksum=$(echo $checksumfull | cut -c-$checksumpos)
echo "$checksum"

/bin/echo -n "Data sent, JSON reply: "
curl -s --socks5-hostname 127.0.0.1:9050 "http://gratispoll.be/ajax_stemmen.php?poll=$1&antw=$2&c=$checksum&del=0" -H 'Host: gratispoll.be' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0' -H 'Accept: application/json' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate' -H 'DNT: 1' -H 'X-Requested-With: XMLHttpRequest' -H 'X-Request: JSON' -H 'Referer: http://gratispoll.be/poll/fiyjs4/' -H 'Connection: keep-alive' | gunzip
echo
i=$((i+1))
echo "Vote submitted (total: $i)"
/bin/echo -n "Requesting a new IP address from TOR... "
sudo tor-ctrl.sh -c "signal NEWNYM" -p admin3.14
echo "Done"
done
