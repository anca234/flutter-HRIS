/*import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tombol-tombol utama (7 pertama dari halaman utama)
    List<Map<String, dynamic>> mainButtons = [
      {'title': 'Attendance', 'icon': Icons.access_time},
      {'title': 'Leave', 'icon': Icons.logout_outlined},
      {'title': 'Time Sheet', 'icon': Icons.calendar_today},
      {'title': 'Asset', 'icon': Icons.warehouse_rounded},
      {'title': 'SPL', 'icon': Icons.more_time_rounded},
      {'title': 'Claim', 'icon': Icons.store},
      {'title': 'E-Learning', 'icon': Icons.import_contacts_outlined},
    ];

    // Tombol tambahan
    List<Map<String, dynamic>> moreButtons = [
      {'title': 'Performance Evaluate', 'icon': Icons.assessment},
      {'title': 'Claim', 'icon': Icons.receipt_long},
      {'title': 'Dashboard', 'icon': Icons.dashboard},
      {'title': 'Assessment', 'icon': Icons.fact_check},
      {'title': 'Document', 'icon': Icons.folder},
      {'title': 'SPL', 'icon': Icons.more_time_rounded},
      {'title': 'LMS', 'icon': Icons.school},
      {'title': 'Knowledge Management', 'icon': Icons.lightbulb},
      {'title': 'My Data', 'icon': Icons.person},
      {'title': 'Schedule', 'icon': Icons.calendar_month},
      {'title': 'Chat Room', 'icon': Icons.chat},
      {'title': 'Contact', 'icon': Icons.contact_phone},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('More Options'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol Utama
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: mainButtons.length,
                itemBuilder: (context, index) {
                  return _buildOption(
                    context,
                    mainButtons[index]['title'],
                    mainButtons[index]['icon'],
                  );
                },
              ),

              const SizedBox(height: 16),
              const Divider(), // Garis pemisah
              const SizedBox(height: 16),

              // Tombol Tambahan
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: moreButtons.length,
                itemBuilder: (context, index) {
                  return _buildOption(
                    context,
                    moreButtons[index]['title'],
                    moreButtons[index]['icon'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Coming Soon'),
            content: const Text('Fitur ini sedang dalam pengembangan.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Tutup'),
              ),
            ],
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 245, 164, 131),
            child: Icon(icon, color: Colors.white),
            radius: 30,
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
*/