# Seedbox

## What is in the box ?

* Muximux
* Transmission
* Deluge
* Sickrage
* Couchpotato
* Headphones
* Sonarr
* An explorer
* Plex
* OpenVPN

![image](https://cloud.githubusercontent.com/assets/7372540/24921942/6707f700-1ea1-11e7-80f8-dbf1be642c36.png)

![image](https://cloud.githubusercontent.com/assets/7372540/24925031/c9a77656-1eab-11e7-9c97-f09c55f3bf6e.png)

## OPENVPN

### Initialize your vpn
```
docker-compose run --rm openvpn ovpn_genconfig -u udp://VPN.SERVERNAME.COM
docker-compose run --rm openvpn ovpn_initpki
```

### Create an account
```
docker-compose run --rm openvpn easyrsa build-client-full CLIENTNAME nopass
```

### Retrieve the client configuration
```
docker-compose run --rm openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn
```


## Run the Seedbox

Edit the **env_config** to change the configuration.

You may want to change the UID and GID so each container will use the same user.

Build the images:
```
docker-compose build
```

Run the Seedbox:
```
docker-compose up -d
```
