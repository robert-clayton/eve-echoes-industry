pragma Singleton

import QtQuick 2.11
import Qt.labs.settings 1.0

Item {
    id: styling

    Settings {
        id: settings
        category: 'Settings'
        property alias theme: styling.theme
    }

    enum Theme {
        Caldari,
        Minmatar,
        Amarr,
        Gallente
    }

    // Styling
    readonly property int radius: 3
    readonly property int controlWidth: 225
    readonly property int controlHeight: 29
    property int theme: Style.Theme.Caldari

    // Theme
    property color background: {
        switch(theme) {
            case Style.Theme.Caldari: caldariBG; break;
            case Style.Theme.Minmatar: minmatarBG; break;
            case Style.Theme.Amarr: amarrBG; break;
            case Style.Theme.Gallente: gallenteBG; break;
        }
    }

    property color backgroundAlt: {
         switch(theme) {
            case Style.Theme.Caldari: caldariBGAlt; break;
            case Style.Theme.Minmatar: minmatarBGAlt; break;
            case Style.Theme.Amarr: amarrBGAlt; break;
            case Style.Theme.Gallente: gallenteBGAlt; break;
        }
    }

    property color foreground: {
        switch(theme) {
            case Style.Theme.Caldari: caldariFG; break;
            case Style.Theme.Minmatar: minmatarFG; break;
            case Style.Theme.Amarr: amarrFG; break;
            case Style.Theme.Gallente: gallenteFG; break;
        }
    }

    property color foregroundAlt: {
        switch(theme) {
            case Style.Theme.Caldari: caldariFGAlt; break;
            case Style.Theme.Minmatar: minmatarFGAlt; break;
            case Style.Theme.Amarr: amarrFGAlt; break;
            case Style.Theme.Gallente: gallenteFGAlt; break;
        }
    }

    readonly property color caldariBG: '#191919'
    readonly property color caldariFG: '#3C5F73'
    readonly property color minmatarBG: '#131414'
    readonly property color minmatarFG: '#5A3737'
    readonly property color amarrBG: '#191714'
    readonly property color amrrFG: '#BBA183'
    readonly property color gallenteBG: '#0F1414'
    readonly property color gallenteFG: '#576B66'
    readonly property color caldariBGAlt: '#0F1114'
    readonly property color caldariFGAlt: '#8A8F9A'
    readonly property color minmatarBGAlt: '#140D0F'
    readonly property color minmatarFGAlt: '#8C5055'
    readonly property color amarrBGAlt: '#12110A'
    readonly property color amrrFGAlt: '#9A6928'
    readonly property color gallenteBGAlt: '#0A0F0F'
    readonly property color gallenteFGAlt: '#9EAE95'

    // Accents
    readonly property color orange: '#FF6D11'
    readonly property color red: '#D95252'
    readonly property color green: '#5FD49A'
    readonly property color pink: '#E265B9'
    readonly property color purple: '#C490EB'
    readonly property color blue: '#58B5D8'
    readonly property color grey: '#888D94'

    // Icons
    // readonly property string logoFull: 'qrc:/Icons/logo-full.svg'

    // Font
    readonly property string fontRegular: evesansneueRegular.name
    readonly property string fontBold: evesansneueBold.name // TODO: Name is Eve Sans Neue, needs to be different
    readonly property string fontItalic: evesansneueItalic.name
    readonly property string fontCondensed: evesansneueCondensed.name
    readonly property int fontContentSize: 12
    readonly property int fontSubTitleSize: 14
    readonly property int fontTitleSize: 17
    readonly property int headerSize: 32

    FontLoader { id: evesansneueRegular; source: '../Fonts/evesansneue-regular.otf' }
    FontLoader { id: evesansneueBold; source: '../Fonts/evesansneue-bold.otf' }
    FontLoader { id: evesansneueItalic; source: '../Fonts/evesansneue-italic.otf' }
    FontLoader { id: evesansneueCondensed; source: '../Fonts/evesansneue-condensed.otf' }

    // Animations
    readonly property int themeAnimSpeed: 300
    Behavior on background { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
    Behavior on backgroundAlt { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
    Behavior on foreground { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
    Behavior on foregroundAlt { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
}