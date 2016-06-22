#ifndef DIRECTEUR_H
#define DIRECTEUR_H
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QObject>

class directeur : public QObject
{
Q_OBJECT
public:
    directeur();
};

#endif // DIRECTEUR_H
