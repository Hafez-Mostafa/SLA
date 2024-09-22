CLASS lhc_SLAKUNDE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR slakunde RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR slakunde RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE slakunde.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE slakunde.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE slakunde.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE slakunde.

    METHODS read FOR READ
      IMPORTING keys FOR READ slakunde RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK slakunde.

    METHODS rba_Sla_vereinbar FOR READ
      IMPORTING keys_rba FOR READ slakunde\_Sla_vereinbar FULL result_requested RESULT result LINK association_links.

    METHODS cba_Sla_vereinbar FOR MODIFY
      IMPORTING entities_cba FOR CREATE slakunde\_Sla_vereinbar.

    METHODS earlynumbering_cba_Sla_vereinb FOR NUMBERING
      IMPORTING entities FOR CREATE slakunde\_Sla_vereinbar.

ENDCLASS.

CLASS lhc_SLAKUNDE IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

    zcl_slakunde_helper_class=>get_instance(  )->create_kunde(
  EXPORTING
     entities = entities
  CHANGING
      mapped = mapped
      failed = failed
      reported = reported  ).
  ENDMETHOD.

  METHOD earlynumbering_create.

    zcl_slakunde_helper_class=>get_instance( )->earlynumbering_create_kunde(

    EXPORTING
    entities  = entities
    CHANGING
    mapped = mapped
    failed = failed
    reported = reported
    ).

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  zcl_slakunde_helper_class=>get_instance(  )->read_kunde( EXPORTING
  keys = keys
  CHANGING
  result = result
  failed = failed
  reported = reported ).
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Sla_vereinbar.
  ENDMETHOD.

  METHOD cba_Sla_vereinbar.
  ENDMETHOD.

  METHOD earlynumbering_cba_Sla_vereinb.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_SLAVERINBAR DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE slaverinbar.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE slaverinbar.

    METHODS read FOR READ
      IMPORTING keys FOR READ slaverinbar RESULT result.

    METHODS rba_Slakunda FOR READ
      IMPORTING keys_rba FOR READ slaverinbar\_Slakunda FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_SLAVERINBAR IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Slakunda.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_SLAKUNDE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.


    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_SLAKUNDE IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    zcl_slakunde_helper_class=>get_instance(  )->save_kunde(
  CHANGING reported = reported


   ).
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
