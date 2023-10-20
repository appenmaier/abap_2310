*&---------------------------------------------------------------------*
*& Report z00_abap_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abap_02.

PARAMETERS p_id TYPE s_customer.
PARAMETERS p_name TYPE s_custname.
PARAMETERS p_city TYPE city.
PARAMETERS p_cntry TYPE s_country.

WRITE: p_id NO-ZERO, p_name, p_city, p_cntry.
WRITE: / |{ p_id }, { p_name }, { p_city } ({ p_cntry })|.
