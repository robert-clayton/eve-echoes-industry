import os
import json
import gspread
import pandas as pd
from oauth2client.service_account import ServiceAccountCredentials
from collections import defaultdict
from PySide2 import QtCore

class Backend(QtCore.QObject):
    def __init__(self):
        super().__init__()
        if not os.path.isfile(os.path.abspath('blueprints.json')):
            self.sheetBlueprints = self.updateBlueprintData()
        else:
            self.sheetBlueprints = self.loadBlueprintData()

    def transposeBlueprintData(self, blueprintData):
        temp = defaultdict(dict)
        for blueprint in self.sheetBlueprints:
            name = blueprint.pop('Name', None)
            for key, value in blueprint.items():
                temp[key][name] = value
        return temp

    @QtCore.Slot()
    def updateBlueprintData(self):
        scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
        credentials = ServiceAccountCredentials.from_json_keyfile_name(os.path.abspath('.service-key'), scope)
        client = gspread.authorize(credentials)
        sheet = client.open('Manufacturing')
        sheetBlueprints = sheet.get_worksheet(3).get_all_records()
        transposedSheet = self.transposeBlueprintData(sheetBlueprints)
        with open('blueprints.json', 'w+') as f:
            json.dump(transposedSheet, f)
        return sheetBlueprints
    
    @QtCore.Slot()
    def loadBlueprintData(self):
        with open('blueprints.json', 'r') as f:
            return json.load(f)
    
    @QtCore.Slot(result="QStringList")
    def listBlueprints(self):
        return sorted(self.sheetBlueprints.keys())
