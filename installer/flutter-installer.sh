#!/data/data/com.termux/files/usr/bin/bash
# 
# Efficient Flutter Setup Script with Debian Proot Environment
#
# Only for ARM64/AARCH64 
#
#########################################



FLUTTER_VERSION="2.16.0"

DISCORD_LINK="https://scodetstudio.com/community"

msg() {
    echo -e "[*] $@"
}

error_msg() {
    echo -e "[!] $@" >&2
}

check_deps() {
    pkgs=("proot-distro" "curl" "git" "unzip" "sed")

    for pkg in pkgs; do
        if [ -z $(command -v ${pkg}) ]; then
            msg "Installing ${pkg}"
            apt install ${pkg} > /dev/null 2>&1
        fi
    done

    if [ -z $(command -v termux-open-url) ]; then
        msg "Installing termux-open-url"
        apt install termux-tools > /dev/null 2>&1
    fi
}

is_android_sdk_installed() {
    if [ ! -d ${PREFIX}/share/android-sdk ]; then
        error_msg "Android SDK not found. You will now be redirected to the installation guide. Please follow the steps and run the script again."
        sleep 4
        termux-open-url ${ANDROID_SDK_INSTALLATION_GUIDE}
        exit 1
    fi
}

install_debian() {
    proot-distro install debian --override-alias flutter
}

install_flutter() {
    proot-distro login flutter -- curl -LO https://github.com/Jaseunda/scode-packages/releases/download/flutter-sdk/Flutter-ARM64.zip 
    proot-distro login flutter -- curl -LO https://github.com/Jaseunda/scode-packages/releases/download/flutter-sdk/gen_snapshot.zip
    proot-distro login flutter -- unzip Flutter-ARM64.zip 
    proot-distro login flutter -- unzip gen_snapshot.zip
    proot-distro login flutter -- sed -i 's#export PATH=.*#&:~/flutter/bin#g' /etc/profile.d/termux-proot.sh
    proot-distro login flutter -- mkdir -p /root/flutter/bin/cache/artifacts/engine/android-arm64-release/linux-arm64
    proot-distro login flutter -- mv gen_snapshot /root/flutter/bin/cache/artifacts/engine/android-arm64-release/linux-arm64/
    proot-distro login flutter -- flutter doctor
    proot-distro login flutter -- flutter config --android-sdk $PREFIX/share/android-sdk
    proot-distro login flutter -- apt update -y
    proot-distro login flutter -- apt install openjdk-11-jdk -y
}

post_install_msg() {
    msg "Don't worry if you run into any issues, we've got you covered! Just drop by our friendly Discord community and we'll be happy to help you out."
    msg 
    msg "Would you like to join our Discord community? ? [y/n]"

    read choice

    if [ "${choice}" = "y"  ] || [ "${choice}" = "Y"  ]; then
        termux-open-url ${DISCORD_LINK}
    fi
}


check_deps
is_android_sdk_installed
install_debian
install_flutter
post_install_msg
