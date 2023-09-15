import requests

link = "http://172.16.0.30:8090/httpclient.html"

# Enter your username and password here
username = "username"
password = "password"

while True:
    r = requests.post(
        link, data={"username": username, "password": password, "mode": 191}
    )
    if r.status_code == 200:
        break
