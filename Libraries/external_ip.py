import requests

URL = "https://myexternalip.com/raw"

def get_external_ip():
    response = requests.request("GET", URL, headers={}, data = {})
    return response.text
