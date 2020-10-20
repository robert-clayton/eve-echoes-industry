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
        blueprintDropdown.model = Backend.listBlueprintsOfType('Rig')
        blueprintDropdown.activated(0)
    }

    RowLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        // Layout.alignment: Qt.AlignTop
        anchors.margins: 5
        id: optionsRow
        EButton {
            implicitWidth: 70
            implicitHeight: 25
            text: qsTr('Update')
            onClicked: Backend.updateBlueprintData()
        }   
        EButton {
            implicitWidth: 70
            implicitHeight: 25
            text: qsTr('Load')
            onClicked: Backend.loadBlueprintData()
        }
    }

    EComboBox {
        id: blueprintDropdown
        anchors.top: optionsRow.bottom
        anchors.left: parent.left
        anchors.margins: 30
        boxWidth: 400

        onActivated: {
            var blueprint = Backend.getBlueprintInfo(blueprintDropdown.model[index])
            if ('invalid' in blueprint) { 
                console.log('Invalid blueprint found:', blueprintDropdown.model[index])
                return; 
            }
            switch(blueprint['Type']) {
                case 'Rig':
                    infoArea.setRigBlueprint(blueprint)
                    break;
                case 'Frigate' || 'Destroyer' || 'Cruiser' || 'Battleship':
                    infoArea.setShipBlueprint(blueprint)
                    break;
            }
            
        }
    }

    GridLayout {
        id: infoArea
        anchors.top: blueprintDropdown.bottom
        anchors.left: parent.left
        anchors.margins: 30
        columns: 3

        function setRigBlueprint(blueprint) {
            for (var key in blueprint) {
                switch(key) {
                    case 'Tech Level': field0.init(key, blueprint[key]); break;
                    case 'Charred Micro Circuit': field1.init(key, blueprint[key]); break;
                    case 'Fried Interface Circuit': field2.init(key, blueprint[key]); break;
                    case 'Tripped Power Circuit': field3.init(key, blueprint[key]); break;
                    case 'Smashed Trigger Unit': field4.init(key, blueprint[key]); break;
                    case 'Damaged Close-in Weapon System': field5.init(key, blueprint[key]); break;
                    case 'Scorched Telemetry Processor': field6.init(key, blueprint[key]); break;
                    case 'Contaminated Lorentz Fluid': field7.init(key, blueprint[key]); break;
                    case 'Conductive Polymer': field8.init(key, blueprint[key]); break;
                    case 'Contaminated Nanite Compound': field9.init(key, blueprint[key]); break;
                    case 'Defective Current Pump': field10.init(key, blueprint[key]); break;
                }
            }
        }

        EDataField {
            readOnly: true
            id: field0
        }
        EDataField {
            readOnly: true
            id: field1
        }
        EDataField {
            readOnly: true
            id: field2
        }
        EDataField {
            readOnly: true
            id: field3
        }
        EDataField {
            readOnly: true
            id: field4
        }
        EDataField {
            readOnly: true
            id: field5
        }
        EDataField {
            readOnly: true
            id: field6
        }
        EDataField {
            readOnly: true
            id: field7
        }
        EDataField {
            readOnly: true
            id: field8
        }
        EDataField {
            readOnly: true
            id: field9
        }
        EDataField {
            readOnly: true
            id: field10
        }
    }
    
    GridLayout {
        id: inputArea
        anchors.top: infoArea.bottom
        anchors.left: parent.left
        anchors.margins: 30
        columns: 3

        EDataField {
            
            fades: false

            id: inField0
        }
        EDataField {
            id: inField1
        }
        EDataField {
            id: inField2
        }
        EDataField {
            id: inField3
        }
        EDataField {
            id: inField4
        }
        EDataField {
            id: inField5
        }
    }
}