import 'package:flutter/material.dart';
import '../../core/constants/app_colours.dart';

class ParcelScreen extends StatelessWidget {
  const ParcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text("Hostel Parcel Hub",
            style: TextStyle(color: Colors.black)),
        actions: const [
          Icon(Icons.info_outline, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 👤 USER CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  CircleAvatar(child: Text("JD")),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("John Doe",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Room 402 • Block B"),
                      Text("Student ID: 2024-HSTL-089",
                          style: TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📦 STATUS CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Current Status"),
                  SizedBox(height: 5),
                  Text("Awaiting Collection",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),

                  Text("Received at Reception"),
                  Text("Oct 24, 10:15 AM"),

                  SizedBox(height: 10),
                  Text("Verified at Reception"),
                  Text("Oct 24, 10:15 AM"),

                  SizedBox(height: 10),
                  Text("Arrived at Hostel Gate"),
                  Text("Oct 24, 09:45 AM"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hostel Records",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("History", style: TextStyle(color: Colors.blue)),
              ],
            ),

            const SizedBox(height: 10),

            _parcelItem("TRK-9021", "Package from Home", "Collected Oct 20"),
            _parcelItem("TRK-4412", "University Bookstore", "Collected Oct 15"),

            const SizedBox(height: 30),

            const Center(
              child: Column(
                children: [
                  Icon(Icons.help_outline),
                  SizedBox(height: 10),
                  Text("Issue with your parcel?"),
                  Text("Visit the Warden's office for disputes",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _parcelItem(String id, String title, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.inventory)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(id, style: const TextStyle(color: Colors.blue)),
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(status, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}