import 'package:flutter/material.dart';
import 'package:smart_hostel_app/app_colours.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int selectedDay = 2;

  Widget dayCard(String day, String date, int index) {
    bool isSelected = selectedDay == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDay = index;
        });
      },
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(day,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black)),
            const SizedBox(height: 4),
            Text(date,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Text(value,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget activityTile(String title, String time, String status, IconData icon, Color iconColor) {
    Color color = status == "Verified" ? Colors.green : Colors.grey;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status, style: TextStyle(color: color)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 HEADER WITH BACK BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Attendance Log",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          Text("Hostel Block A • Room 204",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 22,
                    child: Text("JD"),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 MONTH
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("October 2023",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16, color: AppColors.primary),
                      SizedBox(width: 6),
                     
                    ],
                  )
                ],
              ),

              const SizedBox(height: 10),

              // 🔹 DAYS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    dayCard("Mon", "21", 0),
                    const SizedBox(width: 10),
                    dayCard("Tue", "22", 1),
                    const SizedBox(width: 10),
                    dayCard("Wed", "23", 2),
                    const SizedBox(width: 10),
                    dayCard("Thu", "24", 3),
                    const SizedBox(width: 10),
                    dayCard("Fri", "25", 4),
                    const SizedBox(width: 10),
                    dayCard("Sat", "26", 5),
                    const SizedBox(width: 10),
                    dayCard("Sun", "27", 6),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 STATS
              Row(
                children: [
                  statCard("Present", "18/23", Icons.check, Colors.green),
                  const SizedBox(width: 10),
                  statCard("Late In", "02", Icons.access_time, Colors.blue),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 SUMMARY (REPLACED GRAPH)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Present", style: TextStyle(color: Colors.grey)),
                        Text("18",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Absent", style: TextStyle(color: Colors.grey)),
                        Text("5",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Late", style: TextStyle(color: Colors.grey)),
                        Text("2",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 RECENT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Recent Activity",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                 
                ],
              ),

              const SizedBox(height: 10),

              activityTile("Main Gate Entry", "08:42 PM", "Verified", Icons.login, Colors.green),
              activityTile("Library Exit", "05:15 PM", "Verified", Icons.logout, Colors.red),
              activityTile("Mess Hall", "12:30 PM", "Pending", Icons.restaurant, Colors.orange),
              activityTile("Main Gate Exit", "08:10 AM", "Verified", Icons.logout, Colors.red),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}