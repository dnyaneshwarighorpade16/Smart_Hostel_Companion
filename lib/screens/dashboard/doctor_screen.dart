import 'package:flutter/material.dart';
import '../app_colours.dart';
class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int selectedDay = 1;
  int selectedSlot = 1;

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

  Widget slotChip(String time, int index) {
    bool isSelected = selectedSlot == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSlot = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget consultationTile(String title, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.medical_services),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Text("Completed",
              style: TextStyle(color: Colors.green)),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget chip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Doctor Visit",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 PROFILE
          

            const SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dayCard("Mon", "23", 0),
                  const SizedBox(width: 10),
                  dayCard("Tue", "24", 1),
                  const SizedBox(width: 10),
                  dayCard("Wed", "25", 2),
                  const SizedBox(width: 10),
                  dayCard("Thu", "26", 3),
                  const SizedBox(width: 10),
                  dayCard("Fri", "27", 4),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 SLOTS
            const Text("Available Slots for Oct 24"),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [
                slotChip("09:00 AM", 0),
                slotChip("10:30 AM", 1),
                slotChip("02:00 PM", 2),
                slotChip("04:30 PM", 3),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 PAST CONSULTATIONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Your Past Consultations",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            
              ],
            ),

            const SizedBox(height: 10),

            consultationTile("General Checkup", "Sep 12, 2023"),
            consultationTile("Prescription Renewal", "Aug 05, 2023"),
            consultationTile("Lab Results Review", "July 20, 2023"),

            const SizedBox(height: 30),
          ],
        ),
      ),

      // 🔹 BOTTOM BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {},
            child: const Text("Book Appointment",
                style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}