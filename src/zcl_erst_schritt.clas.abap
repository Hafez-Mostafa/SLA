CLASS zcl_erst_schritt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_erst_schritt IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data: lt_student type standard table of zdb_table_1.

  DATa:lv_date type timestamp.
       get TIME STAMP FIELD lv_date.
        lt_student = value #( (
        student_id ='Mostafa'  course_name = 'Fiori Element framework'
        course_fee = 10000 curr_code = 'USD'
        created_by = sy-uname created_at = lv_date

        changed_by = sy-uname     changed_at = lv_date

        ) ).

        insert zdb_table_1 from table @lt_student.
if sy-subrc is initial.


  out->write(
    EXPORTING
      data   = 'Data is insterted into DB Table Successfully'
*      name   =
*    RECEIVING
*      output =
  ).
  else.
   out->write(
    EXPORTING
      data   = 'Data Insertion Failed'
*      name   =
*    RECEIVING
*      output =
  ).
ENDIF.

  ENDMETHOD.
ENDCLASS.
