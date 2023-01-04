import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  FirstScreen()
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("PaginatedDataTable",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: PaginatedDataTable(
            header: const Text("PaginatedDataTable"),
            actions: const [
              Icon(Icons.notifications,color: Colors.green,),
            ],
            // availableRowsPerPage: [],
            onRowsPerPageChanged: (perPage) {},
            rowsPerPage: 10,
            arrowHeadColor: Colors.green,
            checkboxHorizontalMargin: 10,
            columnSpacing: 56,
            dataRowHeight: 30,
            dragStartBehavior: DragStartBehavior.start,
            headingRowHeight: 56,
            horizontalMargin: 24,
            initialFirstRowIndex: 1,
            onPageChanged: (value) {},
            onSelectAll: (value) {}, 
            primary: false,
            showCheckboxColumn: true,
            showFirstLastButtons: true,
            sortAscending: true,
            sortColumnIndex: 2,
            columns: <DataColumn>[
              DataColumn(
                label: const Text('Country'),
                onSort: (columnIndex, ascending) {
                  print("$columnIndex $ascending");
                },
              ),
              const DataColumn(
                label: Text('Code'),
              ),
              const DataColumn(
                label: Text('State'),
              ),
            ],
            source: TableRow(),
          ),
        ),
      )
    );
  }
}

class TableRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("India $index")),
      DataCell(Text("Code $index")),
      DataCell(Text("Gujarat $index")),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 50;

  @override
  int get selectedRowCount => 0;
}