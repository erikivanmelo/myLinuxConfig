#!/usr/bin/python3

from json import dumps
from requests import post

url = 'https://tarjetasube.sube.gob.ar/SubeWeb//jsonPrivate/CardsWeb/GetMovements'

headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Cookie': 'ASP.NET_SessionId=lgarwcbuhucdmcrmwshyjev5; .SubeWebApp=4iKj_-o8MMfrXHu4b7_N3XgPAD0DOrU5a57oErq99sCjKC-hFxG-kRLtk-s8VK-0xrSu5Qi7RAWig6XmTr25rFOdN9KkJUZH3n59F1vK4sXAGPoah4Et-eVoTYTlYaR1iuh3UUrgzijRMcau5ahnWU_WfzTXMU2-vrPQ_QRckCFtdo8mGGha2O8RsAK2TdL3n7roazJhu-IBT2Ykky16sUgEoOM'
}

data = {
    'CardNumber': '980910',
    'DateFrom': '',
    'DateTo': '',
    'MovementType': '',
    'EntityLine': ''
}

print(
    post(
        url,
        headers=headers,
        json=data
    ).json()
)
