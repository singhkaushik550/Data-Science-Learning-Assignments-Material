import json
def load_schema():
    with open("config/config.json","r") as file:
        return json.load(file)