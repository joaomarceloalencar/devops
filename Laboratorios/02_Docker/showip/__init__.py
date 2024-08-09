from flask import Flask 
import requests
import netifaces

app = Flask(__name__)

def get_all_ips():
    """Retorna um dicionário com os endereços IP de todas as interfaces de rede."""

    interfaces = netifaces.interfaces()
    ips_por_interface = {}

    for interface in interfaces:
        enderecos = netifaces.ifaddresses(interface)
        ips_v4 = enderecos.get(netifaces.AF_INET)  # Endereços IPv4
        ips_v6 = enderecos.get(netifaces.AF_INET6)  # Endereços IPv6

        ips = []
        if ips_v4:
            ips.extend([addr['addr'] for addr in ips_v4])
        if ips_v6:
            ips.extend([addr['addr'] for addr in ips_v6])

        ips_por_interface[interface] = ips

    return ips_por_interface

@app.route('/')
def home():
     all_ips = get_all_ips()
     for interface, ips in all_ips.items():
         if interface == "eth0":
             return "eth0: " + ips[0]

def create_app():
    return app
