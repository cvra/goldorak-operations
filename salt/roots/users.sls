ubuntu:
    user.present:
        - shell: /usr/bin/fish
        - home: /home/ubuntu
        - groups:
            - sudo
            - dialout
            - plugdev
            - vboxusers
            - docker
