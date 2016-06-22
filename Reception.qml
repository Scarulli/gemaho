import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 1.2
import "."


    Rectangle {

        anchors{
            top: parent.top
    //        left: parent.left
    //        right: parent.right
            bottom: parent.bottom
            topMargin: 150
            left: parent.left
            leftMargin: 100
    //        horizontalCenter: parent.horizontalCenter

        }
        TextField{
            id:nomReservation
            hint: "Nom"
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 20
        }
        TextField{
            id:prenomReservation //nomid.text pour la valeur
            hint : "Prenom"
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 300
        }
        TextField{
            id:mailReservation //nomid.text pour la valeur
            hint : "Mail"
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 580
        }
        TextField{
            id:adresseReservation
            hint : "Adresse"
            anchors.top: parent.top
            anchors.topMargin: 40
            width: 530
            anchors.left: parent.left
            anchors.leftMargin: 20
        }
        TextField{
            id:codeposteReservation //nomid.text pour la valeur
            hint : "Code postal"
            anchors.top: parent.top
            anchors.topMargin: 40
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 580
        }
        TextField{
            id:villeReservation
            hint : "Ville"
            anchors.top: parent.top
            anchors.topMargin: 80
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 20
        }
        TextField{
            id:numeroChambre
            hint : "Numéro de chambre"
            anchors.top: parent.top
            anchors.topMargin: 80
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 300
        }
        TextField{
            id:numeroReservation
            hint : "Numéro de téléphone"
            anchors.top: parent.top
            anchors.topMargin: 120
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 20
        }
        TextField{
            id:nbPersonnes
            hint : "Nombre de personnes"
            anchors.top: parent.top
            anchors.topMargin: 120
            width: 250
            anchors.left: parent.left
            anchors.leftMargin: 300
        }
//        ComboBox{
//            id: nbPersonnes
//            anchors.top: parent.top
//            anchors.topMargin: 140
//            width: 250
//            anchors.left: parent.left
//            anchors.leftMargin: 300
//            //editable: true
//            model: ListModel {
//                ListElement { text: "1";}
//                ListElement { text: "2";}
//                ListElement { text: "3";}
//                ListElement { text: "4";}
//                ListElement { text: "5";}
//                ListElement { text: "6";}
//                ListElement { text: "7";}
//                ListElement { text: "8";}
//            }
//            onAccepted: {
//                   if (find(currentText)) {
//                       model.append({text: editText})
//                       currentIndex = find(editText)
//                   }
//               }
//        }
        Text {
            text: "Jour d'arrivée"
            anchors.top: parent.top
            anchors.topMargin: 180
            width: 320
            anchors.left: parent.left
            anchors.leftMargin: 20
        }
        Calendar {
            id:dateArriv
            weekNumbersVisible: true
            anchors.top: parent.top
            anchors.topMargin: 200
            width: 320
            anchors.left: parent.left
            anchors.leftMargin: 20
            selectedDate: new Date /*= dateA
            signal textChanged(string dateA)*/
            //onClicked: { dateArriv.text = Date }
            //onClicked: console.log(new Date)
        }

        Text {
            text: "Jour du départ"
            anchors.top: parent.top
            anchors.topMargin: 180
            width: 320
            anchors.left: parent.left
            anchors.leftMargin: 380
        }
        Calendar {
            id:dateDepart
            weekNumbersVisible: true
            anchors.top: parent.top
            anchors.topMargin: 200
            width: 320
            anchors.left: parent.left
            anchors.leftMargin: 380
            /*selectedDate: new Date *//*= dateD
            signal textChanged(string dateD)*/
        }


//        FlatButton{
//            id: btn_reception
//            objectName: "btn_reception"
//            y:350
//            anchors.top: parent.top
//            anchors.topMargin: 380
//            anchors.left: parent.left
//            anchors.leftMargin: 800
//            width: 150; height: 50
//            onClicked: {
//                if(database.test(nomReservation.text, prenomReservation.text) !== -1){
//                    //connexion.visible = false
//                   // page.visible = true
//                    prenomReservation.text = ""
//                    prenomReservation.text = ""
//                    //errorConnexion.visible = false
//                   // ongletTitle.visible = true
//                }else console.log('MERDE')
//            }

//            text: "Valider"
//            font.family: localFont.name
//        }

        function recupName(){
            return prenomReservation.text;
        }

    }/*MouseArea {
        anchors.fill: parent
        onClicked: dataReservationReception(Date);
    }*/




