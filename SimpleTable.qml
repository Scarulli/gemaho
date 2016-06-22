import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick 2.0

TableView {
        id: tableView

        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: parent.top
            rightMargin: 560
            bottomMargin: 50
        }
        frameVisible: false

        sortIndicatorVisible: false
        backgroundVisible: true
        alternatingRowColors: false
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff

        style: TableViewStyle {
            id: tableStyle

            headerDelegate: Rectangle {
                height: textItem.implicitHeight * 1.2
                width: textItem.implicitWidth

                Text {
                    id: textItem
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: styleData.value
                    elide: Text.ElideRight
                    color: textColor
                    renderType: Text.NativeRendering
                    font.family: localFont.name
                    font.pointSize: 20
                }
                Rectangle {
                    anchors{
                        right: parent.right
                        left: parent.left
                        bottom: parent.bottom
                    }

                    height: 1
                    color: "black"
                }
            }
            rowDelegate: Rectangle{

                height: 70
                color: "white"
            }

            itemDelegate: Rectangle {
                id: itemRow
                width: textRow.width
                color:{
                    model.index%2 ? "whitesmoke" : "white"
                }
                Text {
                    id: textRow
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: textColor
                    text: styleData.value
                    renderType: Text.NativeRendering
                    font.family: localFont.name
                    font.pointSize: 12
                }
            }

        }

        TableViewColumn {
            id: chambreColumn
            title: "Chambre"
            role: "chambre"
            movable: false
            resizable: false
        }

        TableViewColumn {
            id: libreColumn
            title: "Libre"
            role: "libre"
            movable: false
            resizable: false
        }

        TableViewColumn {
            id: menageColumn
            title: "Ménage"
            role: "menage"
            movable: false
            resizable: false
        }
   }
