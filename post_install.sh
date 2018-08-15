#!/bin/bash
#
# add repos
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository ppa:dobey/redshift-daily
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AD555F67

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# remove default apps
sudo apt purge ubuntu-web-launchers

# install apps
sudo apt-get -y install unity-tweak-tool indicator-multiload curl redshift redshift-gtk gparted dkms nautilus-open-terminal linux-headers-generic build-essential libavcodec-extra conky-all tlp tlp-rdw htop ssh openssh-server git

# folders
rm ~/examples.desktop

# Start TLP
sudo tlp start

# update system settings
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://gnome-control-center.desktop', 'application://gnome-terminal.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set com.ubuntu.update-notifier regular-auto-launch-interval 0
gsettings set de.mh21.indicator.multiload.general autostart true
gsettings set de.mh21.indicator.multiload.general speed 500
gsettings set de.mh21.indicator.multiload.general width 75
gsettings set de.mh21.indicator.multiload.graphs.cpu enabled true
gsettings set de.mh21.indicator.multiload.graphs.disk enabled true
gsettings set de.mh21.indicator.multiload.graphs.load enabled true
gsettings set de.mh21.indicator.multiload.graphs.mem enabled true
gsettings set de.mh21.indicator.multiload.graphs.net enabled true
gsettings set de.mh21.indicator.multiload.graphs.swap enabled false
gsettings set org.freedesktop.ibus.general engines-order "['xkb:us::eng']"
gsettings set org.freedesktop.ibus.general preload-engines "['xkb:us::eng']"
gsettings set org.gnome.DejaDup backend 'file'
gsettings set org.gnome.DejaDup delete-after 365
gsettings set org.gnome.DejaDup periodic-period 1
gsettings set org.gnome.DejaDup welcomed true
gsettings set org.gnome.desktop.a11y.magnifier mag-factor 13.0
gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['lv3:ralt_switch', 'compose:rctrl']"
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gnome.gitg.preferences.commit.message right-margin-at 72
gsettings set org.gnome.gitg.preferences.commit.message show-right-margin true
gsettings set org.gnome.gitg.preferences.diff external false
gsettings set org.gnome.gitg.preferences.hidden sign-tag true
gsettings set org.gnome.gitg.preferences.view.files blame-mode true
gsettings set org.gnome.gitg.preferences.view.history collapse-inactive-lanes 2
gsettings set org.gnome.gitg.preferences.view.history collapse-inactive-lanes-active true
gsettings set org.gnome.gitg.preferences.view.history search-filter false
gsettings set org.gnome.gitg.preferences.view.history show-virtual-staged true
gsettings set org.gnome.gitg.preferences.view.history show-virtual-stash true
gsettings set org.gnome.gitg.preferences.view.history show-virtual-unstaged true
gsettings set org.gnome.gitg.preferences.view.history topo-order false
gsettings set org.gnome.gitg.preferences.view.main layout-vertical 'vertical'
gsettings set org.gnome.nautilus.list-view default-zoom-level 'smaller'
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal 'XF86Launch1'
gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'

# update some more system settings
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 32
dconf write /org/compiz/profiles/unity/plugins/core/vsize 1
dconf write /org/compiz/profiles/unity/plugins/core/hsize 5
dconf write /org/compiz/profiles/unity/plugins/opengl/texture-filter 2
dconf write /org/compiz/profiles/unity/plugins/unityshell/alt-tab-bias-viewport false

# requires clicks
sudo apt-get install -y ubuntu-restricted-extras

# prompt for a reboot
clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""