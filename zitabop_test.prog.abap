report zitabop_test.

data: lt_vbap type table of vbap,
      lt_zmeng type table of dzmeng,
      lt_vbeln type table of vbeln,
      lt_arktx type table of arktx,
      lt_pstyv type table of pstyv.

select * from vbap up to 10 rows into table lt_vbap
    where zmeng > 0.

zcl_itab_vslice=>get_col(
  exporting
    it_tab = lt_vbap
    iv_col = 'ZMENG'
  importing
    et_tab = lt_zmeng
).

zcl_itab_vslice=>get_cols(
  exporting
    it_tab       = lt_vbap
    it_cols      = value #( ( conv #( 'ZMENG' ) )
                            ( conv #( 'VBELN' ) )
                            ( conv #( 'ARKTX' ) )
                            ( conv #( 'PSTYV' ) ) )
  importing
    et_tab1      = lt_zmeng
    et_tab2      = lt_vbeln
    et_tab3      = lt_arktx
    et_tab4      = lt_pstyv
*    et_tab5      =
*    et_tab6      =
*    et_tab7      =
*    et_tab8      =
*    et_tab9      =
*    eo_tab_descr =
).

*cl_demo_output=>display_data( lt_zmeng ).
*cl_demo_output=>display_data( lt_vbeln ).
cl_demo_output=>display_data( lt_arktx ).
*cl_demo_output=>display_data( lt_pstyv ).
