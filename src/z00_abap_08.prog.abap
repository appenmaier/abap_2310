*&---------------------------------------------------------------------*
*& Report z00_abap_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abap_08.

PARAMETERS p_cid TYPE s_customer.

DATA bookings TYPE TABLE OF zabap_booking.

TRY.
    bookings = zcl_00_helper=>get_bookings( p_cid ).
  CATCH zcx_no_booking_found INTO DATA(e).
    MESSAGE e->get_text( ) TYPE 'E'.
ENDTRY.

DELETE bookings WHERE flight_date < sy-datum.

LOOP AT bookings REFERENCE INTO DATA(booking).
  booking->price *= '1.1'.
ENDLOOP.

SORT bookings BY price DESCENDING.

cl_demo_output=>display( bookings ).
