*&---------------------------------------------------------------------*
*& Report z00_main_airplanes
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_main_airplanes.

DATA airplane      TYPE REF TO zcl_00_airplane.
DATA carrier       TYPE REF TO zcl_00_carrier.
DATA partners      TYPE TABLE OF REF TO zif_00_partner.
DATA rental1       TYPE REF TO zcl_00_rental.
DATA rental2       TYPE REF TO zcl_00_rental.
DATA vehicle       TYPE REF TO zcl_00_vehicle.
DATA vehicles      TYPE TABLE OF REF TO zcl_00_vehicle.
DATA car           TYPE REF TO zcl_00_car.
DATA truck         TYPE REF TO zcl_00_truck.
DATA travel_agency TYPE REF TO zcl_00_travel_agency.

travel_agency = NEW #( 'TUI' ).
rental1 = NEW #( 'Sixt' ).
rental2 = NEW #( 'Hertz' ).
carrier = NEW #( 'Lufthansa' ).

travel_agency->add_partner( rental1 ).
travel_agency->add_partner( rental2 ).
travel_agency->add_partner( carrier ).

TRY.
    vehicle = NEW zcl_00_car( make = 'VW' model = 'Up' number_of_seats = 4 ). " vehicle = new Car("VW", "Up", 4);
    rental1->add_vehicle( vehicle ).
  CATCH zcx_00_inital_parameter INTO DATA(e).
    WRITE e->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW zcl_00_truck( make = 'MAN' model = 'TGX' cargo_in_tons = 40 ). " Upcast
    rental1->add_vehicle( vehicle ).
  CATCH zcx_00_inital_parameter INTO e.
    WRITE e->get_text( ).
ENDTRY.

TRY.
    vehicle = NEW zcl_00_car( make = 'Porsche' model = '911' number_of_seats = 2 ).
    rental2->add_vehicle( vehicle ).
  CATCH zcx_00_inital_parameter INTO e.
    WRITE e->get_text( ).
ENDTRY.

TRY.
    airplane = NEW zcl_00_passenger_plane( name = 'Flugzeug 1' plane_type = 'Boeing 747' number_of_seats = 400 ).
    carrier->add_airplane( airplane ).
    airplane = NEW zcl_00_cargo_plane( name = 'Mein Beluga' plane_type = 'Airbus Beluga XL' cargo_in_tons = 53 ).
    carrier->add_airplane( airplane ).
    airplane = NEW zcl_00_passenger_plane( name = 'Flugzeug 3' plane_type = 'Airbus A340' number_of_seats = 600 ).
    carrier->add_airplane( airplane ).
    airplane = NEW zcl_00_cargo_plane( name = 'Kleiner Beluga' plane_type = 'Airbus Beluga' cargo_in_tons = 38 ).
    carrier->add_airplane( airplane ).
  CATCH zcx_abap_initial_parameter INTO DATA(e2).
    WRITE e2->get_text( ).
ENDTRY.

" Ausgabe
SPLIT travel_agency->to_string( ) AT ';' INTO TABLE DATA(tokens).
LOOP AT tokens INTO DATA(token).
  WRITE / token.
ENDLOOP.
