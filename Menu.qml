import QtQuick 2.0
import "."

Popup {
    id: popup

    default property alias dialogChildren: layout.children
    property alias color: background.color

    Item {
        id: menu
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        width: Math.min(parent.width - 56, 320)
        state: popup.state
        transform: Translate { id: menuTranslate }

        PaperShadow {
            id: shadow
            anchors.fill: background
            source: background
            depth: 4
        }

        Rectangle {
            id: background
            anchors.fill: parent
            color: "white"
            visible: false

            Text{
                id: directeur
                text: "Directeur Général"
            }
        }

        MouseArea {
            id: eventEater
            hoverEnabled: true
            enabled: true
            anchors.fill: parent
        }

        Column {
            id: layout
            width: parent.width
        }

        states: [
            State {
                name: "visible"
                PropertyChanges { target: menuTranslate; x: 0 }
            },
            State {
                name: "hidden"
                PropertyChanges { target: menuTranslate; x: -menu.width }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    target: menuTranslate
                    property: "x"
                    duration: 200
                    easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
                }
            }
        ]
    }

    onBackgroundClicked: {
        popup.close()
    }
}
