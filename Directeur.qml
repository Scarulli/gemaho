import QtQuick 2.0
import Dir 1.0

import QtCharts 2.0






Rectangle{
    anchors.fill: parent
    anchors.topMargin: 50

    DirecteurClass{
        id: directeurObj
    }

    ActionBar {
        id: headModal
        z: 2
        font.family: localFont.name
        font.pixelSize: 20
        height: 60
        Rectangle{
            id: menu1
            width: 500
            MenuItem{
                id: donnees
                text: "Gestion utilisateurs"
                font.pointSize: 25
                textColor: "black"
                height: headModal.height
                anchors{
                    horizontalCenter: parent.horizontalCenter
                }
                onClicked: {
                    donneeView.visible = true
                    statView.visible = false
                }
            }
        }
        Rectangle{
            id: menu2
            width: 500
            anchors.left: menu1.right
            MenuItem{
                id: stat
                text: "Statistiques"
                font.pointSize: 25
                textColor: "black"
                height: headModal.height
                anchors{
                    horizontalCenter: parent.horizontalCenter
                }
                onClicked: {
                    donneeView.visible = false
                    statView.visible = true
                }
            }
        }
    }
    Rectangle{
        id: donneeView
        visible: true
        anchors.fill: parent
        TextField{
            id: testInput
            objectName: "testInput"
            y: 150
            width: 250
            anchors.horizontalCenter: parent.horizontalCenter
            hint: "TEST"
            font.family: localFont.name
            font.pointSize: 15
        }


    }

    Rectangle{
        id: statView
        visible: false
        anchors.fill: parent


    }




}
