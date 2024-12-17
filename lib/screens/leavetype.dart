import 'package:flutter/material.dart';

class UnplannedLeaveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unplanned Leave Form',
      theme: ThemeData(primarySwatch: Colors.red),
      home: UnplannedLeaveScreen(),
    );
  }
}

class UnplannedLeaveScreen extends StatefulWidget {
  const UnplannedLeaveScreen({Key? key}) : super(key: key);
  @override
  _UnplannedLeaveScreenState createState() => _UnplannedLeaveScreenState();
}

class _UnplannedLeaveScreenState extends State<UnplannedLeaveScreen> {
  String? typeOfLeave;
  DateTime? fromDate;
  DateTime? toDate;
  bool isHalfDay = false;
  String halfDayOption = 'Morning';
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController projectController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    DateTime initialDate =
        isFrom ? DateTime.now() : (fromDate ?? DateTime.now());
    DateTime firstDate = isFrom ? DateTime.now() : (fromDate ?? DateTime.now());
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? initialDate : toDate ?? initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          toDate = null; // Reset "To" date when "From" is changed
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unplanned Leave Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type of Leave Dropdown
            Text('Type of leave',
                style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: typeOfLeave,
              hint: Text('Choose here'),
              isExpanded: true,
              items: ['Sick Leave', 'Emergency Leave', 'Other']
                  .map((leave) => DropdownMenuItem(
                        value: leave,
                        child: Text(leave),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  typeOfLeave = value;
                });
              },
            ),
            SizedBox(height: 16),
            // From and To Date Picker
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('From',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () => _selectDate(context, true),
                        child: Text(fromDate == null
                            ? 'Choose the date'
                            : '${fromDate!.toLocal()}'.split(' ')[0]),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('To', style: TextStyle(fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: fromDate != null
                            ? () => _selectDate(context, false)
                            : null,
                        child: Text(toDate == null
                            ? 'Choose the date'
                            : '${toDate!.toLocal()}'.split(' ')[0]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Half-day Checkbox and Option
            Row(
              children: [
                Checkbox(
                  value: isHalfDay,
                  onChanged: (value) {
                    setState(() {
                      isHalfDay = value ?? false;
                    });
                  },
                ),
                Text('Half-day'),
                SizedBox(width: 10),
                if (isHalfDay)
                  DropdownButton<String>(
                    value: halfDayOption,
                    items: ['Morning', 'Afternoon']
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        halfDayOption = value!;
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 16),
            // Reason Input
            Text('Reason', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: reasonController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your reason here',
              ),
            ),
            SizedBox(height: 16),
            // Project Input
            Text('Project', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: projectController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add project here',
              ),
            ),
            SizedBox(height: 24),
            // Submit Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.red),
                onPressed: () {
                  // Add form submission logic
                  print('Form Submitted');
                },
                child: Text('Submit',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
