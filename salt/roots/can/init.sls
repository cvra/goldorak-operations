dh-autoreconf:
    pkg.installed

https://github.com/linux-can/can-utils.git:
    git.latest:
        - rev: master
        - target: /usr/src/can-utils
        - user: root
        - require:
            - pkg: git

can-utils:
    cmd.run:
        - cwd: /usr/src/can-utils
        - user: root
        - name: |
            ./autogen.sh
            ./configure
            make
            make install
        - unless: /usr/local/bin/candump
        - require:
            - pkg: dh-autoreconf

can-setup:
    cmd.run:
        - user: root
        - cwd: /srv/salt/can
        - name: |
            echo BB-CAN1 > /sys/devices/platform/bone_capemgr/slots
            modprobe can
            modprobe can-dev
            modprobe can-raw
        - require:
            - cmd: can-utils

can-bashrc-setup:
    file.append:
        - name: "/etc/bash.bashrc"
        - text:
            - "sudo ip link set can1 up type can bitrate 1000000"
            - "sudo ifconfig can1 up"
            - "sudo config-pin P9.24 can"
            - "sudo config-pin P9.26 can"
            - "sudo config-pin P8.4 lo"
