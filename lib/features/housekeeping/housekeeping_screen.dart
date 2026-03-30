import 'package:flutter/material.dart';
import '../../core/constants/app_colours.dart';

class HousekeepingScreen extends StatefulWidget {
  const HousekeepingScreen({super.key});

  @override
  State<HousekeepingScreen> createState() => _HousekeepingScreenState();
}

class _HousekeepingScreenState extends State<HousekeepingScreen> {
  int selectedRating = 4;
  String urgency = "Normal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Housekeeping",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.cleaning_services, color: Colors.blue),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 SCHEDULE HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cleaning Schedule",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("✔ Week 42", style: TextStyle(color: Colors.white)),
                )
              ],
            ),

            const SizedBox(height: 15),

            // 📅 SCHEDULE GRID
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _dayCard("MON", "09:00", "Rooms 1-10"),
                  _dayCard("TUE", "10:30", "Rooms 11-20", selected: true),
                  _dayCard("WED", "09:00", "Common Area"),
                  _dayCard("THU", "14:00", "Rooms 21-30"),
                  _dayCard("FRI", "11:00", "Bathrooms"),
                  _dayCard("SAT", "10:00", "Deep Clean"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ⭐ RATING
            const Text("Rate Last Service",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() => selectedRating = index + 1);
                        },
                        icon: Icon(
                          index < selectedRating ? Icons.star : Icons.star_border,
                          size: 30,
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "How was the cleaning quality?",
                      filled: true,
                      fillColor: AppColors.lightGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Submit Rating",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🧹 REQUEST CLEANING
            const Text("Request Cleaning",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

            const SizedBox(height: 15),

            _input("Reason for Request", "e.g., Water spill, Trash pickup..."),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(child: _input("Preferred Date", "25 Oct, 2023")),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: urgency,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: ["Low", "Normal", "High"]
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) {
                        setState(() => urgency = val!);
                      },
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 15),

            _input("Room Number", "Your room number"),

            const SizedBox(height: 20),

            // 🔵 SUBMIT BUTTON
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Text(
                  "Submit Request",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Center(
              child: Text("View History", style: TextStyle(color: Colors.grey)),
            ),

            const SizedBox(height: 20),

            // 🔵 INFO BOX
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.blue),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Regular housekeeping happens once a week per room. For emergency spills, please use the 'High' urgency tag.",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🔹 INPUT FIELD
  Widget _input(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.lightGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // 🔹 DAY CARD
  Widget _dayCard(String day, String time, String task, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(time,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.black)),
          const SizedBox(height: 5),
          Text(task,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11,
                  color: selected ? Colors.white70 : Colors.grey)),
        ],
      ),
    );
  }
}