import QtQuick 2.0
import "."

Item {
    id: button
    width: 150
    height: 50

    property bool inline: false
    property alias text: label.text
    property alias textColor: label.color
    property alias font: label.font
    property alias btnFocus: mouseArea.focus

    signal clicked

    Rectangle {
        id: background
        color: "#2196F3"
        anchors.fill: parent
        radius: 2
    }

    Text {
        id: label
        anchors.centerIn: parent
        text: "button"
        font.bold: Font.DemiBold
        font.capitalization: Font.AllUppercase
        color: "white"
        font.pixelSize: 20

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    PaperRipple {
        id: ripple
        radius: 2
        mouseArea: mouseArea
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: button.enabled
        onClicked: button.clicked()
        Keys.onEnterPressed: button.clicked()
    }
}
