import QtQuick 2.0

Rectangle{
    objectName: "connexion"
    color: "white"
    width: parent.width
    height: parent.height

    Rectangle{
        id:connexionBox
        objectName: "connexionBox"
        border.color: "black"
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 150
        }

        width: parent.width
        height: parent.height

        Text {
            id: helloText
            y: 10
            text: "CONNEXION"
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 50
            font.family: localFont.name
        }

        Text {
            id: errorConnexion
            y: 100
            visible: false
            text: "Connexion erronnée"
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 15
            font.family: localFont.name
        }

        TextField{
            id: loginInput
            objectName: "loginInput"
            y: 150
            width: 250
            anchors.horizontalCenter: parent.horizontalCenter
            hint: "Login"
            focusText: true
            Keys.onTabPressed: pwdInput.focusText = true
            font.family: localFont.name
            font.pointSize: 15
        }

        TextField{
            id: pwdInput
            objectName: "pwdInput"
            y: 250
            width: 250
            anchors.horizontalCenter: parent.horizontalCenter
            hint: "Password"
            font.family: localFont.name
            echoMode: TextInput.Password
            Keys.onTabPressed: btn_connect.btnFocus = true
            font.pointSize: 15
        }

        FlatButton{
            id: btn_connect
            objectName: "btn_connect"
            y:350
            anchors.horizontalCenter: parent.horizontalCenter
            width: 150; height: 50
            onClicked: {
                receptionObj.recupNom('ok');
                if(database.user_connect(loginInput.text, pwdInput.text) !== -1){
                    connexion.visible = false
                    page.visible = true
                    loginInput.text = ""
                    pwdInput.text = ""
                    errorConnexion.visible = false
                    ongletTitle.visible = true
                    ongletDirecteur.visible = true
                }else errorConnexion.visible = true
            }

            text: "connexion"
            font.family: localFont.name
        }
    }
}
