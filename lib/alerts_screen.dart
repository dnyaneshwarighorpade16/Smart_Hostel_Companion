import 'package:flutter/material.dart';
import '../app_colours.dart';


class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // dark UI like image
      body: SafeArea(
        child: Column(
          children: [

            // 🔹 HEADER
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hostel Alerts",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 5),
                      Text("Official updates from the Warden",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications,
                        color: Colors.blue),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),

            

            const SizedBox(height: 15),

            // 🔹 ALERT LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [

                  AlertCard(
                    isUrgent: true,
                    title: "Water Supply Interruption",
                    desc:
                        "Water supply will be unavailable from 2:00 PM to 5:00 PM today.",
                    time: "10 mins ago",
                  ),

                  AlertCard(
                    isUrgent: false,
                    title: "New Curfew Timings",
                    desc:
                        "Main gate will close at 10:30 PM instead of 11:00 PM.",
                    time: "2 hours ago",
                  ),

                  AlertCard(
                    isUrgent: false,
                    title: "Hostel Night Celebration",
                    desc:
                        "Annual hostel night on Friday. Attendance is mandatory.",
                    time: "Yesterday",
                  ),

                  AlertCard(
                    isUrgent: true,
                    title: "Fire Drill Notice",
                    desc:
                        "Mandatory fire drill tomorrow at 11:00 AM.",
                    time: "2 days ago",
                  ),

                  AlertCard(
                    isUrgent: false,
                    title: "Laundry Room Update",
                    desc:
                        "Machine No. 4 is repaired and available.",
                    time: "3 days ago",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🔹 CHIP
  static Widget _chip(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.grey.shade900,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

// 🔴 ALERT CARD
class AlertCard extends StatelessWidget {
  final bool isUrgent;
  final String title;
  final String desc;
  final String time;

  const AlertCard({
    super.key,
    required this.isUrgent,
    required this.title,
    required this.desc,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 TAG + TIME
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isUrgent ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isUrgent ? "Urgent" : "Notice",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 10),

          Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),

          const SizedBox(height: 8),

          Text(desc,
              style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Text("W", style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(width: 8),
                  Text("Warden Office",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}