#ifndef MAINTENANCE_H
#define MAINTENANCE_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QObject>

class maintenance : public QObject
{
Q_OBJECT
public:
    maintenance();
    Q_INVOKABLE bool addTicket(QString lieu, QString descr);
};

#endif // MAINTENANCE_H
