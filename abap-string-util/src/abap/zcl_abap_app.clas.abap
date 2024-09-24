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

    TYPES: BEGIN OF t_ob_2_cls,
         object TYPE string,
         typ    TYPE char1,
         class  TYPE string,
       END OF  t_ob_2_cls.


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
      lo_qvar        TYPE REF TO ZCL_VAR_PROCESSING,
      lv_qvar_class  TYPE string, " VALUE 'ZCL_VAR_',
      lv_qvar_method TYPE string, " VALUE 'PROCESS_ISTEP_',
      lt_istep       TYPE TABLE OF string,
      lv_i_step      TYPE string,
      lv_string      TYPE string,
      lt_objects     TYPE TABLE OF t_ob_2_cls,
      ls_objects     TYPE t_ob_2_cls,
      v_t_range      TYPE RSR_S_RANGESID,
      c_t_range      TYPE RSR_T_RANGESID,
      lv_variable    TYPE string.

    REFRESH lt_objects.
     
    CONCATENATE cv_qvar_cls iv_string1 INTO lv_qvar_class.
    CONDENSE lv_qvar_class.
    
    "collect the class
    ls_objects-object = iv_string1.
    ls_objects-typ    = cv_type_var.
    ls_objects-class  = lv_qvar_class.
    APPEND ls_objects TO lt_objects.

    "generate method name according to iv_string2
    lv_i_step = iv_string2.
     
    CASE iv_string2.
      WHEN 0.
        CONCATENATE cv_qvar_method iv_string2 INTO lv_qvar_method.
      WHEN 1.
        CONCATENATE cv_qvar_method iv_string2 INTO lv_qvar_method.
      WHEN 2.
        CONCATENATE cv_qvar_method iv_string2 INTO lv_qvar_method.
      WHEN 3.
        CONCATENATE cv_qvar_method iv_string2 INTO lv_qvar_method.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

    TRANSLATE lv_qvar_method TO UPPER CASE.
    CONDENSE lv_qvar_method.

    LOOP AT lt_objects INTO ls_objects.
      lv_variable = iv_string1.

      CREATE OBJECT lo_qvar TYPE (ls_objects-class)
        EXPORTING
          iv_vnam       = lv_variable
          iv_step       = iv_string2.

      CALL METHOD lo_qvar->(lv_qvar_method)
        EXPORTING
           iv_vnam       = lv_variable
           iv_step       = iv_string2
        CHANGING
          ct_range = c_t_range.

    ENDLOOP.

    LOOP AT c_t_range into v_t_range.
      IF rv_output = ''.
        rv_output = v_t_range-low.
      ELSE.
        rv_output = rv_output && ',' && v_t_range-low.
      ENDIF.
    ENDLOOP.


    "rv_output = iv_string1.      
  ENDMETHOD.
ENDCLASS.
