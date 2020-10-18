pragma Singleton

import QtQuick 2.11
import Qt.labs.settings 1.0

Item {
    id: styling

    Settings {
        id: settings
        category: 'Settings'
        property alias dockPosition: styling.dockPosition
        property alias theme: styling.theme
    }

    enum Theme {
        Caldari,
        CaldariAlt,
        Minmatar,
        MinmatarAlt,
        Amarr,
        AmarrAlt,
        Gallente,
        GallenteAlt,
    }


    // Styling
    readonly property int radius: 5
    readonly property int controlWidth: 225
    readonly property int controlHeight: 29
    property int theme: Caldari

    
    // Theme
    property color background: {
        switch(theme) {
            case Theme.Caldari: caldariBG; break;
            case Theme.CaldariAlt: caldariBGAlt; break;
            case Theme.Minmatar: minmatarBG; break;
            case Theme.MinmatarAlt: minmatarBGAlt; break;
            case Theme.Amarr: amarrBG; break;
            case Theme.AmarrAlt: amarrBGAlt; break;
            case Theme.Gallente: gallenteBG; break;
            case Theme.GallenteAlt: gallenteBGAlt; break;
        }
    }

    property color foreground: {
        switch(theme) {
            case Theme.Caldari: caldariFG; break;
            case Theme.CaldariAlt: caldariFGAlt; break;
            case Theme.Minmatar: minmatarFG; break;
            case Theme.MinmatarAlt: minmatarFGAlt; break;
            case Theme.Amarr: amarrFG; break;
            case Theme.AmarrAlt: amarrFGAlt; break;
            case Theme.Gallente: gallenteFG; break;
            case Theme.GallenteAlt: gallenteFGAlt; break;
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
    // readonly property string logoFull: 'qrc:/Icons/logo-optim-full.svg'


    // Font
    readonly property string fontFamily: 'Open Sans'
    readonly property int fontContentSize: 11
    readonly property int fontSubTitleSize: 13
    readonly property int fontTitleSize: 17

    readonly property int headerSize: 32

    // Animations
    readonly property int themeAnimSpeed: 300

    Behavior on background { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
    Behavior on foreground { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
    Behavior on accent { ColorAnimation { duration: 300; easing.type: Easing.InOutQuad; } }
}