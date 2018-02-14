report zitabop_test.

types:
  begin of lty_depth1,
             vbak type vbak,
             vbap type vbap_t,
    end of lty_depth1.

data: lt_depth type table of lty_depth1,
      lt_vbaps type table of vbap_t.

data: lt_vbak type table of vbak,
      lt_vbap1 type table of vbap,
      lt_vbap2 type table of vbap,
      lt_zmeng type table of dzmeng,
      lt_vbeln type table of vbeln,
      lt_arktx type table of arktx,
      lt_pstyv type table of pstyv.

select * from vbak up to 1000 rows into table lt_vbak.

lt_depth = value #( for row in lt_vbak ( vbak = row ) ).

loop at lt_depth assigning field-symbol(<ls_depth>).
  select * from vbap up to 500 rows into table <ls_depth>-vbap
    where vbeln = <ls_depth>-vbak-vbeln.
endloop.

select * from vbap up to 10 rows into table lt_vbap1
    where zmeng > 0.

select * from vbap up to 50 rows into table lt_vbap2
    where zmeng > 0.

**********************************************************************
* Get single column
**********************************************************************
*zcl_itab_vslice=>get_col(
*  exporting
*    it_tab = lt_vbap1
*    iv_col = 'ZMENG'
*  importing
*    et_tab = lt_zmeng
*).

**********************************************************************
* Get multiple columns
**********************************************************************
*lt_zmeng = value #( for vbap1 in lt_vbap1 ( vbap1-zmeng ) ).
*lt_vbeln = value #( for vbap2 in lt_vbap1 ( vbap2-vbeln ) ).
*lt_arktx = value #( for vbap3 in lt_vbap1 ( vbap3-arktx ) ).
*lt_pstyv = value #( for vbap4 in lt_vbap1 ( vbap4-pstyv ) ).

*loop at lt_vbap1 assigning field-symbol(<ls_vbap>).
*  append initial line to lt_zmeng assigning field-symbol(<lv_zmeng>).
*  <lv_zmeng> = <ls_vbap>-zmeng.
*  append initial line to lt_vbeln assigning field-symbol(<lv_vbeln>).
*  <lv_vbeln> = <ls_vbap>-vbeln.
*  append initial line to lt_arktx assigning field-symbol(<lv_arktx>).
*  <lv_arktx> = <ls_vbap>-arktx.
*  append initial line to lt_pstyv assigning field-symbol(<lv_pstyv>).
*  <lv_pstyv> = <ls_vbap>-pstyv.
*endloop.

zcl_itab_vslice=>get_cols(
  exporting
    it_tab       = lt_vbap1
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
).

*zcl_itab_vslice=>get_cols(
*  exporting
*    it_tab       = lt_depth
*    it_cols      = value #( ( conv #( 'VBAP' ) ) )
*  importing
*    et_tab1      = lt_vbaps
**    et_tab2      =
**    et_tab3      =
**    et_tab4      =
**    et_tab5      =
**    et_tab6      =
**    et_tab7      =
**    et_tab8      =
**    et_tab9      =
*).

*cl_demo_output=>display_data( lt_zmeng ).
*cl_demo_output=>display_data( lt_vbeln ).
*cl_demo_output=>display_data( lt_arktx ).
cl_demo_output=>display_data( lt_vbaps ).
*cl_demo_output=>display_data( lt_pstyv ).
