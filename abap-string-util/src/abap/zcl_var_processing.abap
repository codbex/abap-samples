class ZCL_VAR_PROCESSING definition
  public
  abstract
  create public.

public section.
  types: BEGIN OF rsr_s_rangesid,
           sign   TYPE c LENGTH 1,
           option TYPE c LENGTH 2,
           low    TYPE c LENGTH 132,
           high   TYPE c LENGTH 132,
         END OF rsr_s_rangesid.

  types: rsr_t_rangesid TYPE STANDARD TABLE OF rsr_s_rangesid WITH DEFAULT KEY.

  methods PROCESS_ISTEP_0
    abstract
    importing
      value(IV_VNAM) type RSZGLOBV-VNAM optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type RSD_S_COB_PRO optional
      value(IS_RKB1D) type RSR_S_RKB1D optional
      value(IV_PERIV) type RRO01_S_RKB1F-PERIV optional
      value(IT_VAR_RANGE) type RRS0_T_VAR_RANGE optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID .

  methods PROCESS_ISTEP_1
    abstract
    importing
      value(IV_VNAM) type RSZGLOBV-VNAM optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type RSD_S_COB_PRO optional
      value(IS_RKB1D) type RSR_S_RKB1D optional
      value(IV_PERIV) type RRO01_S_RKB1F-PERIV optional
      value(IT_VAR_RANGE) type RRS0_T_VAR_RANGE optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID.

  methods PROCESS_ISTEP_2
    abstract
    importing
      value(IV_VNAM) type RSZGLOBV-VNAM optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type RSD_S_COB_PRO optional
      value(IS_RKB1D) type RSR_S_RKB1D optional
      value(IV_PERIV) type RRO01_S_RKB1F-PERIV optional
      value(IT_VAR_RANGE) type RRS0_T_VAR_RANGE optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID.

  methods PROCESS_ISTEP_3
    abstract
    importing
      value(IV_VNAM) type RSZGLOBV-VNAM optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type RSD_S_COB_PRO optional
      value(IS_RKB1D) type RSR_S_RKB1D optional
      value(IV_PERIV) type RRO01_S_RKB1F-PERIV optional
      value(IT_VAR_RANGE) type RRS0_T_VAR_RANGE optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID.

  methods CONSTRUCTOR
    importing
      value(IV_VNAM) type RSZGLOBV-VNAM optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type RSD_S_COB_PRO optional
      value(IS_RKB1D) type RSR_S_RKB1D optional
      value(IV_PERIV) type RRO01_S_RKB1F-PERIV optional
      value(IT_VAR_RANGE) type RRS0_T_VAR_RANGE optional
      value(IV_STEP) TYPE I optional.

protected section.
  data IV_VNAM type RSZGLOBV-VNAM.
  data IV_VARTYP type RSZGLOBV-VARTYP.
  data IV_IOBJNM type RSZGLOBV-IOBJNM.
  data IS_COB_PRO type RSD_S_COB_PRO.
  data IS_RKB1D type RSR_S_RKB1D.
  data IV_PERIV type RRO01_S_RKB1F-PERIV.
  data IT_VAR_RANGE type RRS0_T_VAR_RANGE.
  data IV_STEP TYPE I.

private section.
ENDCLASS.

CLASS ZCL_VAR_PROCESSING IMPLEMENTATION.
  method CONSTRUCTOR.
    me->IV_VNAM = IV_VNAM.
    me->IV_VARTYP = IV_VARTYP.
    me->IV_IOBJNM = IV_IOBJNM.
    me->IS_COB_PRO = IS_COB_PRO.
    me->IS_RKB1D = IS_RKB1D.
    me->IV_PERIV = IV_PERIV.
    me->IT_VAR_RANGE = IT_VAR_RANGE.
    me->iv_step = iv_step.
  endmethod.
ENDCLASS.