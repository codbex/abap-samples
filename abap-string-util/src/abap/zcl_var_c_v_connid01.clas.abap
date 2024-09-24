class ZCL_VAR_C_V_CONNID01 definition
  public
  inheriting from ZCL_VAR_PROCESSING
  create public .
 
public section.
 
  methods PROCESS_ISTEP_0
    redefinition .
  methods PROCESS_ISTEP_1
    redefinition .
  methods PROCESS_ISTEP_2
    redefinition .
  methods PROCESS_ISTEP_3
    redefinition .
protected section.
private section.
ENDCLASS.
 
CLASS ZCL_VAR_C_V_CONNID01 IMPLEMENTATION.

  method PROCESS_ISTEP_0.
  endmethod.

  method PROCESS_ISTEP_1.
  endmethod.

  METHOD process_istep_2.
 
    DATA: lt_data TYPE TABLE OF char4.
    FIELD-SYMBOLS: <ls_data> type any,
                   <ls_range> type rsr_s_rangesid.
 
   IF iv_vnam = 'C_V_CONNID01'.
      CASE iv_step.
        WHEN 2.
        
          SELECT connid
          FROM cp_z1sflight2
          INTO TABLE lt_data
          WHERE connid IN ('0555','0790','1699').
          
          IF lt_data IS NOT INITIAL.
            LOOP AT lt_data ASSIGNING <ls_data>.
               APPEND INITIAL LINE TO ct_range ASSIGNING <ls_range>.
               <ls_range>-sign = 'I'.
               <ls_range>-option  = 'EQ'.
               <ls_range>-low  = <ls_data>.
            ENDLOOP.
          ENDIF.
      ENDCASE.
    ENDIF.
  ENDMETHOD.
 
 
  method PROCESS_ISTEP_3.
  endmethod.
ENDCLASS.