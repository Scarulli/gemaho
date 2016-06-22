import QtQuick 2.0

Item {
    id: button
    width: 65
    height: 65

    property alias rippleColor: ripple.color
    property alias iconSource: icon.source

    signal clicked

    PaperRipple {
        id: ripple
        anchors {
            fill: undefined
            centerIn: parent
        }
        width: 40
        height: 40
        radius: 20
        mouseArea: mouseArea
    }

    Image {
        id: icon
        anchors.centerIn: parent
        width: 60
        height: 60
    }

    MouseArea {
        id: mouseArea
        anchors.fill: ripple
        enabled: button.enabled
        onClicked: button.clicked()
    }
}
