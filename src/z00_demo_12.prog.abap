*&---------------------------------------------------------------------*
*& Report z00_demo_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_12.

" ---------------------------------------------------------------------
" Deklaration interner Tabellen
" ---------------------------------------------------------------------
DATA connections  TYPE z00_connections.         " TYPE [Tabellentyp]
" ConnectionList conncetions = new ConnectionList();
DATA connections2 TYPE TABLE OF z00_connection. " TYPE TABLE OF [Strukturtyp]
" List<Connection> connections = new ArrayList<>( );

" ---------------------------------------------------------------------
" Hinzufügen von Datensätzen
" ---------------------------------------------------------------------
connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' arrival_city = 'NEW YORK' )
                       ( carrier_id = 'UA' connection_id = '3517' departure_city = 'FRANKFURT' )
                       ( )
                       ( carrier_id = 'LH' arrival_city = 'FRANKFURT' ) ).

connections = VALUE #( BASE connections ( carrier_id = 'AA' connection_id = '0017' arrival_city = 'ROME' ) ).

APPEND VALUE #( connection_id = '0401' ) TO connections.

DATA connection TYPE z00_connection.
connection-arrival_city   = 'MADRID'.
connection-departure_city = 'BERLIN'.

APPEND connection TO connections.
connections = VALUE #( BASE connections ( connection ) ).

" ---------------------------------------------------------------------
" Lesen von Datensätzen
" ---------------------------------------------------------------------
" Lesen eines Einzelsatzes
IF line_exists( connections[ 10 ] ).
  connection = connections[ 10 ]. " Index
ENDIF.

TRY.
    connection = connections[ carrier_id = 'AA' connection_id = '0018' ]. " Komponenten
  CATCH cx_sy_itab_line_not_found.
ENDTRY.

" Lesen mehrerer Datensätze
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  WRITE: / sy-tabix, connection.
ENDLOOP.
" for(Connection connection : connections ) {
"  if(connection.carrierId().equals("LH") && !connection.arrivalCity().equals("")) {
"    System.out.println(connection);
"  }
" }

" ---------------------------------------------------------------------
" Ändern von Datensätzen
" ---------------------------------------------------------------------
" Ändern eines Einzelsatzes
connections[ 1 ]-departure_city = 'FRANKFURT'. " Index
connections[ carrier_id = 'AA' connection_id = '0017' ]-departure_city = 'WALLDORF'. " Komponenten

" Ändern mehrerer Datensätze
DATA connection_r TYPE REF TO z00_connection.

LOOP AT connections REFERENCE INTO connection_r WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  connection_r->carrier_id = 'LHD'.
ENDLOOP.

" ---------------------------------------------------------------------
" Sortieren
" ---------------------------------------------------------------------
SORT connections BY carrier_id DESCENDING
                    connection_id ASCENDING
                    departure_city DESCENDING.

" ---------------------------------------------------------------------
" Löschen
" ---------------------------------------------------------------------
" Löschen eines Einzelsatzes
DELETE connections INDEX 4.

" Löschen mehrerer Datensätze
DELETE connections WHERE arrival_city IS INITIAL.

" ---------------------------------------------------------------------
" Größe
" ---------------------------------------------------------------------
WRITE / lines( connections ).

" ---------------------------------------------------------------------
" ALV
" ---------------------------------------------------------------------
cl_salv_table=>factory( IMPORTING r_salv_table = DATA(alv)
                        CHANGING  t_table      = connections ).

alv->get_functions( )->set_all( abap_true ).
alv->get_columns( )->set_optimize( abap_true ).
alv->get_display_settings( )->set_list_header( 'Überschrift' ).
alv->get_display_settings( )->set_striped_pattern( abap_true ).
alv->get_selections( )->set_selection_mode( if_salv_c_selection_mode=>row_column ).

alv->display( ).
