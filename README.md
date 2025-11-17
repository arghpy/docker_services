# docker_services

[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

This repository contains the docker services that I use on my homelab and jumpserver.

# Services

Homelab:
- [grafana](https://github.com/grafana/grafana)
- [prometheus](https://github.com/prometheus/prometheus)
- [homepage](https://github.com/gethomepage/homepage)
- [immich](https://github.com/immich-app/immich)
- [rtsp-detect-people](https://github.com/arghpy/rtsp-detect-people)
- [nextcloud](https://github.com/nextcloud/server)
- [jellyfin](https://github.com/jellyfin/jellyfin)
- [vaultwarden](https://github.com/dani-garcia/vaultwarden)

Jumpserver:
- [caddy](https://github.com/caddyserver/caddy)
- [pihole](https://github.com/pi-hole/pi-hole)

## Pi-Hole

In my setup I also use [PiVPN](https://github.com/pivpn/pivpn) to connect to my home.

Pi-Hole also contains references to this in the dnsmasq configuration.

#### PiVPN

In the services files, there are a lot of mentions of `<OWNED_DOMAIN>`. This domain
will need to be mentioned when going through the configuration of PiVPN.

Additionally, I changed the following values in **/etc/pivpn/wireguard/setupVars.conf**:
```
pivpnDNS1=<WG_SERVER_IP>
ALLOWED_IPS="0.0.0.0/0, ::0/0"
```

Sometimes it may happen that ip forwarding and masquerading are not configured properly
at the first run. You can try to run `pivpn debug` and choose to apply the settings
if you are prompted. If this still doesn't work, run:
```console
# Enable masquerading
sudo iptables -t nat -D POSTROUTING -s <WG_SUBNET> -o <INTERNET_INTERFACE> -j MASQUERADE
# E.g:
sudo iptables -t nat -D POSTROUTING -s 10.58.243.0/24 -o eth0 -j MASQUERADE

# Enable forwarding
sudo iptables -A FORWARD -i <WG_INTERFACE> -j ACCEPT
sudo iptables -A FORWARD -o <WG_INTERFACE> -j ACCEPT
# E.g:
sudo iptables -A FORWARD -i wg0 -j ACCEPT
sudo iptables -A FORWARD -o wg0 -j ACCEPT
```
