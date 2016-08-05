# Run OpenVPN
docker run --name ovpn --volumes-from ovpn-data -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
