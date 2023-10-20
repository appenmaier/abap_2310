*&---------------------------------------------------------------------*
*& Report z00_demo_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_07.

PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_cid2 TYPE c LENGTH 3.

WRITE 'Systemfelder'(sf1). "WRITE text-sf1.

WRITE / |{ text-an1 }: { sy-uname }|.
WRITE / |Datum des Servers: { sy-datum DATE = USER }|.
WRITE / |Zeit des Servers: { sy-uzeit TIME = USER }|.
WRITE / |Datum des Client: { sy-datlo DATE = USER }|.
WRITE / |Zeit des Client: { sy-timlo TIME = USER }|.
WRITE / |Anmeldemandat: { sy-mandt }|.
WRITE / |Anmeldesprache: { sy-langu }|.
