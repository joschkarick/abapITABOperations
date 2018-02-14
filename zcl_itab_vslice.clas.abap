class zcl_itab_vslice definition
  public
  final
  create public .

  public section.

    class-methods get_col
      importing it_tab type standard table
                iv_col type string
      exporting et_tab type standard table.
    class-methods get_cols
      importing it_tab type standard table
                it_cols type string_table
      exporting et_tab1 type standard table
                et_tab2 type standard table
                et_tab3 type standard table
                et_tab4 type standard table
                et_tab5 type standard table
                et_tab6 type standard table
                et_tab7 type standard table
                et_tab8 type standard table
                et_tab9 type standard table.
    class-methods get_itab_components
      importing it_tab type standard table
      returning value(rt_components) type abap_component_tab.
    class-methods get_col_unique_sort
      importing it_tab type standard table
                iv_col type string
      exporting et_tab type standard table.
    class-methods get_cols_unique_sort
      importing it_tab type standard table
                it_cols type string_table
      exporting et_tab1 type standard table
                et_tab2 type standard table
                et_tab3 type standard table
                et_tab4 type standard table
                et_tab5 type standard table
                et_tab6 type standard table
                et_tab7 type standard table
                et_tab8 type standard table
                et_tab9 type standard table.
    " Get RANGE from itab
    " Get RANGES from itab
    " Get COL from itab
    " Get COLS from itab
    " Get UNIQUE COL from itab
    " Get UNIQUE COLS from itab
    " Get COL SUM from itab
*    name       type string,
*    type       type ref to cl_abap_datadescr,
*    as_include type abap_bool,
*    suffix     type string,

  protected section.
  private section.
endclass.

class zcl_itab_vslice implementation.
  method get_itab_components.
    data: lt_comp type abap_component_tab.

    data(lo_tab_descr) = cast cl_abap_tabledescr( cl_abap_typedescr=>describe_by_data( p_data = it_tab ) ).
    data(lo_struct_descr) = cast cl_abap_structdescr( lo_tab_descr->get_table_line_type( ) ).

    rt_components = lo_struct_descr->get_components( ).
  endmethod.
  method get_col.
    loop at it_tab assigning field-symbol(<ls_row>).
      assign component iv_col of structure <ls_row> to field-symbol(<lv_in>).

      check <lv_in> is assigned.

      append initial line to et_tab assigning field-symbol(<ls_out>).
      <ls_out> = <lv_in>.

      unassign: <lv_in>, <ls_out>.
    endloop.
  endmethod.
  method get_cols.
    field-symbols: <ls_out> type any,
                   <lt_tab> type standard table.

    loop at it_cols assigning field-symbol(<lv_col>).
      case sy-tabix.
        when 1.
          assign et_tab1 to <lt_tab>.
        when 2.
          assign et_tab2 to <lt_tab>.
        when 3.
          assign et_tab3 to <lt_tab>.
        when 4.
          assign et_tab4 to <lt_tab>.
        when 5.
          assign et_tab5 to <lt_tab>.
        when 6.
          assign et_tab6 to <lt_tab>.
        when 7.
          assign et_tab7 to <lt_tab>.
        when 8.
          assign et_tab8 to <lt_tab>.
        when 9.
          assign et_tab9 to <lt_tab>.
      endcase.

      get_col( exporting it_tab = it_tab
                         iv_col = <lv_col>
               importing et_tab = <lt_tab> ).
    endloop.
  endmethod.
  method get_col_unique_sort.
    get_col( exporting it_tab = it_tab
                       iv_col = iv_col
             importing et_tab = et_tab ).
    sort et_tab by (iv_col).
    delete adjacent duplicates from et_tab comparing (iv_col).
  endmethod.
  method get_cols_unique_sort.
    field-symbols: <ls_out> type any,
                   <lt_tab> type standard table.

    loop at it_cols assigning field-symbol(<lv_col>).
      case sy-tabix.
        when 1.
          assign et_tab1 to <lt_tab>.
        when 2.
          assign et_tab2 to <lt_tab>.
        when 3.
          assign et_tab3 to <lt_tab>.
        when 4.
          assign et_tab4 to <lt_tab>.
        when 5.
          assign et_tab5 to <lt_tab>.
        when 6.
          assign et_tab6 to <lt_tab>.
        when 7.
          assign et_tab7 to <lt_tab>.
        when 8.
          assign et_tab8 to <lt_tab>.
        when 9.
          assign et_tab9 to <lt_tab>.
      endcase.

      get_col_unique_sort( exporting it_tab = it_tab
                                     iv_col = <lv_col>
                           importing et_tab = <lt_tab> ).
    endloop.
  endmethod.
endclass.
