import socket
import string
import random
import base64

# pip install pyqrcode
import pyqrcode

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.SystemRandom().choice(chars) for _ in range(size))

method = "aes-256-cfb"
port = "8388"
ip = socket.gethostbyname(socket.gethostname())
password = id_generator(10)
ss =  method + ":" + password + "@" + ip + ":" + port
ss = 'ss://' + base64.b64encode(ss)
ss = pyqrcode.create(ss)
ss.svg('ss.svg', scale=5)
