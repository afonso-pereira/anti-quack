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
then #deactivates usb ports (read bellow)
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/unbind);
(xrandr -q | grep ' connected' | wc -l; > monitorcount1.txt); #gets number of monitors connected 
cmp monitorcount0.txt monitorcount1.txt > scope.txt; #compares info, if differente, writes "differ" to scope.txt
if (grep -q 'differ' scope.txt); 
then    #activates usb ports
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);
(echo '<bus>-1'| sudo tee /sys/bus/usb/drivers/usb/bind);

fi;
fi;
done;
#plug you USB device on each port and use the command 'lsusb -t' to get host bus number
#replace <bus> with the usb host Bus number
#duplicate the lines under according to your needs 
#to reactivate the ports, you need to plug in a dummy monitor (a regular vga cable worked for me, but please test it first x)
#if you need more help, contact me :p
