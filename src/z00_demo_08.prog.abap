*&---------------------------------------------------------------------*
*& Report z00_demo_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_08.

**********************************************************************
* Definitionen und Deklarationen
**********************************************************************
PARAMETERS p_cid TYPE s_carr_id DEFAULT 'LH'.
PARAMETERS p_cid2 TYPE s_carr_id.
PARAMETERS p_chckbx AS CHECKBOX.

PARAMETERS p_opt1 RADIOBUTTON GROUP opts.
PARAMETERS p_opt2 RADIOBUTTON GROUP opts.
PARAMETERS p_opt3 RADIOBUTTON GROUP opts.

**********************************************************************
* Dynamische Vorbelegungen
**********************************************************************
INITIALIZATION.
  IF sy-langu = 'E'.
    p_chckbx = abap_true.
  ENDIF.

**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN ON p_chckbx.
  IF p_chckbx = 'X'. " IF p_chckbc = abap_true.
    MESSAGE e000(z00) WITH sy-uname.
  ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
  CASE abap_true.
    WHEN p_opt1.
      WRITE 'Option 1 gesetzt'.
    WHEN p_opt2.
      WRITE 'Option 2 gesetzt'.
    WHEN p_opt3.
      WRITE 'Option 3 gesetzt'.
  ENDCASE.
