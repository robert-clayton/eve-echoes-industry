import QtQuick.Controls 2.15

import "qrc:/"

ComboBox {
    id: comboBox
    font.family: Style.fontRegular
    font.pixelSize: Style.fontTitleSize
    
    delegate: ItemDelegate {
        id: itemDelegate
        width: comboBox.width
        text: comboBox.textRole ? (Array.isArray(comboBox.model) ? modelData[comboBox.textRole] : model[comboBox.textRole]) : modelData
        font.weight: comboBox.currentIndex === index ? comboBox.font.fontBold : comboBox.font.fontRegular
        highlighted: comboBox.highlightedIndex === index
        hoverEnabled: comboBox.hoverEnabled

        contentItem: ELabel {
            text: itemDelegate.text
            font: itemDelegate.font
            elide: ELabel.ElideRight
            verticalAlignment: ELabel.AlignVCenter
            horizontalAlignment: ELabel.AlignHCenter
        }
    }
}