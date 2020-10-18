import QtQuick 2.11
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtQml 2.15

import "qrc:/"

ApplicationWindow {
    id: app
    width: 820
    height: 450
    visible: true
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    color: Style.background

    Component.onCompleted: {
        blueprintDropdown.model = Backend.listBlueprints()
    }

    ColumnLayout {
        anchors.fill: parent
        ComboBox {
            id: blueprintDropdown
        }
        
        Button {
            text: qsTr('Update')
            onClicked: {
                Backend.updateBlueprintData()
            }
        }   
        Button {
            text: qsTr('Load')
            onClicked: {
                Backend.loadBlueprintData()
            }
        }
    }
}