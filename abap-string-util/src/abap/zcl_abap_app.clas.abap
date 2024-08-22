CLASS zcl_abap_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: run
      IMPORTING
        VALUE(iv_string1) TYPE string
        VALUE(iv_string2) TYPE string
      RETURNING
        VALUE(rv_output) TYPE string.

ENDCLASS.

CLASS zcl_abap_app IMPLEMENTATION.

  METHOD run.
    " Declare a variable to hold the result of the concatenation
    DATA: lv_message TYPE string.

    lv_message = zcl_string_util=>concatenate_strings(
        iv_string1 = iv_string1
        iv_string2 = iv_string2 ).

    rv_output = |{ iv_string1 }{ iv_string2 }|.
  ENDMETHOD.

ENDCLASS.
