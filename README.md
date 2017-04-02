# Seedbox

## OPENVPN

### Initialize your vpn
```
docker-compose run openvpn ovpn_genconfig -u udp://VPN.SERVERNAME.COM
docker-compose run openvpn ovpn_initpki
```

### Create an account
```
docker-compose run openvpn easyrsa build-client-full CLIENTNAME nopass
```

### Retrieve the client configuration
```
docker-compose run openvpn easyrsa build-client-full ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn
```
