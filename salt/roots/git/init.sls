git:
    pkg.installed

git-config:
    file.managed:
        - name: ~/.gitconfig
        - source: salt://git/config
        - user: ubuntu
        - force: True
