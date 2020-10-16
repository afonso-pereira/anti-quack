# anti-quack

![Anti-Quack Logo](https://thumbs2.imgbox.com/0b/c9/tnyNI28K_t.png)

## Anti Bad USB Shell Script

#### Disables all usb ports to protect you from a BadUsb atack

### __TODO:__


    -Disable only the port where the new device is plugged in;


    -Add an authentication method:


                              -iserial
                              
                              
                              -Raspberry Pi connected via ethernet port
                              
                              
                              -yubikey
                              
 ### __UPDATE 1:__
    -Decided on the authentication method:
                              -The code will be using http authentication, utilizing a webserver hosted on an arduino nano v3 with an ethernet shield.
                                Why http and not https?
                                    The arduino is supposed to be plugged in directly on the computer, and not on a switch, so snooping on the traffic is impossible. On the other hand, http auth is way easier to implement :P
                                Why an arduino and not any of the methods previously stated?
                                    Arduino is the ultimately cheapest and (one of the) safest solution.Total cost is under 10€ (if bought on Europe), isn't easy to spoof, doesn't cost a fortune and has a low power consumption
    -This will be converted to a systemd service, so it starts with the OS (and is a lot harder for an intruder to mess with)
                                    
                                   
