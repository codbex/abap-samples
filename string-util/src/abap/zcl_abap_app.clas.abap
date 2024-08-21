CLASS zcl_abap_app DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS:
      run.

ENDCLASS.

CLASS zcl_abap_app IMPLEMENTATION.

  METHOD run.
    " Declare a variable to hold the result of the concatenation
    DATA: lv_message TYPE string.

    " Call the static method from zcl_string_util and store the result
    lv_message = zcl_string_util=>concatenate_hello( iv_input = 'world' ).

    " Print the original 'Hello world!' message
    zcl_codbex_http_response=>println(
      EXPORTING
        message_in = 'Hello world!' ).

    " Print the message returned by the concatenate_hello method
    zcl_codbex_http_response=>println(
      EXPORTING
        message_in = lv_message ).
  ENDMETHOD.

ENDCLASS.
