CLASS zcl_00_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING value1        TYPE z00_decimal
                value2        TYPE z00_decimal
      RETURNING VALUE(result) TYPE z00_decimal
      RAISING   cx_sy_zerodivide.

    "public static double divide(double value1, double value2) throws ZeroDivideException{
    "  return value1 / value2;
    "}

    CLASS-METHODS calculate_percentage
      IMPORTING
                percentage    TYPE zabap_decimal
                base_value    TYPE zabap_decimal
      RETURNING VALUE(result) TYPE zabap_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_calculator IMPLEMENTATION.

  METHOD divide.
    result = value1 / value2.
  ENDMETHOD.

  METHOD calculate_percentage.
    result = percentage * base_value / 100.
  ENDMETHOD.

ENDCLASS.
