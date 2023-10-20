*&---------------------------------------------------------------------*
*& Report z00_demo_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_10.

**********************************************************************
* Deklaration von Strukturen
**********************************************************************
DATA connection TYPE z00_connection.

**********************************************************************
* Zugriff auf Strukturkomponenten
**********************************************************************
connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-departure_city = 'FRANKFURT'.
connection-arrival_city = 'NEW YORK'.

WRITE: connection-carrier_id, connection-connection_id.
