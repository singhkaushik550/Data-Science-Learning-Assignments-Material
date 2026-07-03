import json
def load_schema():
    with open("config.json","r") as file:
        return json.load(file)