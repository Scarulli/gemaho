import QtQuick 2.0
import QtPositioning 5.2

Dialog {
    id: dialog

    onBackgroundClicked: {
        dialog.close()
    }
}
