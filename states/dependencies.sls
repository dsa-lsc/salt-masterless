
node-install:
  pkgrepo.managed:
    - name: "deb https://deb.nodesource.com/node_6.x {{ grains["oscodename"] }} main"
    - humanname: {{ grains["os"] }} {{ grains["oscodename"]|capitalize }} NodeJS Repository
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - file: /etc/apt/sources.list.d/nodesource.list
    - refresh_db: True
  pkg.installed:
    - name: nodejs
    - require:
      - pkgrepo: node-install

dependencies:
  pkg.installed:
    - pkgs:
      - nginx

install-ghost:
  npm.installed:
    - name: ghost-cli
    - require:
      - pkg: node-install
