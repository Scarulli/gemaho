TEMPLATE = app

QT  += sql # On rajoute SQL
QT  -= gui # On enlève la GUI
QT  += qml quick
QT += charts

QTPLUGIN += QSQLMYSQL

CONFIG += console

SOURCES += main.cpp \
    bdd.cpp \
    gouvernante.cpp \
    reception.cpp \
    maintenance.cpp \
    directeur.cpp

RESOURCES += qml.qrc

INCLUDEPATH += ".\include"
INCLUDEPATH += ".\lib"

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    bdd.h \
    gouvernante.h \
    reception.h \
    maintenance.h \
    directeur.h
