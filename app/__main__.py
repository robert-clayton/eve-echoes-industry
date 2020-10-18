import sys
import os
from PySide2 import QtWidgets, QtQml, QtCore
from . import Backend

app = QtWidgets.QApplication(sys.argv)
app.setOrganizationName('Ziru\'s Musings')
app.setOrganizationDomain('github.com/robert-clayton')
app.setApplicationName('EVE Echoes Industry')
app.setDesktopFileName('EVE Echoes Industry')
app.setApplicationVersion('0.1.0')

backend = Backend.Backend()
engine = QtQml.QQmlApplicationEngine()
engine.rootContext().setContextProperty("Backend", backend)

if hasattr(sys, 'frozen'):
    from . import QMLPacked
    engine.load(':/GUI.qml')
else:
    path = os.path.dirname(os.path.abspath(__file__))
    engine.load(QtCore.QUrl.fromLocalFile(os.path.join(path, 'qml', 'GUI.qml')))

if not engine.rootObjects():
    sys.exit(-1)
sys.exit(app.exec_())
