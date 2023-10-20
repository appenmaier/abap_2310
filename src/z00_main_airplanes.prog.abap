*&---------------------------------------------------------------------*
*& Report z00_main_airplanes
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_main_airplanes.

DATA airplane  TYPE REF TO zcl_00_airplane.
DATA carrier TYPE REF TO zcl_00_carrier.

" Objekterzeugungen
carrier = NEW #( 'Lufthansa' ).

TRY.
    airplane = NEW zcl_00_passenger_plane( name = 'Flugzeug 1' plane_type = 'Boeing 747' number_of_seats = 400 ).
    carrier->add_airplane( airplane ).
    airplane = NEW zcl_00_cargo_plane( name = 'Mein Beluga' plane_type = 'Airbus Beluga XL' cargo_in_tons = 53 ).
    carrier->add_airplane( airplane ).
    airplane = NEW zcl_00_passenger_plane( name = 'Flugzeug 3' plane_type = 'Airbus A340' number_of_seats = 600 ).
    carrier->add_airplane( airplane ).
    airplane = NEW zcl_00_cargo_plane( name = 'Kleiner Beluga' plane_type = 'Airbus Beluga' cargo_in_tons = 38 ).
    carrier->add_airplane( airplane ).
  CATCH zcx_abap_initial_parameter INTO DATA(e).
    WRITE e->get_text( ).
ENDTRY.

" Ausgabe
SPLIT carrier->to_string( ) AT ';' INTO TABLE DATA(tokens).
LOOP AT tokens INTO DATA(token).
  WRITE / token.
ENDLOOP.
