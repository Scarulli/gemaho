#ifndef BDD_H
#define BDD_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QObject>


class bdd : public QObject
{
Q_OBJECT
public:
    bdd();
    bdd(QString host, int port, QString name, QString user, QString pwd);

    bool connect_to_bdd();

    Q_INVOKABLE int user_connect(QString login, QString pwd);
private:
    QString dbhost;
    int dbport;
    QString dbname;
    QString dbuser;
    QString dbpwd;

};

#endif // BDD_H
