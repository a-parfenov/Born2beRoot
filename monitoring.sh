#!bin/bash

ARCH=$(uname -snrvmo)
PCPU=$(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
VCPU=$(grep 'processor' /proc/cpuinfo | uniq | wc -l)
FULLRAM=$(free -m | grep Mem: | awk '{print $2}')
USEDRAM=$(free -m | grep Mem: | awk '{print $3}')
PCTRAM=$(free -m | grep Mem: | awk '{printf("%.2f"), $3/$2*100}')
FULLDISK=$(df -Bg | grep /dev/ | grep -v /boot | awk '{fd += $2} END {print fd}')
USEDDISK=$(df -Bm | grep /dev/ | grep -v /boot | awk '{ud += $3} END {print ud}')
PCTDISK=$(df -Bm | grep /dev/ | grep -v /boot | awk '{ud += $3} {fd += $2} END {printf("%d"), ud/fd*100}')
CPU=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
LASTBOOT=$(who -b | awk '{print $3 " " $4}')
LVM=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
TCP=$(cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}')
TCPMSSG=$(if [ ${TCP} -eq 0 ]; then echo NOT ESTABLISHED; else echo ESTABLISHED; fi)
USERLOG=$(users | wc -w)
IP=$(hostname -I)
MAC=$(ip link show | awk '$1 == "link/ether" {print $2}')
SUDO=$(journalctl _COMM=sudo | grep COMMAND | wc -l)


echo "#Architecture: ${ARCH}"
echo "#CPU physical: ${PCPU}"
echo "#vCPU: ${VCPU}"
echo "#Memory Usage: ${USEDRAM}/${FULLRAM}MB (${PCTRAM}%)"
echo "#Disk Usage: ${USEDDISK}/${FULLDISK}Gb (${PCTDISK}%)"
echo "#CPU load: ${CPU}"
echo "#Last boot: ${LASTBOOT}"
echo "#LVM use: ${LVM}"
echo "#Connections TCP: ${TCP} ${TCPMSSG}"
echo "#User log: ${USERLOG}"
echo "#Network: IP ${IP} (${MAC})"
echo "#Sudo:  ${SUDO} cmd"
