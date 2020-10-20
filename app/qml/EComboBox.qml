import QtQuick.Controls 2.15
import QtQuick 2.11

import "qrc:/"

ComboBox {
    id: control
    font.family: Style.fontRegular
    font.pixelSize: Style.fontTitleSize

    property alias boxWidth: rect.implicitWidth
    property alias boxHeight: rect.implicitHeight
    property int textPadding: 25

    background: Rectangle {
        id: rect
        color: Style.foreground
        implicitWidth: 70
        implicitHeight: 35

        opacity: control.hovered ? 1 : .9

        transitions: Transition { 
            ColorAnimation { duration: 150; easing.type: Easing.InOutQuad; }
        }
    }

    contentItem: ELabel {
        anchors.fill: parent
        anchors.leftMargin: control.textPadding
        text: control.displayText
        color: 'white'
        elide: ELabel.ElideRight
        verticalAlignment: ELabel.AlignVCenter
    }

    delegate: ItemDelegate {
        id: itemDelegate
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] 
                                                                 : model[control.textRole]) 
                                : modelData
        font.family: control.currentIndex === index ? Style.fontRegular
                                                     : Style.fontBold
        font.pixelSize: Style.fontContentSize
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled

        background: Rectangle {
            id: rectPopup
            color: control.highlightedIndex === index? Style.foregroundAlt : Style.foreground
            implicitWidth: 70
            implicitHeight: 35

            transitions: Transition { ColorAnimation { duration: 150; easing.type: Easing.InOutQuad; }}
        }

        contentItem: ELabel {
            color: 'white'
            anchors.fill: parent
            text: itemDelegate.text
            elide: ELabel.ElideRight
            verticalAlignment: ELabel.AlignVCenter
            anchors.leftMargin: itemDelegate.highlighted ? control.textPadding : 10

            Behavior on anchors.leftMargin {SmoothedAnimation { duration: 150 }}
        }
    }
}