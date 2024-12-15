import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Page"),
      ),
      body: const Center(
        child: Text("Ini adalah halaman Attendance."),
      ),
    );
  }
}
