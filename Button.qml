import QtQuick 2.0

Item {
    id: button
    signal clicked
    property alias text : buttonText.text
    property alias color: background.color

    Rectangle {
        id: background
        anchors.fill: parent
        width: 150; height: 50
        color: "#2196F3"
        radius: 3

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("Button clicked!")
        }

        Text {
            id: buttonText
            verticalAlignment: Text.AlignVCenter
            color:"white"
            font.pointSize: 20
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
        }
    }
}
