*&---------------------------------------------------------------------*
*& Report z00_main_airplanes
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_main_airplanes.

DATA airplane  TYPE REF TO zcl_00_airplane.
DATA airplanes TYPE TABLE OF REF TO zcl_00_airplane.

" Objekterzeugungen
WRITE zcl_00_airplane=>number_of_airplanes.

TRY.
    airplane = NEW #( name = 'Flugzeug 1' plane_type = 'Airbus A320' ).
    APPEND airplane TO airplanes.

    airplane = NEW #( name = 'Flugzeug 2' plane_type = 'Boeing 747' ).
    APPEND airplane TO airplanes.

    airplane = NEW #( name = 'Flugzeug 3' plane_type = 'Airbus A340' ).
    APPEND airplane TO airplanes.
  CATCH zcx_abap_initial_parameter INTO DATA(e).
    WRITE e->get_text( ).
ENDTRY.

WRITE zcl_00_airplane=>number_of_airplanes.

" Ausgabe
LOOP AT airplanes INTO airplane.
  WRITE / airplane->to_string( ).
ENDLOOP.
