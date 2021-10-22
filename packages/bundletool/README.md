# bundletool for scode studio

Bundletool is a tool to manipulate Android App Bundles.

**Install bundle tool**

Prepareration for installing bundletool
```
apt update && apt upgrade -y && pkg update -y && pkg install git ruby curl clang proot make -y && git clone https://github.com/Linuxbrew/brew.git ~/prefix/brew && cd ~/prefix/brew && alias brew="termux-chroot $PWD/bin/brew"
```
# What is bundletool

The **Android App Bundle** is a new format for publishing Android apps in app
distribution stores such as Google Play.

Bundletool has a few different responsibilities:

*   **Build an Android App Bundle** from pre-compiled modules of a project.

*   **Generate an APK Set archive** containing APKs for all possible devices.

*   **Extract APK(s)** from the APK Set compatible with a given device.

*   **Install APK(s)** from the APK Set compatible with a connected device.

*   **Extract device spec** from a device as a JSON file.

*   **Add code transparency** to an Android App Bundle. Code transparency is an
    optional code signing mechanism.

*   **Verify code transparency** inside an Android App Bundle, APK files or an
    application installed on a connected device.

Read more about the App Bundle format and Bundletool's usage at
[g.co/androidappbundle](https://g.co/androidappbundle)

Documentation of bundletool commands can be found at:
https://developer.android.com/studio/command-line/bundletool

## Resources

Latest release: [1.8.1](https://github.com/google/bundletool/releases)
