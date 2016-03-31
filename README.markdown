# Goldorak BBB setup

## Installation on the Beaglebone black
1. Install Ubuntu 14.04 on the board. The user is assumed to be `ubuntu`
2. Bootstrap saltstack

    ```
    sudo apt-get -y install software-properties-common
    sudo add-apt-repository -y ppa:saltstack/salt
    sudo apt-get update
    sudo apt-get -y install salt-minion salt-common
    ```
3. Clone this repository somewhere
4. Symlink to Salt `sudo ln -s /path/to/repo/salt/roots/ /srv/salt`
5. Run `sudo salt-call --local state.highstate`
6. Reboot

The board should now be fully provisionned.

## Installation on the Beaglebone black, the short way
1. `wget https://raw.githubusercontent.com/cvra/goldorak-operations/master/bootstrap.sh`
2. As ubuntu user run `sh bootstrap.sh`
