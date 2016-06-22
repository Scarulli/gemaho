import QtQuick 2.0
import QtQuick.Layouts 1.1

Flickable {
    id: viewContainer
    width: 1200
    height: 600
    flickableDirection: Flickable.VerticalFlick
    clip: true

    contentWidth: wrapper.width
    contentHeight: wrapper.height

    Text {
        id: viewSubTitle
        text: "Created on April 3, 2014 / Or any other description"
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Flow {
        id: wrapper
        anchors.topMargin: 20
        anchors.top: viewSubTitle.bottom
        width: viewContainer.width
        spacing: 20
        Repeater {
            id: charts
            delegate: ChartWidget{
                colSpan: colSpanm
                rowSpan: rowSpanm
                title: titlem
                description: descriptionm
                conversations: conversationsm
                updates: updatesm
                source: chartSRCm
            }
        }
        Item {
            //Spacer
            width: parent.width
            height: 100
        }
    }

//    MouseArea {
//        property int currentId: -1                       // Original position in model
//        property int newIndex                            // Current Position in model
//        property int index                               // Item underneath cursor
//        id: loc
//        anchors.fill: parent
//        onPressAndHold: {
//            index = wrapper.childAt(mouse.x, mouse.y).index;
//            currentId = charts.itemAt(newIndex = index).gridId;
//        }
//        onReleased: currentId = -1
//        onPositionChanged:
//            if (loc.currentId != -1 && index != -1 && index != newIndex)
//                charts.move(newIndex, newIndex = index, 1)
//    }
}
