from ubuntu

arg DEBIAN_FRONTEND=noninteractive

run apt-get update -y && apt-get install -y software-properties-common debian-keyring debian-archive-keyring apt-transport-https curl
run curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
run curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
run apt-get update -y --assume-yes && apt-get install -y --assume-yes caddy

run mkdir -p /srv

copy Caddyfile /srv/Caddyfile
workdir /srv

env ACME_DIRECTORY_URL=
env ACME_KID=
env ACME_HMAC_KEY=
env DNS_NAME=

cmd /usr/bin/caddy run

