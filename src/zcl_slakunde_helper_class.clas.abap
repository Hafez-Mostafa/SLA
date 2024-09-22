CLASS zcl_slakunde_helper_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    TYPES: tt_create_kunde   TYPE TABLE FOR CREATE zi_slakunde\\slakunde,
           tt_mapped_early   TYPE RESPONSE FOR MAPPED EARLY zi_slakunde,
           tt_failed_early   TYPE RESPONSE FOR FAILED EARLY zi_slakunde,
           tt_reported_early TYPE RESPONSE FOR REPORTED EARLY zi_slakunde,
           tt_reported_late  TYPE RESPONSE FOR REPORTED LATE zi_slakunde,
           tt_keys_slakunde TYPE  TABLE FOR READ IMPORT zi_slakunde\\slakunde,
           tt_result_slakunde type table for read result zi_slakunde\\slakunde

           .

*  Create Constructor
    " Method definition to return an instance of the class (singleton pattern)

    CLASS-METHODS: get_instance RETURNING VALUE(ro_instance)
                                            TYPE REF TO zcl_slakunde_helper_class.
    METHODS :   get_new_id  RETURNING VALUE(newid) TYPE  sysuuid_x16
                            RAISING
                                      cx_uuid_error
                            ,


      earlynumbering_create_kunde
        IMPORTING entities TYPE tt_create_kunde
        CHANGING  mapped   TYPE tt_mapped_early "responsible to send the data from RAP to FIORI
                  failed   TYPE  tt_failed_early
                  reported TYPE  tt_reported_early
        RAISING
                  cx_uuid_error ,


      create_kunde
        IMPORTING entities TYPE tt_create_kunde
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE  tt_failed_early
                  reported TYPE tt_reported_early,

      save_kunde
        CHANGING reported TYPE tt_reported_late,

      read_kunde
        IMPORTING keys     TYPE tt_keys_slakunde
        CHANGING  result   TYPE tt_result_slakunde
                  failed   TYPE  tt_failed_early
                  reported TYPE tt_reported_early


        .


  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA:
      " Static class data, which holds the single instance of the class
      mo_instance    TYPE REF TO zcl_slakunde_helper_class,
      " Class attributes to hold table data

* buffer tables
      gt_slakunde    TYPE STANDARD TABLE OF zsla_kunden,
      gt_slaverinbar TYPE STANDARD TABLE OF zsla_vereinbar,

      "buffer tables Components of  slakunde  & slaverinbar
      gt_mapped      TYPE tt_mapped_early

      .
ENDCLASS.



CLASS zcl_slakunde_helper_class IMPLEMENTATION.
  METHOD get_instance.
    " Conditional operator to check if the instance already exists
    " If mo_instance is bound (already exists), return it;
    "otherwise, create a new instance

    mo_instance = ro_instance = COND #( WHEN mo_instance IS BOUND
                                        THEN mo_instance
                                        ELSE NEW #(  ) ).

  ENDMETHOD.

  METHOD earlynumbering_create_kunde.

    DATA(ls_mapped) = gt_mapped.
    "generating new key id
    DATA(lv_new_id) = get_new_id(  ).

    READ TABLE gt_slakunde ASSIGNING FIELD-SYMBOL(<lfs_slakunde>) INDEX 1.
    IF <lfs_slakunde> IS ASSIGNED .
      <lfs_slakunde>-kunden_id = lv_new_id.
      UNASSIGN <lfs_slakunde>.

    ENDIF.
    mapped-slakunde = VALUE #(
                              FOR ls_entities IN entities
                              WHERE ( KundenId IS INITIAL )
                              ( %cid = ls_entities-%cid
                              %is_draft = ls_entities-%is_draft
                              kundenid = lv_new_id
                               )  ).

  ENDMETHOD.

  METHOD get_new_id.
    TRY.
        newid = cl_uuid_factory=>create_system_uuid(  )->create_uuid_x16(  ).
      CATCH cx_uuid_error INTO DATA(lx_uuid_error).
        RAISE EXCEPTION lx_uuid_error.

    ENDTRY.


*    newid = cl_uuid_factory=>create_system_uuid(  )->create_uuid_x16(  ).

  ENDMETHOD.

  METHOD create_kunde.
    " move all records in front end to the buffer table gt_slakunde
    gt_slakunde = CORRESPONDING #( entities MAPPING FROM ENTITY ).
*
  ENDMETHOD.

  METHOD save_kunde.
    IF NOT gt_slakunde[] IS INITIAL.
      MODIFY zsla_kunden FROM TABLE @gt_slakunde.

    ENDIF.
  ENDMETHOD.

  METHOD read_kunde.
  SELECT * from zsla_kunden FOR ALL ENTRIES IN @keys where kunden_id = @keys-KundenId
  into table @DATA(lt_kunde_data).
*   mapping over all entity content to the paramater result from Fromtend
  result = CORRESPONDING #( lt_kunde_data MAPPING TO ENTITY ).



  ENDMETHOD.

ENDCLASS.
