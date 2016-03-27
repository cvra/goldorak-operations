libpcre3-dev:
    pkg.installed

https://github.com/intel-iot-devkit/mraa.git:
    git.latest:
        - rev: master
        - target: /usr/src/mraa
        - user: root
        - require:
            - pkg: git

mraa:
  cmd.run:
    - cwd: /usr/src/mraa
    - user: root
    - name: |
        mkdir -p build
        cd build
        cmake .. -DCMAKE_BUILD_TYPE=DEBUG -DBUILDARCH=arm -DBUILDSWIGNODE=OFF
        make
        make install
        echo "/usr/local/lib/arm-linux-gnueabihf/" >> /etc/ld.so.conf
        ldconfig
        cp examples/mraa-gpio /usr/local/bin
        chmod +x examples/mraa-gpio
    - unless: /usr/local/bin/mraa-gpio

