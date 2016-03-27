device-tree-compiler:
    pkg.installed

https://github.com/cdsteinkuehler/beaglebone-universal-io:
    git.latest:
        - rev: master
        - target: /opt/source/beaglebone-universal-io
        - user: root
        - require:
            - pkg: git

beaglebone-universal-io:
  cmd.run:
    - cwd: /opt/source/beaglebone-universal-io
    - user: root
    - name: make install
    - unless: /usr/local/bin/config-pin

