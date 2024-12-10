import 'package:flutter/material.dart';

class TimeSheetPage extends StatelessWidget {
  const TimeSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the table
    final List<Map<String, String>> timeSheetData = List.generate(50, (index) {
      final week = 50 - index;
      return {
        'Period': 'Week $week, 2024',
        'DateFrom': (week % 2 == 0) ? '2 Dec 2024' : '25 Nov 2024',
        'DateTo': '8 Dec 2024',
        'Status': 'To Submit',
        'TotalTime': '40.00',
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Sheet'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "My Time Sheet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.red.shade300,
                ),
                columns: const [
                  DataColumn(
                      label: Text('Period',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Date from',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Date to',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Status',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Total time',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: timeSheetData
                    .map(
                      (data) => DataRow(cells: [
                        DataCell(Text(data['Period']!)),
                        DataCell(Text(data['DateFrom']!)),
                        DataCell(Text(data['DateTo']!)),
                        DataCell(Text(data['Status']!)),
                        DataCell(Text(data['TotalTime']!)),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time Sheet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
