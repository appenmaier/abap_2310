*&---------------------------------------------------------------------*
*& Report z00_demo_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_05.

DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA flight_date TYPE s_date VALUE '20231016'.
DATA error.

**********************************************************************
* Vergleichsoperatoren und Logische Operatoren
**********************************************************************
* Vergleichsoperatoren: >, >=, <, <=, =, <>
* Logische Operatoren: AND, OR, NOT

**********************************************************************
* Einfachverzweigungen
**********************************************************************
IF carrier_id = 'UA' OR NOT ( flight_date >= '20230101' AND flight_date <= '20231231' ).
  WRITE 'Bedingung erfüllt'.
ELSE.
  WRITE 'Bedingung nicht erfüllt'.
ENDIF.

IF error IS NOT INITIAL. "IF error = abap_true. "IF error = 'X'.
  WRITE 'Fehler'.
ENDIF.

**********************************************************************
* Komplexe Fallunterscheidungen
**********************************************************************
CASE carrier_id.
  WHEN 'Lh' OR 'lH' OR 'lh' OR 'LH'.
    WRITE 'Lufthansa'.
  WHEN 'UA'.
    WRITE 'United Airlines'.
  WHEN OTHERS.
    WRITE carrier_id.
ENDCASE.
