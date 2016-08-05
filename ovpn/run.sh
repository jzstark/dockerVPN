# Run OpenVPN
OVPN_DATA=ovpn-data
docker run --name ovpn --volumes-from $OVPN_DATA -d -p 1194:1194/udp --cap-add=NET_ADMIN matrixanger/rpi-ovpn
