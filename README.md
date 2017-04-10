# Seedbox

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
