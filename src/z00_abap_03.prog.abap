*&---------------------------------------------------------------------*
*& Report z00_abap_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abap_03.

**********************************************************************
* Definitionen und Deklarationen
**********************************************************************
TYPES ty_decimal TYPE p LENGTH 16 DECIMALS 2.

PARAMETERS p_op1 TYPE ty_decimal OBLIGATORY.
PARAMETERS p_opr OBLIGATORY.
PARAMETERS p_op2 TYPE z00_operand2 OBLIGATORY.

DATA result TYPE ty_decimal.

**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN ON p_opr.
  IF p_opr <> '+' AND p_opr <> '-' AND p_opr <> '*' AND p_opr <> '/'
   AND p_opr <> '%' AND p_opr <> '^' AND p_opr <> '2'.
    MESSAGE e003(z00) WITH p_opr.
  ENDIF.

AT SELECTION-SCREEN ON p_op2.
  IF p_opr = '/' AND p_op2 IS INITIAL.
    MESSAGE e002(z00).
  ENDIF.

AT SELECTION-SCREEN.
  IF p_opr = '^'.
    TRY.
        zcl_abap_calculator=>calculate_power( base = p_op1 exponent = p_op2 ).
      CATCH cx_sy_arithmetic_overflow INTO DATA(e). "TODO
        MESSAGE e->get_text( ) TYPE 'E'.
    ENDTRY.
  ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
  CASE p_opr.
    WHEN '+'.
      result = p_op1 + p_op2.
    WHEN '-'.
      result = p_op1 - p_op2.
    WHEN '*'.
      result = p_op1 * p_op2.
    WHEN '/'.
      result = p_op1 / p_op2.
    WHEN '%'.
      result = zcl_00_calculator=>calculate_percentage( percentage = p_op1 base_value = p_op2 ).
    WHEN '^'.
      result = zcl_abap_calculator=>calculate_power( base = p_op1 exponent = p_op2 ).
    WHEN '2'.
      result = zcl_abap_calculator=>calculate_power( p_op1 ).
  ENDCASE.

  WRITE |{ p_op1 } { p_opr } { p_op2 } = { result }|.
