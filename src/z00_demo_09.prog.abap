*&---------------------------------------------------------------------*
*& Report z00_demo_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_09.

TRY.
    DATA(result) = zcl_00_calculator=>divide( value1 = 5 value2 = 0 ).
  CATCH cx_sy_zerodivide INTO DATA(e).
    WRITE / e->get_text( ).
ENDTRY.

" try {
"   var result = Calculator.divide(5,3);
" } catch(ZeroDivideException e) {
"   System.out.println(e.getMessage());
" }

WRITE result.
