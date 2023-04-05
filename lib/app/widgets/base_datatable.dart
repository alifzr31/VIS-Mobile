import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class BaseDataTable extends StatelessWidget {
  const BaseDataTable({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      // scrollController: ScrollController(keepScrollOffset: true),
      dividerThickness: 3,
      dataRowHeight: 70,
      headingTextStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          MaterialStateProperty.resolveWith((states) => Colors.black),
      columnSpacing: 10,
      horizontalMargin: 8,
      minWidth: 600,
      columns: columns,
      rows: rows,
    );
  }
}
