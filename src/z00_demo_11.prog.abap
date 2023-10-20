*&---------------------------------------------------------------------*
*& Report z00_demo_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_11.

DATA connection TYPE z00_connection.
DATA flight TYPE z00_flight.
DATA flight_with_connection TYPE z00_flight_with_connection.

connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-departure_city = 'FRANKFURT'.
connection-arrival_city = 'NEW YORK'.

flight-carrier_id = 'LH'.
flight-connection_id = '0400'.
flight-flight_date = sy-datum.
flight-price = 678.
flight-currency_code = 'EUR'.

flight_with_connection = CORRESPONDING #( connection ).
"List<String> names = new ArrayList<>();
flight_with_connection = CORRESPONDING #( BASE ( flight_with_connection ) flight ).

WRITE ''.
