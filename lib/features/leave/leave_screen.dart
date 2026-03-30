import 'package:flutter/material.dart';
import 'package:smart_hostel_app/core/constants/app_colours.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  bool isChecked = false;

  Widget buildTextField({
    required String hint,
    IconData? icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget buildDateField(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(Icons.calendar_today, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          "Leave Application",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Reason
            const Text(
              "Reason for Leave",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            buildTextField(hint: "Enter reason for your leave..."),

            const SizedBox(height: 20),

            // 🔹 Dates
            const Row(
              children: [
                Expanded(child: Text("From Date")),
                SizedBox(width: 12),
                Expanded(child: Text("To Date")),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                buildDateField("24 Oct, 2023"),
                const SizedBox(width: 12),
                buildDateField("27 Oct, 2023"),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Address
            const Text(
              "Destination Address",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            buildTextField(
              hint: "Full address where you will be staying...",
              icon: Icons.location_on_outlined,
            ),

            const SizedBox(height: 20),

            // 🔹 Explanation
            const Text(
              "Detailed Explanation",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            buildTextField(
              hint: "Please provide more details about your leave...",
              maxLines: 4,
            ),

            const SizedBox(height: 20),

            // 🔹 Emergency Contact
            const Text(
              "Emergency Contact during Leave",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            buildTextField(
              hint: "Parent/Guardian Phone Number",
              icon: Icons.phone_outlined,
            ),

            const SizedBox(height: 20),

            // 🔹 Checkbox
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "I hereby declare that I have informed my parents about this leave application.",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Submit Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.send),
                    SizedBox(width: 8),
                    Text(
                      "Submit Application",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Cancel
            const Center(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Applications must be submitted at least 24 hours in advance for weekend leaves. Emergency leaves are processed immediately.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}