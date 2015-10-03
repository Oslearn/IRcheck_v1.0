#!/bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Special thanks to Red V!per
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# IRcheck v1.0
#####################################################

function usage {
echo "Example: $0 -t 3 -l list.txt"
echo "Usage: $0 [options]"
echo '	-t delay time between each request'
echo -e "	-l domain list\n"
exit 1
}

function check {
if [ ! -f $list ] ; then
	echo -e "cannot access $list: No such file"
	exit 1
fi
}

if [ "$#" != "4" ] ; then
usage
fi

while [ "$#" -gt "0" ] ; do
opt=$1 ; shift
case $opt in
	-l) list=$1 ; shift ;;
	-t) time=$1 ; shift ;;
	*) usage ;;
esac ; done

check
echo '[+] ------------------------------------------------------------------- [+]'
echo -e "[+] Programming and idea by : \e[1mE2MA3N [Iman Homayouni]\e[0m"
echo "[+] Special thanks to Red V!per"
echo '[+] License : GPL v3.0'
echo '[+] IRcheck v1.0' ; echo '[+]'

for domain in `cat $list` ; do
echo -en "[+] $domain "
curl --silent -H "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)" http://whois.nic.ir/WHOIS?name=$domain 2> /dev/null | grep 'ERROR:101' &> /dev/null
if [ "$?" = "0" ] ; then
	echo -e "\e[92mis free\e[0m"
	echo $domain >> free.txt
else
	echo -e "\e[91mregistered\e[0m"
	echo $domain >> registered.txt
fi
sleep $time
done

echo '[+]'
echo '[+] ------------------------------------------------------------------- [+]'
