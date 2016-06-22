import QtQuick 2.0
import "."

Item {
    id: control
    width: parent.width
    height: 100

    property alias color: background.color
    property alias text: title.text
    property bool raised: false
    property alias font: title.font

    MouseArea {
        id: eventEater
        anchors.fill: parent
    }

    PaperShadow {
        source: background
        depth: control.raised ? 2 : 1
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
    }

    Text {
        id: title
        x: 72
        anchors.verticalCenter: parent.verticalCenter
        font.bold: Font.DemiBold
        color: "white"
    }
}
