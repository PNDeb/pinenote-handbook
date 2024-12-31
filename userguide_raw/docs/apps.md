# Apps

This page is dedicated to the instructions for getting/configuring various apps
to work nicely on the PineNote.

## GIMP
### Installing
Unfortunately, it appears the Debian repos for arm don't have GIMP in them.
Luckily for us, flatpak does have it.

We can install flatpak using `sudo apt install flatpak
gnome-software-plugin-flatpak` (the second package lets you use flatpak from
the software center).

Once installed we can add flathub using `sudo flatpak remote-add
--if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

Then we can install gimp, `sudo flatpak install org.gimp.GIMP`. You may need to
restart to get it to show up in the app launcher.

For more info on flatpak, see the [Debian wiki
article](https://wiki.debian.org/Flatpak) on it.

### Configuring
Once installed, there are some setting you'll want to tweak on it. First lets
get the pen working properly.

From GIMP's top bar, go to Edit > Input Devices. Then click xwayland-tablet
stylus and change the mode to screen. Repeat this process for xwayland-tablet
eraser then hit save and then close. More info regarding using the pen in gimp
can be found in [GIMP's
documentation](https://developer.gimp.org/core/specifications/graphic_tablets_support/).

Next we'll tell GIMP to use our system theme, which works a bit nicer on the e
ink screen. On the top bar, click Edit > Preferences, then under Interface
click theme and then system. You may also want to switch the icon theme while
you have this menu open. I find Symbolic-Inverted-High-Contrast seems to work
well for me. Then click ok to save and exit the menu.

Finally, if you want the pen button to move the canvas around, you need to
change what the button does system wide. You can do this by launching the
Settings app going to Wacom Tablet in the sidebar, scrolling down to General
Pen, and changing button 1 to middle mousebutton Click.

## Xournal++

The PineNote Debian image comes with a custom build of Xournal++ preinstalled.
However, there are some settings you need to tweak for the pen's eraser to
work. From the top bar go to Edit > Preference. I found clicking the Edit
button with the touch screen is finicky, but if I hover the pen over it for
half a second then press it, it seems to open consistently.

From the preferences menu go to Input System. Then from there make sure the
device labeled Stylus (Pen) is set to Pen and the one labeled Stylus (Eraser)
(eraser) is set to Eraser.

Then go to Stylus on the side bar and scroll down to Stylus Buttons. Here you
can change what the different pen functions do. Button 1 is the button on the
side. I personally changed the eraser to behave as an eraser. You'll also want
to change Stylus-based eraser is visible to Never, to prevent artifacts from
the eraser.

## FireFox

Firefox is preinstalled on the Debian image. Generally it should work fine out
of the box. However, you can get some better performance out of it by enabling
hardware acceleration on it, as described in [0ccam's
notes](https://github.com/0cc4m/pinenote-misc#firefox-hardware-acceleration).

You can add `MOZ_ENABLE_WAYLAND=1` to your environment my making a new file at
`/etc/profile.d/firefox-wayland.sh` as root and putting `export
MOZ_ENABLE_WAYLAND=1` in it. Then after restarting, you can go to
`about:config` in firefox and set `gfx.webrender.all` to true. `about:support`
should now show `WebRender` under Compositing, instead of `WebRender
(Software)`.

