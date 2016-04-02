ubuntu:
    user.present:
        - shell: /usr/bin/bash
        - home: /home/ubuntu
        - groups:
            - sudo
            - dialout
            - plugdev
