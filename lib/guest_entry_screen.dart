import 'package:flutter/material.dart';

class GuestEntryScreen extends StatelessWidget {
  const GuestEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  const Text(
                    "Guest Entry",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.history),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 SECTION TITLE
              sectionTitle("Student Information"),

              const SizedBox(height: 10),

              // 🔹 STUDENT CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/150?img=3"),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Alex Thompson",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("ID: STU-2024-089"),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.blue, size: 16),
                            SizedBox(width: 5),
                            Text("Room B-402",
                                style: TextStyle(color: Colors.blue)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 VISITOR DETAILS
              sectionTitle("Visitor Details"),

              const SizedBox(height: 10),

              buildField("Guest Full Name", "Enter guest name",
                  icon: Icons.person),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: buildField("Relationship", "e.g. Father",
                        icon: Icons.group),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildField("Phone Number", "0123456789",
                        icon: Icons.phone),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              buildField("Home Address", "Enter permanent address",
                  icon: Icons.home),

              const SizedBox(height: 20),

              // 🔹 VISIT LOGISTICS
              sectionTitle("Visit Logistics"),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: buildTimeField("In-Time", "10:30 AM"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildTimeField("Expected Out-Time", "06:00 PM"),
                  ),
                ],
              ),

    

              const SizedBox(height: 25),

              // 🔵 BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.login),
                  label: const Text(
                    "Register Guest Entry",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 NOTE
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "By submitting, you agree that the guest will follow hostel safety protocols and the student remains responsible for their conduct.",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 SECTION TITLE
  Widget sectionTitle(String text) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Text(text,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // 🔹 INPUT FIELD
  Widget buildField(String label, String hint,
      {required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextField(
          decoration: inputDecoration(hint, icon: icon),
        ),
      ],
    );
  }

  // 🔹 TIME FIELD
  Widget buildTimeField(String label, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextField(
          readOnly: true,
          decoration: inputDecoration(time, icon: Icons.access_time),
        ),
      ],
    );
  }

  // 🔹 COMMON INPUT DECORATION
  InputDecoration inputDecoration(String hint,
      {IconData? icon}) {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon) : null,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }
}