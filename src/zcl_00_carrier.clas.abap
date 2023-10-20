CLASS zcl_00_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name      TYPE string.
    DATA airplanes TYPE z00_airplanes.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_00_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_00_cargo_plane.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

ENDCLASS.


CLASS zcl_00_carrier IMPLEMENTATION.
  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA(max_cargo_in_tons) = 0.
    LOOP AT airplanes INTO DATA(airplane) WHERE table_line IS INSTANCE OF zcl_00_cargo_plane.
      DATA(cargo_plane) = CAST zcl_00_cargo_plane( airplane ).
      IF cargo_plane->cargo_in_tons > max_cargo_in_tons.
        max_cargo_in_tons = cargo_plane->cargo_in_tons.
        biggest_cargo_plane = cargo_plane.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD to_string.
    string = name && ';'.
    LOOP AT airplanes INTO DATA(airplane).
      string &&= airplane->to_string( ) && ';'.
    ENDLOOP.
    string &&= |Biggest Cargo Plane: { get_biggest_cargo_plane( )->to_string( ) }|.
  ENDMETHOD.
ENDCLASS.
