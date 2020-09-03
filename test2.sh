#Configuration interfaces:
> /etc/network/interfaces
echo # The loopback network interfaces >> /etc/network/interfaces
echo auto lo >> /etc/network/interfaces
echo iface lo inet loopback >> /etc/network/interfaces

echo # The primary network interfaces
echo auto eth0 >> /etc/network/interfaces
echo iface eth0 inet static >> /etc/network/interfaces
echo	address 192.168.240.200 >> /etc/network/interfaces
echo	netmask 255.255.255.0 >> /etc/network/interfaces
echo	gateway 192.168.240.1 >> /etc/network/interfaces

#restart:
systemctl restart networking.service

#Create a variable for change IP:
COUNTER=1
NETWORK=192.168.240
while [ $COUNTER -lt 254 ]
do
   if ping -c1 -w3 $NETWORK.$COUNTER >/dev/null 2>&1
   then
   COUNTER=$(( $COUNTER + 1 ))
   else
   IP=$NETWORK.$COUNTER
   COUNTER=254
   fi
done

#Change IP address with a variable:
> /etc/network/interfaces
echo # The loopback network interfaces >> /etc/network/interfaces
echo auto lo >> /etc/network/interfaces
echo iface lo inet loopback >> /etc/network/interfaces

echo # The primary network interfaces
echo auto eth0 >> /etc/network/interfaces
echo iface eth0 inet static >> /etc/network/interfaces
echo	address $IP >> /etc/network/interfaces
echo	netmask 255.255.255.0 >> /etc/network/interfaces
echo	gateway 192.168.240.1 >> /etc/network/interfaces

#Reset networkin service:
ifconfig eth0 0.0.0.0

#restart:
systemctl restart networking.service

#install sudo:
apt install sudo mc

#Prepare for install:
apt install -y wget
wget --no-check-certificate https://github.com/NicolasVidal-Ch/Script-test/archive/004.tar.gz

#Unzip the archive:
tar xvf 004.tar.gz
chmod +x Script-test-004/test.sh
sh /Script-test-004/test.sh

                
