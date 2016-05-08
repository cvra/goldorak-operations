vim:
    pkg.installed

# Friendly Interactive SHell
fish:
    pkg.installed

tmux:
    pkg.installed

minicom:
    pkg.installed

aptitude:
    pkg.installed

silversearcher-ag:
    pkg.installed

htop:
    pkg.installed

curl:
    pkg.installed

iptables:
    pkg.installed

mosh:
    pkg.installed

mosh-ports:
    cmd.run:
        - user: root
        - name: iptables -I INPUT 1 -p udp --dport 60000:61000 -j ACCEPT
        - require:
            - pkg: iptables
