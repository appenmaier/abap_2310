CLASS zcl_00_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_booking_with_customer
      IMPORTING carrier_id                   TYPE s_carr_id
                connection_id                TYPE s_conn_id
                flight_date                  TYPE s_date
                booking_id                   TYPE s_book_id
      RETURNING VALUE(booking_with_customer) TYPE zabap_booking_with_customer
      RAISING   zcx_no_booking_found
                zcx_no_customer_found.

    CLASS-METHODS get_bookings
      IMPORTING customer_id     TYPE s_customer
      RETURNING VALUE(bookings) TYPE z00_bookings
      RAISING   zcx_no_booking_found.
ENDCLASS.


CLASS zcl_00_helper IMPLEMENTATION.
  METHOD get_booking_with_customer.
    DATA booking  TYPE zabap_booking.
    DATA customer TYPE z00_customer.

    SELECT SINGLE FROM sbook
      FIELDS carrid, connid, fldate, bookid, customid, custtype, smoker, forcuram, forcurkey
      WHERE carrid = @carrier_id AND connid = @connection_id AND fldate = @flight_date AND bookid = @booking_id
      INTO @booking.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_no_booking_found( ).
    ENDIF.

    SELECT SINGLE FROM scustom
      FIELDS id, name, city, country
      WHERE id = @booking-customer_id
      INTO @customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_no_customer_found( ).
    ENDIF.

    booking_with_customer = CORRESPONDING #( booking ).
    booking_with_customer = CORRESPONDING #( BASE ( booking_with_customer ) customer ).
  ENDMETHOD.

  METHOD get_bookings.
*    bookings = zcl_abap_helper=>get_bookings( customer_id ).
    SELECT FROM sbook
      FIELDS carrid, connid, fldate, bookid, customid, custtype, smoker, forcuram, forcurkey
      WHERE customid = @customer_id
      INTO TABLE @bookings.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_no_booking_found( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
