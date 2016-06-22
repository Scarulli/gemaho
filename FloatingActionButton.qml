import QtQuick 2.0

Item {
    id: button
    width: 56
    height: 56

    property alias color: background.color
    property alias rippleColor: ripple.color
    property alias iconSource: icon.source

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 28
        visible: false
    }

    PaperShadow {
        id: shadow
        source: background
        depth: button.enabled ? (mouseArea.pressed ? 4 : 2) : 0
    }

    PaperRipple {
        id: ripple
        radius: 28
        color: "#deffffff"
        mouseArea: mouseArea
    }

    Image {
        id: icon
        anchors.centerIn: parent
        width: 30
        height: 30
        sourceSize.width: width
        sourceSize.height: height
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: button.enabled
        onClicked: button.clicked()
    }
}
