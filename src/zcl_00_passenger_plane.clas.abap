CLASS zcl_00_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_airplane
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !name           TYPE string
                plane_type      TYPE string
                number_of_seats TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_00_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = name plane_type = plane_type ).

    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
    string = super->to_string( ) && | (Seats: { number_of_seats })|.
  ENDMETHOD.
ENDCLASS.
