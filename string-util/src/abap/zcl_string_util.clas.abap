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
    CONCATENATE 'Hello' iv_input INTO rv_output SEPARATED BY space.
  ENDMETHOD.

ENDCLASS.
