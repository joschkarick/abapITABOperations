# abapITABOperations
Advanced operations for internal tables in ABAP.
The purpose of this package is to provide easily usable operations on internal tables. Any re-occuring operation on internal tables is suitable for this package.

### Installation
Install via [abapGit](https://github.com/larshp/abapGit)

### Example
```abap
data: lt_vbap type table of vbap,
      lt_zmeng type table of dzmeng.
      
select * from vbap up to 50 rows into table lt_vbap.
      
zcl_itab_vslice=>get_col_unique_sort(
  exporting
    it_tab = lt_vbap
    iv_col = 'ZMENG'
  importing
    et_tab = lt_zmeng ).
```

Extracts all unique values of column ZMENG of internal table lt_vbap into a new internal table with one column, lt_zmeng.
