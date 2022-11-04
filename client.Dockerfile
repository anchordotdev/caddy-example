from ubuntu

arg DEBIAN_FRONTEND=noninteractive

run apt-get update -y && apt-get install -y curl

run mkdir -p /srv

copy ca-certificates-*.deb /srv/
run dpkg -i /srv/ca-certificates-*.deb

# cmd ["curl", "-vv", "https://api.my-org.internal/alice"]
cmd sleep infinity
