# Dev machine

## Installation on the Beaglebone black
1. Install Ubuntu 14.04 on the laptop. The user is assumed to be `ubuntu`
2. Bootstrap saltstack

    ```
    sudo add-apt-repository ppa:saltstack/salt
    sudo apt-get update
    sudo apt-get install salt-minion salt-common
    ```
3. Clone this repository somewhere
4. Symlink to Salt `sudo ln -s /path/to/repo/salt/roots/ /srv/salt`
5. Run `sudo salt-call --local state.highstate`
6. Reboot

The laptop should now be fully provisionned.

