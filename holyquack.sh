#Code by Afonso Pereira
#30/04/2020
#https://github.com/afonso-pereira/anti-quack
#!/bin/bash
while true; 
do(xrandr -q | grep ' connected' | wc -l; > monitorcount0.txt); #Gets number of monitors connected
lsusb -v > quackhunter.txt; #gets info about connected USB devices 
lsusb -v > quackhunting.txt; #gets info about connected USB devices 
cmp quackhunter.txt quackhunting.txt > scope.txt; #compares info, if differente, writes "differ" to scope.txt
if (grep -q 'differ' scope.txt); #checks scope.txt for the word "differ"
then 
(xrandr -q | grep ' connected' | wc -l; > monitorcount1.txt); #gets number of monitors connected 
cmp monitorcount0.txt monitorcount1.txt > scope.txt; #compares info, if differente, writes "differ" to scope.txt
fi;
if (grep -q 'differ' scope.txt); 
#run 'lsusb -t' 
#plug you USB device on each port and replace <bus> with the usb host Bus number
#duplicate the lines under according to your needs 
#if you need more help, check readme file :p
then    #activates usb ports
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
else    #deactivates usb ports 
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);

fi;
done;
