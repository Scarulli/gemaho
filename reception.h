#ifndef RECEPTION_H
#define RECEPTION_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QObject>

class reception : public QObject
{
Q_OBJECT
public:
    reception();
    Q_INVOKABLE QString recupNom(QString nom);
};

#endif // RECEPTION_H
