https://github.com/UAVCAN/libuavcan.git:
    git.latest:
        - rev: master
        - target: /usr/src/uavcan
        - user: root
        - force: True
        - require:
            - pkg: git

uavcan:
    cmd.run:
        - cwd: /usr/src/uavcan
        - user: root
        - name: |
            git submodule update --init
            mkdir -p build
            cd build
            cmake ..
            make
            make install
        - unless: /usr/local/bin/uavcan_monitor
        - require:
            - pkg: build-essential
