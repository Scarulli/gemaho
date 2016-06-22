#include "bdd.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlDatabase>

bdd::bdd()
{
}

bdd::bdd(QString host, int port, QString name, QString user, QString pwd)
{
    this->dbhost = host;
    this->dbport = port;
    this->dbname = name;
    this->dbuser = user;
    this->dbpwd = pwd;
}

bool bdd::connect_to_bdd(){
    QString mydb = "QMYSQL3";
    QSqlDatabase db = QSqlDatabase::addDatabase(mydb);
    db.setHostName(this->dbhost);
    db.setPort(this->dbport);
    db.setDatabaseName(this->dbname);
    db.setUserName(this->dbuser);
    db.setPassword(this->dbpwd);

    if(db.open())
    {
        qDebug() << "Vous êtes maintenant connecté à ";
        qDebug() << db.hostName();
        QSqlQuery query;

        if(query.exec("SELECT * FROM USERS")){
            while(query.next()){
                qDebug() << query.value(1);
            }
        }
        else qDebug() << query.lastError();
        return true;
    }
    else
    {
        qDebug() << "La connexion a échouée, désolé" ;
        return false;
    }
}

/*
 * retourne id du role
 * -1 si la connexion est eronnée
*/
int bdd::user_connect(QString login, QString pwd){

    QSqlQuery query;
    query.exec("SELECT USER_LOGIN, USER_PASSWORD, PERMISSIONS.PERMISSION_ID FROM USERS LEFT JOIN USERS_AVOIR_PERMISSIONS ON USERS_AVOIR_PERMISSIONS.USER_ID = USERS.USER_ID LEFT JOIN PERMISSIONS ON PERMISSIONS.PERMISSION_ID = USERS_AVOIR_PERMISSIONS.PERMISSION_ID WHERE USER_LOGIN = '"+login+"'");

    query.next();
    qDebug()<< query.value(0);
    if(query.value(0) == login && query.value(1) == pwd){
        int result = query.value(2).toInt();

        return result;
    }

    else{
        qDebug() << query.lastError();
        return -1;
       }
}
