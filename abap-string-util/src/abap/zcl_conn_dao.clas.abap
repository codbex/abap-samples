CLASS zcl_conn_dao DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES:
    BEGIN OF ty_connid,
        connid         TYPE string,
    END OF ty_connid,
    ty_connids TYPE STANDARD TABLE OF ty_connid WITH DEFAULT KEY.

    CLASS-METHODS:
    select_all
        IMPORTING
          iv_filter_connid TYPE string OPTIONAL
          iv_step TYPE string OPTIONAL
        RETURNING VALUE(rv_result) TYPE string.

ENDCLASS.

CLASS zcl_conn_dao IMPLEMENTATION.


  METHOD select_all.
    DATA: lt_connids TYPE ty_connids,
        lv_connid      TYPE ty_connid,
        lv_connid_1      TYPE string.

    SELECT connid
    FROM cp_z1sflight2
    WHERE carrid = iv_filter_connid
    INTO TABLE lt_connids.

    IF iv_filter_connid = 'AZ'.
      rv_result = 'aa'.
    ENDIF.

    rv_result = 'No records found.'.


  ENDMETHOD.


ENDCLASS.