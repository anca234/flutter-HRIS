import 'package:flutter/material.dart';
import 'attendance_page.dart';
import 'timesheets.dart';
import 'leave.dart';
import 'timesheets.dart';
import 'asset.dart';
//import 'more.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? clockInTime;
  DateTime? clockOutTime;
  String totalWorkingTime = "--:--:-- hours";

  bool isClockedIn = false;

  void handleClockInOut() {
    setState(() {
      if (!isClockedIn) {
        clockInTime = DateTime.now();
        isClockedIn = true;
      } else {
        clockOutTime = DateTime.now();
        isClockedIn = false;

        if (clockInTime != null && clockOutTime != null) {
          final difference = clockOutTime!.difference(clockInTime!);
          final hours = difference.inHours;
          final minutes = difference.inMinutes.remainder(60);
          final seconds = difference.inSeconds.remainder(60);
          totalWorkingTime =
              "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')} hours";
        }
      }
    });
  }

  void showComingSoonPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Coming Soon"),
        content: const Text("Fitur ini sedang dalam pengembangan."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }

  void showMoreOptions(BuildContext context) {
    List<Map<String, dynamic>> moreOptions = [
      {'title': 'Performance Evaluate', 'icon': Icons.assessment_outlined},
      {'title': 'Claim', 'icon': Icons.store},
      {'title': 'Dashboard', 'icon': Icons.dashboard},
      {'title': 'Assessment', 'icon': Icons.assignment},
      {'title': 'Document', 'icon': Icons.folder},
      {'title': 'SPL', 'icon': Icons.more_time},
      {'title': 'LMS', 'icon': Icons.school},
      {'title': 'Knowledge Management', 'icon': Icons.import_contacts},
      {'title': 'My Data', 'icon': Icons.person},
      {'title': 'Schedule', 'icon': Icons.calendar_today},
      {'title': 'Chat Room', 'icon': Icons.chat},
      {'title': 'Contact', 'icon': Icons.contacts},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "More Options",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemCount: moreOptions.length,
                itemBuilder: (ctx, index) {
                  final option = moreOptions[index];
                  return GestureDetector(
                    onTap: () {
                      showComingSoonPopup(context);
                      //Navigator.of(ctx).pop(); // Menutup modal setelah klik
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 245, 164, 131),
                          child: Icon(option['icon'], color: Colors.white),
                          radius: 30,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          option['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                          maxLines: 2, // Batasi maksimal 2 baris
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(BuildContext context, int index) {
    List<String> titles = [
      'Attendance',
      'Leave',
      'Time Sheet',
      'Asset',
      'SPL',
      'Claim',
      'E-Learning',
      'More'
    ];
    List<IconData> icons = [
      Icons.access_time,
      Icons.logout_outlined,
      Icons.calendar_today,
      Icons.warehouse_rounded,
      Icons.more_time_rounded,
      Icons.store,
      Icons.import_contacts_outlined,
      Icons.grid_view,
    ];

    void navigateToPage() {
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AttendancePage()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LeavePage()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TimeSheetPage()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AssetPage()),
        );
      } else if (index == 7) {
        // Tombol "More" menggunakan modal bottom sheet
        showMoreOptions(context);
      } else {
        // Tampilkan pop-up "Coming Soon" untuk tombol lain
        showComingSoonPopup(context);
      }
    }

    return GestureDetector(
      onTap: navigateToPage, // Tambahkan aksi navigasi
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 245, 164, 131),
            child: Icon(
              icons[index],
              size: 28,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            radius: 30,
          ),
          const SizedBox(height: 6),
          Flexible(
            child: Text(
              titles[index],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Jane Doe",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "IT Support",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/logoptap.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),

            // Clock In Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isClockedIn ? Colors.black : Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(60),
                ),
                onPressed: handleClockInOut,
                child: Text(
                  isClockedIn ? "Clock Out" : "Clock In",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),

            // Total Working Hour Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.work, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Total working hour",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      totalWorkingTime,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Clock in: ${clockInTime != null ? "${clockInTime!.hour.toString().padLeft(2, '0')}:${clockInTime!.minute.toString().padLeft(2, '0')}:${clockInTime!.second.toString().padLeft(2, '0')}" : '--:--:--'}",
                        ),
                        Text(
                          "Clock out: ${clockOutTime != null ? "${clockOutTime!.hour.toString().padLeft(2, '0')}:${clockOutTime!.minute.toString().padLeft(2, '0')}:${clockOutTime!.second.toString().padLeft(2, '0')}" : '--:--:--'}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Options Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _buildOption(context, index);
                },
              ),
            ),

            // Next Activity Section
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            NextActivityWidget(),

            // More Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "More",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceRecord {
  final DateTime clockIn;
  final DateTime clockOut;
  final Duration workingDuration;

  AttendanceRecord({
    required this.clockIn,
    required this.clockOut,
    required this.workingDuration,
  });
}

class NextActivityWidget extends StatefulWidget {
  const NextActivityWidget({Key? key}) : super(key: key);

  @override
  _NextActivityWidgetState createState() => _NextActivityWidgetState();
}

class _NextActivityWidgetState extends State<NextActivityWidget> {
  final List<Map<String, dynamic>> activities = [
    {
      "title": "Project Name 1",
      "subtitle": "Project leader\nPlanned squad name1, Planned squad name2",
      "isDone": false,
    },
    {
      "title": "Project Name 2",
      "subtitle": "Project leader\nPlanned squad name3, Planned squad name4",
      "isDone": false,
    },
    {
      "title": "Project Name 3",
      "subtitle": "Project leader\nPlanned squad name5, Planned squad name6",
      "isDone": false,
    },
  ];

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header dengan arrow dropdown
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Next activity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),

        // List proyek
        if (isExpanded)
          ...activities.map((activity) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: activity["isDone"],
                    onChanged: (bool? value) {
                      setState(() {
                        activity["isDone"] = value!;
                      });
                    },
                  ),
                  title: Text(
                    activity["title"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(activity["subtitle"]),
                  trailing: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: activity["isDone"] ? Colors.green : Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      activity["isDone"] ? "Done" : "Planned",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
      ],
    );
  }
}
