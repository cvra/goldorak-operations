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
        - name: |
            config-pin P9.24 can
            config-pin P9.26 can
            ip link set can1 up type can bitrate 1000000
            ifconfig can1 up
        - require:
            - cmd: can-utils
