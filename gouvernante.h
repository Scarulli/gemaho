#ifndef GOUVERNANTE_H
#define GOUVERNANTE_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QObject>



class gouvernante : public QObject
{
Q_OBJECT
public:
    gouvernante();
    Q_INVOKABLE void test();
    Q_INVOKABLE QVariantList getInfo(int i);
    Q_INVOKABLE int countRoom();
    Q_INVOKABLE QVariantList getRooms();
    Q_INVOKABLE bool setRooms(int number, int etat);
    int contage();

};

#endif // GOUVERNANTE_H
