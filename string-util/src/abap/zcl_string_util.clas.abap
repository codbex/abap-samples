CLASS zcl_string_util DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: concatenate_hello
      IMPORTING
        VALUE(iv_input) TYPE string
      RETURNING
        VALUE(rv_output) TYPE string.

ENDCLASS.

CLASS zcl_string_util IMPLEMENTATION.

  METHOD concatenate_hello.
    rv_output = |Hello { iv_input }|.
  ENDMETHOD.

ENDCLASS.
