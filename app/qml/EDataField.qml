import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

import "qrc:/"

Rectangle {
    id: control
    implicitWidth: 250
    implicitHeight: 25
    color: Style.foregroundAlt
    radius: Style.radius
    opacity: mouse.hovered ? 1 : .9
    Behavior on opacity { NumberAnimation{ duration: 150 } }
    
    property alias text: valueLabel.text
    property alias readOnly: valueLabel.readOnly
    property alias keyLabel: keyLabel.text
    property alias valueWidth: valueLabel.width
    property bool fades: true

    function init(key, value) {
        control.text = value
        keyLabel.text = key
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }

    ELabel {
        id: keyLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.family: Style.fontCondensed
        font.pixelSize: Style.fontSubTitleSize

        Behavior on text { EFadeAnimation { target: keyLabel } }
    }

    Rectangle {
        anchors.right: valueLabel.right
        color: Style.foregroundAlt
        radius: Style.radius
        width: valueLabel.width
        height: valueLabel.height

        Behavior on width { SmoothedAnimation{ duration: 150 } }
    }

    TextField {
        id: valueLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        horizontalAlignment: TextInput.AlignRight
        font.family: Style.fontCondensed
        font.pixelSize: Style.fontSubTitleSize
        height: parent.height
        width: mouse.hovered ? parent.width * .4 : parent.width * .2

        validator: DoubleValidator{}

        background: Rectangle{opacity: 0}

        Behavior on text { enabled: !mouse.hovered; EFadeAnimation { target: valueLabel } }
    }
}