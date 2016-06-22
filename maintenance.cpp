#include "maintenance.h"

maintenance::maintenance()
{

}

bool maintenance::addTicket(QString lieu, QString descr){
    QSqlQuery query;
    QString strQuery;
    bool result;
    strQuery = "INSERT INTO TICKET (TICKET_NAME, TICKET_COM) VALUES (\""+lieu+"\" ,\""+descr+"\")";

    result = query.exec(strQuery);

    qDebug() << query.lastError();
    qDebug()<< result;
    return result;
}
