##########################################################################
# File Name: f1x.sh
# Author: zhangxuezhao
# mail: zhangxuezhao@xiami.com
# Created Time: 2019年05月14日 星期二 18时10分58秒
#########################################################################
#!/bin/bash

stop mi_thermald;
echo 1 > /sys/class/power_supply/battery/input_suspend;
rm /sdcard/g7.txt;
sleep 3;
for i in `ls /sys/class/thermal/ | grep thermal_z`;
do
        if [ `cat /sys/class/thermal/${i}/type` = "mtktsbattery" ] ; then
                export battery="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "mtktsAP" ] ; then
                export AP="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "mtktsbtsmdpa" ] ; then
                export pa="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "mtktsbacklight" ] ; then
                export backlight="/sys/class/thermal/${i}/temp"
        elif [ `cat /sys/class/thermal/${i}/type` = "mtktscpu" ] ; then
                export cpu="/sys/class/thermal/${i}/temp"
        fi
done

echo "test befor:" >> /sdcard/g7.txt;
echo -n "battery = " >> /sdcard/g7.txt;
echo -n `cat $battery` >> /sdcard/g7.txt;
echo  ", " >> /sdcard/g7.txt;
echo -n "AP = " >> /sdcard/g7.txt;
echo -n `cat $AP` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo -n "pa = " >> /sdcard/g7.txt;
echo -n `cat $pa` >> /sdcard/g7.txt;
echo  ", " >> /sdcard/g7.txt;
echo -n "backlignt = " >> /sdcard/g7.txt;
echo -n `cat $backlight` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo -n "cpu = " >> /sdcard/g7.txt;
echo -n `cat $cpu` >> /sdcard/g7.txt;
echo  ", " >> /sdcard/g7.txt;
echo -n "cpu0freq = " >> /sdcard/g7.txt;
echo -n `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo -n "cpu6freq = " >> /sdcard/g7.txt;
echo -n `cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo " " >>/sdcard/g7.txt;

echo cpu6 1419000 > /sys/class/thermal/thermal_message/cpu_limits;


j=1;
while [ j -le 8 ]
do
	while true; do done &
	j=$j+1;
done

i=1;
while [ i -le 30 ]
do
	i=$i+1;
	sleep 1;
done

echo "test after:" >> /sdcard/g7.txt;
echo -n "battery = " >> /sdcard/g7.txt;
echo -n `cat $battery` >> /sdcard/g7.txt;
echo  ", " >> /sdcard/g7.txt;
echo -n "AP = " >> /sdcard/g7.txt;
echo -n `cat $AP` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo -n "pa = " >> /sdcard/g7.txt;
echo -n `cat $pa` >> /sdcard/g7.txt;
echo  ", " >> /sdcard/g7.txt;
echo -n "backlignt = " >> /sdcard/g7.txt;
echo -n `cat $backlight` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo -n "cpu = " >> /sdcard/g7.txt;
echo -n `cat $cpu` >> /sdcard/g7.txt;
echo  ", " >> /sdcard/g7.txt;
echo -n "cpu0freq = " >> /sdcard/g7.txt;
echo -n `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
echo -n "cpu6freq = " >> /sdcard/g7.txt;
echo -n `cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq` >> /sdcard/g7.txt;
echo ", " >> /sdcard/g7.txt;
sleep 1;
start mi_thermald;

