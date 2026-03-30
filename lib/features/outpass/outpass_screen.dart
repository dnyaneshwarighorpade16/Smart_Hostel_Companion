

import 'package:flutter/material.dart';
import '../../core/constants/app_colours.dart';

class OutpassScreen extends StatelessWidget {
  const OutpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 10),
          CircleAvatar(child: Text("AJ")),
          SizedBox(width: 10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "My Gate Passes",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Manage your campus exit & entry logs"),

            const SizedBox(height: 20),

            // 🔹 STATS
            Row(
              children: [
                _statCard("Active Pass", "1"),
                const SizedBox(width: 10),
                _statCard("Total Trips", "24"),
              ],
            ),

            const SizedBox(height: 15),

            // 🔍 SEARCH
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search your history...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Recent Activity",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Filter", style: TextStyle(color: Colors.blue)),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _passCard("04:30 PM", "Pending", "City Central Mall", isOut: true),
                  _passCard("02:15 PM", "06:45 PM", "Public Library"),
                  _passCard("10:00 AM", "01:30 PM", "Medical Clinic"),
                  _passCard("05:10 PM", "08:30 PM", "Grocery Store"),
                  _passCard("09:00 AM", "11:45 AM", "University Campus"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Text(value,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _passCard(String out, String inTime, String place,
      {bool isOut = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("Alex Johnson",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isOut ? Colors.red.shade100 : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isOut ? "Out" : "Returned",
                  style: TextStyle(
                      color: isOut ? Colors.red : Colors.green),
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Out Time\n$out"),
              Text("In Time\n$inTime"),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 4),
              Text(place),
            ],
          )
        ],
      ),
    );
  }
}