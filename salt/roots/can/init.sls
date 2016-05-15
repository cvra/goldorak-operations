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

can-modules-setup:
    file.append:
        - name: "/etc/modules"
        - text:
            - "can"
            - "can_raw"
            - "vcan"

can-network-setup:
    file.append:
        - name: "/etc/network/interfaces"
        - text:
            - "allow-hotplug can1"
            - "auto can1"
            - "iface can1 can static"
            - "    pre-up /usr/bin/env config-pin overlay cape-universaln"
            - "    pre-up /usr/bin/env config-pin P9.24 can"
            - "    pre-up /usr/bin/env config-pin P9.26 can"
            - "    bitrate 1000000"
            - "    samplepoint 0.875"

