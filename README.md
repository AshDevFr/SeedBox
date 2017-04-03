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

Edit the **env_config** to change the configuration

Run the Seedbox:
```
docker-compose up -d
```


## Explorer

The explorer used is **Filerun** The default login password is *superuser/superuser*
