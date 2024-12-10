import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'Attendance Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
