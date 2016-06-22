#include <QSqlDatabase>
#include "sqldatabase.h"

SqlDatabase::SqlDatabase( QObject * parent ) : Qobject ( parent ) {
    b_connected = false;
}

void SqlDatabase :: connectToDatabase ( QString host, QString database, QString username, QString password ) {
    QSqlDatabase q_sqlDatabase = QSqlDatabase :: addDatabase ( "SqlDatabase" );

    q_sqlDatabase.setHostName ( host );
    q_sqlDatabase.setDatabaseName ( database );
    q_sqlDatabase.setUserName ( username );
    q_sqlDatabase.setPassword ( password );

    if ( q_sqlDatabase.open ( )) {
        b_connected = true;
    }
}

const QString &FilesList :: connected ( ) const {
    return b_path;
}
