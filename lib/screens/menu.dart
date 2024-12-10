import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        toolbarHeight: 0, // Toolbar disembunyikan
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Bagian Profile
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // Icon Profile
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                // Detail Karyawan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Jane doe",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "IT Support",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()),
                          );
                        },
                        child: const Text(
                          "view profile",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bagian Menu Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 2,
                children: [
                  // Tombol Attendance
                  buildMenuButton(
                    icon: Icons.access_time,
                    label: "Attendance",
                    onTap: () {
                      // Aksi ketika Attendance ditekan
                    },
                  ),
                  // Tombol Project
                  buildMenuButton(
                    icon: Icons.assignment,
                    label: "Project",
                    onTap: () {
                      // Aksi ketika Project ditekan
                    },
                  ),
                  // Tombol Time Sheet
                  buildMenuButton(
                    icon: Icons.calendar_today,
                    label: "Time Sheet",
                    onTap: () {
                      // Aksi ketika Time Sheet ditekan
                    },
                  ),
                  // Tombol Leave
                  buildMenuButton(
                    icon: Icons.cancel,
                    label: "Leave",
                    onTap: () {
                      // Aksi ketika Leave ditekan
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Method untuk Membuat Tombol Menu
  Widget buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.black),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Employee Name:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Job Title:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Department:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Employee ID:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Email:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Phone:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Date of Birth:'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Address:'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit Profile'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'more detail',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
