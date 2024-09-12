CLASS zcl_abap_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    types: BEGIN OF rsr_s_rangesid,
             sign   TYPE c LENGTH 1,
             option TYPE c LENGTH 2,
             low    TYPE c LENGTH 132,
             high   TYPE c LENGTH 132,
           END OF rsr_s_rangesid.
    types: rsr_t_rangesid TYPE STANDARD TABLE OF rsr_s_rangesid WITH DEFAULT KEY.
    CLASS-METHODS: run
      IMPORTING
        VALUE(iv_string1) TYPE string
        VALUE(iv_string2) TYPE string
      RETURNING
        VALUE(rv_output) TYPE string.
ENDCLASS.
CLASS zcl_abap_app IMPLEMENTATION.
  METHOD run.
    CONSTANTS:
      cv_type_var    TYPE char1  VALUE 'V',
      cv_type_pro    TYPE char1  VALUE 'P',
      cv_qvar_cls    TYPE string VALUE 'ZCL_VAR_',
      cv_qvar_method TYPE string VALUE 'PROCESS_ISTEP_'.
    DATA:
      lv_qvar_class  TYPE string, " VALUE 'ZCL_VAR_',
      lv_qvar_method TYPE string, " VALUE 'PROCESS_ISTEP_',
      lt_istep       TYPE TABLE OF string,
      lv_i_step      TYPE string,
      lv_string      TYPE string,
      c_t_range      TYPE RSR_T_RANGESID.
    rv_output = iv_string1.
  ENDMETHOD.
ENDCLASS.
