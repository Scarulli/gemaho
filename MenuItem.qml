import QtQuick 2.0
import "."

Item {
    id: item
    implicitWidth: parent.width
    height: 80

    property bool inline: false
    property alias text: label.text
    property alias textColor: label.color
    property alias font: label.font
    property alias iconSource: icon.source

    signal clicked

    Image {
        id: icon
        anchors{
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        width: 30
        height: 30
        sourceSize.width: width
        sourceSize.height: height
    }

    Text {
        id: label
        anchors {
            left: icon.right
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: 16
        }
        font.bold: Font.DemiBold
        color: "white"
        opacity: item.enabled ? 1 : 0.62
        font.family: localFont.name

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
            }
        }
    }

    PaperRipple {
        id: ripple
        mouseArea: mouseArea
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: item.enabled
        onClicked: item.clicked()
    }
}
