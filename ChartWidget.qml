import QtQuick 2.0
import QtQuick.Layouts 1.1


Rectangle {
    id: chartContainer
    width: 300 * colSpan + ((colSpan - 1)*20)
    height: 270 * rowSpan + ((rowSpan - 1)*20)

    property int rowSpan: 1
    property int colSpan: 1

    property alias title: chartTitle.text
    property alias description: chartDescription.text
    property int conversations: 0
    property int updates: 0
    property alias source: chartSRC.source

    Column{
        id: wrapper
        spacing: 2
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 15
        anchors.fill: parent
        RowLayout{
            height: 21
            spacing: 4
            anchors.right: parent.right
            anchors.left: parent.left
            Text{
                id: chartTitle
                text: "Perfomance Data"
            }
            Item{ //Spacer
                Layout.fillWidth: true
            }
            Text{
                id: chartConversations
                text: chartContainer.conversations + ""
            }
            Text{
                id: chartUpdates
                color: Palette.UPDATE_COLOR
                text: "+" + chartContainer.updates
                visible: chartContainer.updates
            }
            MouseArea{
                id: titleSensor
                anchors.fill: parent
                hoverEnabled: true
            }
        }
        Text{
            id: chartDescription
            height: 25
            text: "Comparative of two years 2013-2014"
        }
    }

    Button{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        scale: containsMouse ? 1 : 0.8
        opacity: containsMouse ? 1 : 0.5
    }
}
