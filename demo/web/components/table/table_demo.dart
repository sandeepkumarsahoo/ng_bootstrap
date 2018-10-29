library table.table_demo;

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_bootstrap/components/pagination/pagination.dart';
import 'package:ng_bootstrap/components/table/table_directives.dart';
import 'package:ng_bootstrap/components/tabsx/tabsx.dart';
import 'package:js_shims/js_shims.dart';
import 'table_data.dart';
import 'table_data_complex.dart';
export 'table_data_complex.dart';

@Component (selector: 'table-demo',
    templateUrl: 'table_demo.html',
    directives: const [
      bsTableDirectives,
      BsPaginationComponent,
      bsTabsxDirectives,
      coreDirectives,
      formDirectives
    ])
class TableDemoComponent implements OnInit {
  List rows = [];

  num page = 1;

  num itemsPerPage = 12;

  num maxSize = 5;

  num totalPages;

  num totalItems = 0;

  bool selectable;

  List rowsComplex = [];

  String columnName = 'position';

  void ngOnInit() {
    this.filterRows();
  }

  void filterRows([String filterString]) {
    if (falsey(filterString)) {
      rows = data;
      rowsComplex = dataComplex;
    } else {
      rows = data.where((item) =>
          (item[columnName] as String)
              .contains(filterString)
      ).toList();
      rowsComplex = dataComplex.where((item) =>
          (item[columnName] as String)
              .contains(filterString)
      ).toList();
    }
  }

  int sortData(String r11,String r21){
    int r1=r11 as int ;
    int r2=r21 as int;
    print(r1);
    return r1.compareTo(r2);
  }
}