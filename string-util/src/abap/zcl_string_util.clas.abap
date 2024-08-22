CLASS zcl_string_util DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: concatenate_strings
      IMPORTING
        VALUE(iv_string1) TYPE string
        VALUE(iv_string2) TYPE string
      RETURNING
        VALUE(rv_output) TYPE string.

ENDCLASS.

CLASS zcl_string_util IMPLEMENTATION.

  METHOD concatenate_strings.
    rv_output = |{ iv_string1 }{ iv_string2 }|.
  ENDMETHOD.

ENDCLASS.
