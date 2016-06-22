import QtQuick 2.0
import QtQuick.Controls 1.4

import "."

Item {
    id: control
    implicitWidth: input.contentWidth
    implicitHeight: Math.max(input.contentHeight + 40, 48)

    property color focusColor: "#2196f3"

    property alias text: input.text
    property alias hint: placeholder.text
    property alias length: input.length
    property alias maxLength: input.maximumLength

    property alias echoMode: input.echoMode
    property alias color: input.color
    property alias font: input.font
    property alias focusText: input.focus

    Text {
        id: placeholder
        anchors.fill: input
        visible: !input.length && !input.inputMethodComposing
        color: "#8a999999"
        font: input.font
    }

    TextInput {
        id: input
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: divider.top
            topMargin: 16
        }
        color: "#de000000"
        selectionColor: "#91a7ff"
        selectedTextColor: color
        autoScroll: true
        selectByMouse: true
        wrapMode: TextInput.Wrap
    }

    Rectangle {
        id: divider
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 8
        }
        height: input.focus ? 2 : 1
        color: input.focus ? control.focusColor : "#38999999"

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }

}
