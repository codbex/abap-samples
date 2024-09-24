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

  types: BEGIN OF rszglobv,
             varunid         TYPE c LENGTH 25,    " UUID in compressed form
             objvers         TYPE c LENGTH 10,    " Object version
             vnam            TYPE c LENGTH 30,    " Name (ID) of a Report Variable
             timestmp        TYPE d,     " UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
             tstpnm          TYPE c LENGTH 12,    " Last changed by
             vartyp          TYPE n LENGTH 1,     " Type of a Report Variable
             vroctp          TYPE n LENGTH 1,     " Processing type for query variables
             iobjnm          TYPE c LENGTH 30,    " InfoObject
             vparsel         TYPE c LENGTH 1,     " Parameter Selection: Single Value, Interval, Selection Opt.
             varinput        TYPE c LENGTH 1,     " Variable is ready for input
             entrytp         TYPE n LENGTH 1,     " Entry required
             dynchange       TYPE c LENGTH 1,     " Variable Can Be Changed During Query Navigation
             flaglh          TYPE n LENGTH 1,     " Replacement with from or to value
             flagr           TYPE n LENGTH 1,     " Variable Replacement
             foffset         TYPE n LENGTH 4,     " Offset start
             flength         TYPE n LENGTH 4,     " Offset length of a field
             tlength         TYPE n LENGTH 4,     " Text length
             attrinm         TYPE c LENGTH 30,    " Master data attribute
             compid          TYPE c LENGTH 30,    " Name (ID) of a reporting component
             infocube        TYPE c LENGTH 30,    " InfoCube
             querynm         TYPE c LENGTH 25,    " Internal display of the report identifier
             whfac           TYPE i,      " Currency exponent
             mefac           TYPE i,      " Quantity exponent
             mwkz            TYPE c LENGTH 1,     " Dimension indicator
             waers           TYPE c LENGTH 5,     " Currency Key
             meein           TYPE c LENGTH 3,     " Unit key
             repvnam         TYPE c LENGTH 30,    " Variable Used for Replacement
             sign            TYPE c LENGTH 1,     " SIGN field in creation of SELECT-OPTIONS tables
             opt             TYPE c LENGTH 2,     " Operator in Select Options and other Expressions
             low             TYPE c LENGTH 250,   " Dim: Field for Characteristic Value (Maximum Length)
             high            TYPE c LENGTH 250,   " Dim: Field for Characteristic Value (Maximum Length)
             hienm           TYPE c LENGTH 30,    " Hierarchy name
             version         TYPE c LENGTH 3,     " Hierarchy version
             dateto          TYPE dats,      " Valid-to date
             person          TYPE c LENGTH 30,    " Name (ID) of a Report Variable for Personalization
             as_boolean      TYPE c LENGTH 1,     " Variable is 0 if source is 0 or space and 1 otherwise
             context_free    TYPE c LENGTH 1,     " Variable Replacement Possible Independent of Context
             reference_uid   TYPE c LENGTH 25,    " UUID in compressed form
             reference_action TYPE n LENGTH 2,    " Permitted Actions When Referencing Variables on Elements
             use_startview   TYPE c LENGTH 1,     " Replace by query: Use query start view for replacement
             cmp_support     TYPE c LENGTH 1,     " Variable can also process compounded values
           END OF rszglobv.


  methods PROCESS_ISTEP_0
    abstract
    importing
      value(IV_VNAM) TYPE char30 optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type char30 optional
      value(IS_RKB1D) type char30 optional
      value(IV_PERIV) type char30 optional
      value(IT_VAR_RANGE) type char30 optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID .

  methods PROCESS_ISTEP_1
    abstract
    importing
      value(IV_VNAM) TYPE char30 optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type char30 optional
      value(IS_RKB1D) type char30 optional
      value(IV_PERIV) type char30 optional
      value(IT_VAR_RANGE) type char30 optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID.

  methods PROCESS_ISTEP_2
    abstract
    importing
      value(IV_VNAM) TYPE char30 optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type char30 optional
      value(IS_RKB1D) type char30 optional
      value(IV_PERIV) type char30 optional
      value(IT_VAR_RANGE) type char30 optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID.

  methods PROCESS_ISTEP_3
    abstract
    importing
      value(IV_VNAM) TYPE char30 optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type char30 optional
      value(IS_RKB1D) type char30 optional
      value(IV_PERIV) type char30 optional
      value(IT_VAR_RANGE) type char30 optional
      value(IV_STEP) type I optional
    changing
      !CT_RANGE type RSR_T_RANGESID.

  methods CONSTRUCTOR
    importing
      value(IV_VNAM) TYPE char30 optional
      value(IV_VARTYP) type RSZGLOBV-VARTYP optional
      value(IV_IOBJNM) type RSZGLOBV-IOBJNM optional
      value(IS_COB_PRO) type char30 optional
      value(IS_RKB1D) type char30 optional
      value(IV_PERIV) type char30 optional
      value(IT_VAR_RANGE) type char30 optional
      value(IV_STEP) type I optional.

protected section.
  data IV_VNAM type char30.
  data IV_VARTYP type RSZGLOBV-VARTYP.
  data IV_IOBJNM type RSZGLOBV-IOBJNM.
  data IS_COB_PRO type char30.
  data IS_RKB1D type char30.
  data IV_PERIV type char30.
  data IT_VAR_RANGE type char30.
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