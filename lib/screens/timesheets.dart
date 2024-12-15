import 'package:flutter/material.dart';

class TimeSheetPage extends StatelessWidget {
  const TimeSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Time Sheet",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Save, Discard, Submit
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text("Discard",
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Submit",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Informasi Karyawan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.grey.shade300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Employee",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Employee Name Displayed Here",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    buildInfoRow("Start Date", "25 Nov 2024"),
                    buildInfoRow("End Date", "1 Dec 2025"),
                    buildInfoRow("Unit", "Human Capital and General Services"),
                    buildInfoRow("Company", "PT Abhimata Persada"),
                    buildInfoRow("First Approver", "First Approver Name"),
                    buildInfoRow("Second Approver", "Second Approver Name"),
                  ],
                ),
              ),
            ),

            // Detail Tabel
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Detail",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            buildDetailTable(),

            // Add New Line
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "add new line",
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk Baris Informasi
  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
              width: 120,
              child: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          const Text(":"),
          const SizedBox(width: 10),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  // Fungsi untuk Tabel Detail
  Widget buildDetailTable() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(color: Colors.black26),
        columnWidths: const {
          0: FixedColumnWidth(80),
          1: FixedColumnWidth(120),
          2: FixedColumnWidth(120),
          3: FlexColumnWidth(),
        },
        children: [
          buildTableRow(["Date", "Project", "Task", "Description"],
              isHeader: true),
          buildTableRow(["25 Nov", "Project Name", "Task Name", ""]),
          buildTableRow(["25 Nov", "Project Name", "Task Name", ""]),
          buildTableRow(["25 Nov", "Project Name", "Task Name", ""]),
          buildTableRow(["25 Nov", "Project Name", "Task Name", ""]),
          buildTableRow(["25 Nov", "Project Name", "Task Name", ""]),
        ],
      ),
    );
  }

  // Fungsi untuk Baris Tabel
  TableRow buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration:
          BoxDecoration(color: isHeader ? Colors.black87 : Colors.white),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.white : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}
