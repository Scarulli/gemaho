#include "bdd.h"
#include "gouvernante.h"
#include "reception.h"
#include "maintenance.h"
#include "directeur.h"
#include <QGuiApplication>
#include <QList>
#include <QtQml>
#include <QQuickItem>


int main(int argc, char *argv[])
{
    qmlRegisterType<bdd>("Db", 1, 0, "DataBase");
    qmlRegisterType<gouvernante>("Gouv", 1, 0, "GouvernanteClass");
    qmlRegisterType<reception>("Rec", 1, 0, "ReceptionClass");
    qmlRegisterType<maintenance>("Mtn", 1, 0, "MaintenanceClass");
    qmlRegisterType<directeur>("Dir", 1, 0, "DirecteurClass");
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    bdd *db = new bdd("127.0.0.1", 3306, "gemaho_bdd", "root", "");
    bool rep = false;
    /* connexion bdd */
    rep = db->connect_to_bdd();


//    QList <QObject *>list = engine.rootObjects();
//    QObject *connex = list[0]->findChild<QObject*>("connexion");
//    QObject *box = connex->findChild<QObject*>("connexionBox");
//    QObject *btn = box->findChild<QObject*>("btn_connect");
//    qDebug() << btn->objectName();
//    QObject::connect(btn , SIGNAL(clicked()), db, SLOT(user_connect();));

    if(rep) app.exec();

}
