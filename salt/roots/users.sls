ubuntu:
    user.present:
        - shell: /bin/bash
        - home: /home/ubuntu
        - groups:
            - sudo
            - dialout
            - plugdev
