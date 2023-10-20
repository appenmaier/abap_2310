CLASS zcl_00_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC. "public class Rental implements Partner,...

  PUBLIC SECTION.
    INTERFACES zif_00_partner.

    DATA name     TYPE string.
    DATA vehicles TYPE z00_vehicles.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_00_vehicle.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

ENDCLASS.


CLASS zcl_00_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD to_string.
    string = name && ';'.
    LOOP AT vehicles INTO DATA(vehicle).
      string &&= vehicle->to_string( ) && ';'.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_00_partner~to_string.
    string = to_string( ).
  ENDMETHOD.

ENDCLASS.
