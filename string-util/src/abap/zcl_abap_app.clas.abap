CLASS zcl_abap_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: run
        IMPORTING
          VALUE(iv_name) TYPE string.

ENDCLASS.

CLASS zcl_abap_app IMPLEMENTATION.

  METHOD run.
    " Declare a variable to hold the result of the concatenation
    DATA: lv_message TYPE string.

    lv_message = zcl_string_util=>concatenate_hello( iv_input = iv_name ).

    " Print the message returned by the concatenate_hello method
    WRITE: / lv_message.
  ENDMETHOD.

ENDCLASS.
