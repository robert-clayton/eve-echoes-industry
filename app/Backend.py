import os
import gspread
import pandas as pd
from oauth2client.service_account import ServiceAccountCredentials
from PySide2 import QtCore

class Backend(QtCore.QObject):
    def __init__(self):
        super().__init__()
        self.scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
        self.credentials = ServiceAccountCredentials.from_json_keyfile_name(os.path.abspath('.service-key'), self.scope)
        self.client = gspread.authorize(self.credentials)
        self.sheet = self.client.open('Manufacturing')
        self.sheetBlueprints = self.sheet.get_worksheet(3)
    
    @QtCore.Slot(int)
    def getColumn(self, col: int):
        return [self.sheetBlueprints.cell(col, x) for x in range(1, 53)]
