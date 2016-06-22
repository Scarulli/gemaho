#include "gouvernante.h"

gouvernante::gouvernante()
{

}

void gouvernante::test(){

    qDebug() << "testok" ;
}

QVariantList gouvernante::getInfo(int i){
    QSqlQuery query;
    QString strQuery;
    strQuery = "SELECT ROOM_NUMBER, ROOM_USED, ROOM_CLEANED FROM ROOMS WHERE ROOM_ID = "+QString::number(i);
    query.exec(strQuery);

    query.next();
    int chambre;
    QString libre;
    QString menage;
    chambre = query.value(0).toInt();
    if(query.value(1).toBool()) libre = "oui";
    else libre = "non";
    if(query.value(2).toBool()) menage = "fait";
    else menage = "pas fait";

    QVariantList list;
    list << chambre << libre << menage;

    return list;
}

int gouvernante::countRoom(){
    QSqlQuery query;
    query.exec("SELECT COUNT(*) FROM ROOMS");

    query.next();

    return query.value(0).toInt();

}

int gouvernante::contage(){
    QSqlQuery query;
    query.exec("SELECT COUNT(*) FROM ROOMS");

    query.next();

    return query.value(0).toInt();

}

QVariantList gouvernante::getRooms(){
    QSqlQuery query;
    QString strQuery;
    strQuery = "SELECT ROOM_NUMBER FROM ROOMS";
    query.exec(strQuery);

    QVariantList list;
    int chambre;

    for(int i = 0; i<= this->contage()-1; i++){
        query.next();
        chambre = query.value(0).toInt();

        list << QString::number(chambre);
    }


    qDebug() << list;
    return list;
}


 bool gouvernante::setRooms(int nmbr, int etat){
     QSqlQuery query;
     QString strQuery;
     bool result;
     strQuery = "UPDATE ROOMS SET ROOM_CLEANED = "+QString::number(etat)+" WHERE ROOM_NUMBER = "+QString::number(nmbr);

     result = query.exec(strQuery);

     qDebug() << query.lastError();
     qDebug()<< result;
 }
