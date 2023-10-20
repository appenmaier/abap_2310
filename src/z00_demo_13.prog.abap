*&---------------------------------------------------------------------*
*& Report z00_demo_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_13.

DATA carriers TYPE TABLE OF s_carr_id.

carriers = VALUE #( ( 'LH' ) ( 'UA' ) ( 'AA' ) ).

IF line_exists( carriers[ table_line = 'UA' ] ).
  WRITE 'existiert'.
ENDIF.

DATA(text) = 'Hans;Peter;Lisa;Heidi'.
SPLIT text AT ';' INTO TABLE DATA(names).
SPLIT text AT ';' INTO DATA(name1) DATA(name2) DATA(name3) DATA(name4).
