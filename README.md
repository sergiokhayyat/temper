Temper1 devices (USB thermometer) driver with a command line sensor logger utility and a Docker container.

Dockerized version (json output format)
=======================================

Using compiled image from Docker Hub:
```
$> docker run --rm --privileged sergiokhayyat/temper
{ "date":"2016-08-04T07:26:19Z" , "temperature":27.696424 }
```

Compiling your own image
```
$> git clone https://github.com/sergiokhayyat/temper.git
$> cd temper
$> docker build -t temper .
$> docker run --rm --privileged temper
{ "date":"2016-08-04T07:26:19Z" , "temperature":27.696424 }
```

Binary compilation and installation (Debian / Ubuntu)
=====================================================

1. Install libusb-0.1.4 and dev package, plus build-essential 

    `sudo apt-get install build-essential libusb-0.1.4 libusb-0.1.4-dev`

    * Note: in some distributions the usb library `libusb-0.1.4-dev`
            may be named just `libusb-dev` (see Dockerfile)

2. Compile:

    `make`

3. Install:

    `sudo make install`

4. Uninstall

    `sudo make uninstall`


Usage instructions
==================

Run `log.sh`, you may need to run this as root depending on your udev rules, i.e.

    `sudo ./log.sh`

This will log the temperature every 5 seconds to stdout as a CSV stream which 
you can pipe to a text stream and open in your favourite spreadsheet package 
later.

For single temperature measurement, use:
```
./temper        # Single temperature read; time + temperature in text format
./temper_json   # Single temperature read; time + temperature in json format
```

To allow non-root users access
==============================

1. Add the udev rule set in `/etc/udev/rules.d/` using the `60-temper.rules`

2. Add a 'temper' group (using groupadd or edit the `/etc/group` file)

3. Add users to the 'temper' group

4. Reload the udev rules 

    `udevcontrol reload_rules`

5. Unplug and replug the TEMPer device

License and credits
===================

This software uses `pcsensor.c` by Michitaka Ohno, Juan Carlos Perez and Robert Kavaler

THIS SOFTWARE IS PROVIDED BY Sergio-Nabil Khayyat ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Robert kavaler, Juan Carlos Perez, Michitaka
Ohno or Sergio-Nabil Khayyat BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
