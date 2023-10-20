*&---------------------------------------------------------------------*
*& Report z00_abap_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abap_06.

PARAMETERS p_cid TYPE s_customer.

DATA customer TYPE z00_customer.

TRY.
    customer = zcl_abap_helper=>get_customer( p_cid ).
  CATCH zcx_no_customer_found INTO DATA(e).
    MESSAGE e->get_text( ) TYPE 'E'.
ENDTRY.

WRITE |Kundennumer: { customer-customer_id }|.
WRITE / |Name: { customer-name }|.
WRITE / |Stadt: { customer-city }|.
WRITE / |Land: { customer-country }|.
