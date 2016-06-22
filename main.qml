import QtQuick 2.5
import QtQuick.Window 2.2
import Db 1.0
import Gouv 1.0
import Rec 1.0
import Mtn 1.0
import Dir 1.0


//fenetre principale
Window {
    id: main
    objectName: "main"
    visible: true
    visibility: Window.FullScreen
    FontLoader { id: localFont; source: "qrc:/../Roboto-Light.ttf" }
    property int i: 0


    //objet appelant les methode de ma classe bdd
    DataBase{
        id: database
    }

    GouvernanteClass{
        id: gouvernanteObj
    }

    ReceptionClass{
        id: receptionObj
    }

    MaintenanceClass{
        id: maintenanceObj
    }

    DirecteurClass{
        id: directeurObj
    }

    //header
    ActionBar {
        id: actionBar
        color: "#2196F3"
        z: 2
        font.family: localFont.name
        font.pixelSize: 20

        IconButton {
            id: menuButton
            y:0
            rippleColor: "#2196F3"

            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 150
                top: parent.top
            }
            iconSource: "icones/menu.png"
            onClicked: menu.open()
            visible: (connexion.visible == true)? false : true;
        }

        //nom de l'onglet
        Text {
            id: ongletTitle
            text: "Directeur"
            color: "white"
            font.pointSize: 30
            visible: false
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 250
            }
            font.family: localFont.name
        }

        //logo du logiciel
        Image {
            id: logo
            width: 80
            height: 90
            source: "logo_gemaho.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        //bouton deconnexion
        FloatingActionButton {
            id: offButton
            y:0
            width: 50
            height: 50
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 20
                top: parent.top
                topMargin: 25
            }
            color: "#ff5177"
            iconSource: "icones/deconnexion.png"
            onClicked:  {
                page.visible = false
                connexion.visible = true
                ongletTitle.text = "Directeur"
                ongletTitle.visible = false
                allClose() // voir fin de page
                ongletDirecteur.visible = true
            }
            visible: (connexion.visible == true)? false : true;
        }
    }
    //fin header

    //page de connexion
    Connexion{
        id: connexion
    }

    //fin page de connexion

    //page parent
    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: "#E9E9E9"
        anchors.fill: parent
        visible: false

        Menu{
            id: menu
            anchors.top: parent.top
            anchors.left : parent.left
            active: false
            color : "#2196F3"
            z: 1

            MenuItem{
                id: none
                y: 200
                height: 100
            }

            MenuItem{
                id: directeur
                iconSource: "icones/statistiques.png"
                text: "Directeur"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "Directeur"
                    allClose() // voir fin de page
                    ongletDirecteur.visible = true
                    menu.close()
                }
            }
            MenuItem{
                id: restaurant
                iconSource: "icones/restaurant.png"
                text: "Restaurant"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "Restaurant"
                    allClose()
                    ongletRestaurant.visible = true
                    menu.close()
                }
            }
            MenuItem{
                id: reception
                iconSource: "icones/reception.png"
                text: "Réception"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "Réception"
                    allClose()
                    ongletReception.visible = true
                    menu.close()
                }
            }
            MenuItem{
                id: hebergement
                iconSource: "icones/hebergement.png"
                text: "Hébérgement"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "Hébérgement"
                    allClose()
                    ongletHebergement.visible = true
                    menu.close()
                }
            }
            MenuItem{
                id: gouvernante
                iconSource: "icones/gouvernante.png"
                text: "Gouvernante"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "Gouvernante"
                    allClose()
                    ongletGouvernante.visible = true
                    menu.close()
                }
            }
            MenuItem{
                id: maintenance
                iconSource: "icones/maintenance.png"
                text: "Maintenance"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "Maintenance"
                    allClose()
                    ongletMaintenance.visible = true
                    menu.close()
                }
            }
            MenuItem{
                id: spa
                iconSource: "icones/spa.png"
                text: "SPA"
                font.pointSize: 25
                onClicked: {
                    ongletTitle.text = "SPA"
                    allClose()
                    ongletSpa.visible = true
                    menu.close()
                }
            }
        }

        //onglet directeur
        Onglet{
            id: ongletDirecteur
            Directeur{

            }
        }

        //onglet restaurant
        Onglet{
            id: ongletRestaurant
            Text{
                id: restaurantText
                y: 50
                text: "RESTAURANT"
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 50
                font.family: localFont.name
            }
        }

        //onglet reception
        Onglet{
            id: ongletReception
            Text{
                id: receptionText
                y: 50
                text: "RECEPTION"
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 50
                font.family: localFont.name
            }
            Reception{
                id: pageReception
                FlatButton{
                    id: btn_reception
                    objectName: "btn_reception"
                    y:350
                    anchors.top: parent.top
                    anchors.topMargin: 380
                    anchors.left: parent.left
                    anchors.leftMargin: 800
                    width: 150; height: 50
                    onClicked: {

                        receptionObj.recupNom(pageReception.recupName())
                    }

                    text: "Valider"
                    font.family: localFont.name
                }
            }
        }

        //onglet hebergement
        Onglet{
            id: ongletHebergement
            Text{
                id: hebergementText
                y: 50
                text: "HEBERGEMENT"
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 50
                font.family: localFont.name
            }
        }

        //onglet gouvernante
        Onglet{
            id: ongletGouvernante
            Gouvernante{
                id: gouvernanteView
                anchors{
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    topMargin: 100
                    leftMargin: 10
                }
                SimpleTable{
                    id: maTable
                    model: ListModel {
                        id: libraryModel
                    }
                }
                onVisibleChanged: {
                    libraryModel.clear()
                    for(i = 1; i <= gouvernanteObj.countRoom(); i++){
                        libraryModel.set(i-1, {"chambre" : ""+gouvernanteObj.getInfo(i)[0]+"", "libre" : ""+gouvernanteObj.getInfo(i)[1]+"", "menage" : ""+gouvernanteObj.getInfo(i)[2]+""})

                    }
                }
                FlatButton{
                    id: refresh
                    y: 80; x: 600
                    width: 150; height: 50
                    text: "Rafraichir"
                    onClicked: {
                        libraryModel.clear()
                        for(i = 1; i <= gouvernanteObj.countRoom(); i++){
                            libraryModel.set(i-1, {"chambre" : ""+gouvernanteObj.getInfo(i)[0]+"", "libre" : ""+gouvernanteObj.getInfo(i)[1]+"", "menage" : ""+gouvernanteObj.getInfo(i)[2]+""})
                        }
                    }
                }
                FlatButton{
                    id: edit
                    y: 80; x: 760
                    width: 150; height: 50
                    text: "Modifier"
                    onClicked: {
                        listRoom.items = gouvernanteObj.getRooms()
                        editGouvernante.open()
                      }
                }
                TicketMaintenance{
                    y: 200; x: 550
                    TextField{
                        id: lieuInput
                        objectName: "lieuInput"
                        y: 45
                        width: 250
                        anchors.horizontalCenter: parent.horizontalCenter
                        Keys.onTabPressed: comInput.focusText = true
                        hint: "Lieu"
                        font.family: localFont.name
                        font.pointSize: 15

                    }
                    Area{
                        id: comInput
                        objectName: "comInput"
                        y: 100
                        width: 250
                        anchors.horizontalCenter: parent.horizontalCenter
                        hint: "Description"
                        font.family: localFont.name
                        font.pointSize: 13
                    }
                    FlatButton{
                        id: btn_ticket
                        objectName: "btn_ticket"
                        y:180
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 150; height: 50
                        onClicked: {
                            maintenanceObj.addTicket(lieuInput.text, comInput.text)
                            lieuInput.text = ""
                            comInput.text = ""
                        }

                        text: "Envoyer"
                        font.family: localFont.name
                    }

                }

            }
        }

        //onglet maintenance
        Onglet{
            id: ongletMaintenance
            Text{
                id: maintenanceText
                y: 50
                text: "MAINTENANCE"
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 50
                font.family: localFont.name
            }
        }

        //onglet spa
        Onglet{
            id: ongletSpa
            Text{
                id: spaText
                y: 50
                text: "SPA"
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 50
                font.family: localFont.name
            }
        }

        //modal gouvernante
        NewDialog {
            id: editGouvernante
            dialogHeight: 300
            dialogWidth: 550

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
                    text: "Modifier l'état d'une chambre"
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
            Rectangle {
                id:select
                width:500;
                y: 140
                Text{
                    id: numChambre
                    text: "Numéro de chambre:"
                    font.pointSize: 12
                    font.family: localFont.name
                    x: 30
                }
                Select{
                    id:listRoom
                    anchors{
                        left: numChambre.right
                        leftMargin: 10
                    }
                }
                Checkbox{
                    id:menageCheck
                    anchors{
                        left: listRoom.right
                        leftMargin: 40
                    }
                }
                Text{
                    anchors{
                        left: menageCheck.right
                        leftMargin: 5
                    }
                    text: "Ménage"
                    font.family: localFont.name
                    font.pointSize: 15
                }
             }
            Rectangle{
                width:540;
                y: 270
                FlatButton {
                    id: sendButton
                    text: "Valider"
                    textColor: "white"
                    onClicked: {
                        gouvernanteObj.setRooms(listRoom.selectedItem, menageCheck.checkedState)
                        editGouvernante.close()
                        libraryModel.clear()
                        for(i = 1; i <= gouvernanteObj.countRoom(); i++){
                            libraryModel.set(i-1, {"chambre" : ""+gouvernanteObj.getInfo(i)[0]+"", "libre" : ""+gouvernanteObj.getInfo(i)[1]+"", "menage" : ""+gouvernanteObj.getInfo(i)[2]+""})
                        }
                        listRoom.selectedIndex = 0
                        menageCheck.checked = false
                    }
                    anchors{
                        right: parent.right
                        rightMargin: 20
                        bottom: parent.bottom
                    }
                }
            }
        }
    }
    //fin page parent

    //passe toutes les pages à false
    function allClose(){
        ongletRestaurant.visible = false
        ongletGouvernante.visible = false
        ongletHebergement.visible = false
        ongletMaintenance.visible = false
        ongletReception.visible = false
        ongletRestaurant.visible = false
        ongletSpa.visible = false
        ongletDirecteur.visible = false
    }
}

