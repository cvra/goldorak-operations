locale-config:
    file.managed:
        - name: /etc/default/locale
        - source: salt://etc/locale
        - user: root
        - force: True
