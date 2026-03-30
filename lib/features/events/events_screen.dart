import 'package:flutter/material.dart';
import 'package:smart_hostel_app/core/constants/app_colours.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  Widget filterChip(String text, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.lightGrey : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(text),
    );
  }

  Widget eventCard({
    required String title,
    required String time,
    required String desc,
    required String status,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE PLACEHOLDER
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: status == "Upcoming"
                            ? Colors.green.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                            color: status == "Upcoming"
                                ? Colors.green
                                : Colors.grey),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 6),
                    Text(time),
                  ],
                ),
                const SizedBox(height: 8),
                Text(desc),
                const SizedBox(height: 10),
                const Text("View Details",
                    style: TextStyle(color: AppColors.primary)),
              ],
            ),
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
              // 🔹 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hostel Events",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("Meet your fellow residents",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.search),
                ],
              ),

              const SizedBox(height: 16),

              // 🔹 FILTERS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    filterChip("All Events", selected: true),
                    const SizedBox(width: 8),
                    filterChip("Upcoming"),
                    const SizedBox(width: 8),
                    filterChip("Social"),
                    const SizedBox(width: 8),
                    filterChip("Workshop"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 UPCOMING
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Upcoming Highlights",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All",
                      style: TextStyle(color: AppColors.primary)),
                ],
              ),

              const SizedBox(height: 12),

              eventCard(
                title: "Rooftop BBQ Night",
                time: "7:00 PM - 10:00 PM",
                desc:
                    "Join us for our monthly rooftop BBQ! Free burgers, music, and sunset views.",
                status: "Upcoming",
                date: "OCT 28",
              ),

              eventCard(
                title: "Yoga & Mindfulness",
                time: "8:00 AM - 9:30 AM",
                desc:
                    "Start your morning with guided yoga session. All levels welcome.",
                status: "Upcoming",
                date: "NOV 02",
              ),

              const SizedBox(height: 20),

              // 🔹 PAST
              const Text("Past Memories",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 12),

              eventCard(
                title: "Karaoke Madness",
                time: "9:00 PM",
                desc:
                    "A night of singing and great vibes. Check out gallery photos!",
                status: "Past",
                date: "SEP 15",
              ),

              eventCard(
                title: "City Walking Tour",
                time: "10:00 AM",
                desc:
                    "Explored hidden gems of the city and enjoyed street food.",
                status: "Past",
                date: "SEP 05",
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // 🔹 FLOATING BUTTON
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("Suggest Event"),
      ),
    );
  }
}