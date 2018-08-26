# What is snapcraft?

[Snaps] are containerised software packages that are simple to create and
install on all major Linux systems without modification.

# Why would I want to use it?

Personally I wanted to build and tinker with opentrack on ubuntu 16.04
but it doesn't have new enough QT libraries. Rather than upgrade my whole
system things like snap can be used to make it easily run on any linux
distribution, arch, different versions of ubuntu fedora etc without
the end users having to worry about installing the "correct" versions
of libraries.

# How do I build the opentrack snap?

1. Install [docker]
2. `./snap/build.sh`

You could even do this with docker on windows, though you would have to
write a new `.\snap\build.bat` rather than using the bash script above.

# Once built, how do I install and test it as a developer?

    snap install snap/opentrack_*.snap --devmode --dangerous
    opentrack

# How do end users install and run it?

If we eventually push it up to the snap store it will be something like
`snap install opentrack` (or via a gui such as the ubuntu software centre).
Then simply run opentrack via your desktop launcher menu.
There is a bit of work to do first to make opentrack work in normal user
mode rather than the dangerous dev mode.

Interestingly there is already a version of [opentrack on the snap store],
we may have to contact the owner if we want to use that name.

# What trackers, protocols and filters does the snap build currently support?

Available and tested:

* point tracker
* aruco tracker
* test sine save tracker
* flight gear protocol
* libevdev virtual joystick protocol
* accela filter

Available but untested:

* freepie udp tracker
* fusion tracker
* S2 bot receiver
* udp tracker
* udp protocol
* EWMA filter

Unavailable but possible:

* hatire tracker
* hydra tracker
* rift tracker
* steamvr tracker
* wine protocol
* xplane plugin
* kalman filter

Unavailable (windows or osx only):

* windows joystick tracker
* realsense tracker
* wiiyourself tracker
* fsuipc protocol
* freetracker protocol
* iokit-foohid protocol
* mouse protocol
* simconnect protocol
* windows virtual joystick protocol

[Snaps]: https://snapcraft.io
[docker]: https://docker.com
[opentrack on the snap store]: https://snapcraft.io/opentrack
