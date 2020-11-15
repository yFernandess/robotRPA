import requests
from urllib.parse import quote as encode
import logging
import json
import csv

logger = logging.getLogger(__name__)
hdlr = logging.FileHandler('./clashRoyaleAPI.log')
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
hdlr.setFormatter(formatter)
logger.addHandler(hdlr) 
logger.setLevel(logging.INFO)

BASE_URL = "https://api.clashroyale.com/v1/"

def _get_list_of_clan_members(token, clan_tag):
    logger.info(f"Obtendo a lista dos membros do clã {clan_tag}")
    url = BASE_URL + "clans/" + encode(clan_tag) + "/members"

    
    headers = {
        'Authorization': 'Bearer ' + token
    }

    logger.debug("Realizando requisição GET: " + url)

    try:
        response = requests.request("GET", url, headers=headers, data = {})
        logger.debug(json.dumps(response.json(), indent=3))
        return response.json()["items"]
    except Exception as err:
        message_error = ("Erro ao realizar a requisição GET para obter a lista de membros do clã. "
                         f"Detalhes: {err}")
        logger.error(message_error)
        raise


def _get_clans_by_name(token, cla_name):
    logger.info(f"Obtendo a lista de clãs pelo nome {cla_name}")
    url = BASE_URL + "clans?name=" + encode(cla_name)
    headers = {
        'Authorization': 'Bearer ' + token
    }

    logger.debug("Realizando requisição GET: " + url)

    try:
        response = requests.request("GET", url, headers=headers, data = {})
        logger.debug(json.dumps(response.json(), indent=3))
        return response.json()["items"]
    except Exception as err:
        message_error = ("Erro ao realizar a requisição GET para obter a lista de clãs. "
                         f"Detalhes: {err}")
        logger.error(message_error)
        raise

def get_tag_clan(token, clan_name, partial_tag_clan, country_clan):
    logger.info(f"Buscando pelo clã {clan_name} brasileiro")
    list_clans = _get_clans_by_name(token, clan_name)
    tag = None
    for clan in list_clans:
        if (clan['tag'].startswith(partial_tag_clan) and
            clan['location']['name'] == country_clan):
            tag = clan['tag'] 
            return tag

def create_file_of_clan_members(token, clan_tag):
    logger.info(f"Criando o arquivo de informações dos membros do clã {clan_tag}")
    list_clan_members = _get_list_of_clan_members(token, clan_tag)
    logger.debug(list_clan_members)

    
    with open('informacoes_membros_clan.csv', 'w', encoding='utf-8', newline='') as file:
        writer = csv.writer(file)

        writer.writerow(["Nome", "Level", "Troféus", "Papel"])

        for member in list_clan_members:
            writer.writerow([member['name'], member['expLevel'], member['trophies'], member['role']])
