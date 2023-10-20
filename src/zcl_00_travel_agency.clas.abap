CLASS zcl_00_travel_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name     TYPE string.
    DATA partners TYPE z00_partners.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_partner
      IMPORTING partner TYPE REF TO zif_00_partner.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

ENDCLASS.


CLASS zcl_00_travel_agency IMPLEMENTATION.
  METHOD add_partner.
    APPEND partner TO partners.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD to_string.
    string = name && ';'.
    LOOP AT partners INTO DATA(partner).
      string &&= partner->to_string( ) && ';'.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
