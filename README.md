A command line sensor logger for Temper1 devices and a Docker container

Uses pcsensor.c by Michitaka Ohno, Juan Carlos Perez and Robert Kavaler

Dockerized version
==================

```
$> docker build -t temper .
$> docker run --rm --privileged temper
{ "date":"2016-08-04T07:26:19Z" , "temperature":27.696424 }
```

Install intructions (Debian / Ubuntu)
=====================================

1. Install libusb-0.1.4 and dev package, plus build-essential 

    sudo apt-get install build-essential libusb-0.1.4 libusb-0.1.4-dev

2. Compile:

    make

3. Install:

    sudo make install

4. Uninstall

    sudo make uninstall


Usage instructions
==================

Run log.sh, you may need to run this as root depending on your udev rules, i.e.

    sudo ./log.sh

This will log the temperature every 5 seconds to stdout as a CSV stream which 
you can pipe to a text stream and open in your favourite spreadsheet package 
later.

For single temperature measurement, use:

    ./temper        # Single temperature read; time + temperature in text format
    ./temper_json   # Single temperature read; time + temperature in json format


To allow non-root users access
==============================

1. Add the udev rule set in /etc/udev/rules.d/ using the 60-temper.rules 

2. Add a 'temper' group (using groupadd or edit the /etc/group file)

3. Add users to the 'temper' group

4. Reload the udev rules 

    udevcontrol reload_rules

5. Unplug and replug the TEMPer device

