import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:ticket
    width: 450
    height: 250
    property alias color: rect.color

    Item {
        id: container
        anchors.centerIn: parent
        width:  rect.width  + (2 * rectShadow.radius)
        height: rect.height + (2 * rectShadow.radius)
        visible: false


        Rectangle {
            id: rect
            width: 450
            height: 250
            antialiasing: true
            anchors.centerIn: parent
            ActionBar {
                id: headModal
                color: "#2196F3"
                z: 2
                font.family: localFont.name
                font.pixelSize: 20
                height: 50

                //nom de l'onglet
                Text {
                    id: modalTitle
                    text: "Ticket de maintenance"
                    color: "white"
                    font.pointSize: 15
                    visible: true
                    anchors{
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                    font.family: localFont.name
                }
            }
        }
    }

    DropShadow {
        id: rectShadow
        anchors.fill: source
        cached: true
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#80000000"
        smooth: true
        source: container
    }
}
