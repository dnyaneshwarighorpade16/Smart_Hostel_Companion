import 'package:flutter/material.dart';
import 'package:smart_hostel_app/app_colours.dart';
import 'package:smart_hostel_app/screens/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onBack;

const ProfileScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🔷 HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, Colors.blueAccent],
                    ),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                  onTap: onBack,
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

                Positioned(
                  bottom: -50,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/150?img=3"),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // 🔹 NAME
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alex Thompson",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "alex.t@university.edu",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 PERSONAL
            _sectionTitle("Personal Information"),
            _infoTile("Full Name", "Alex Robert Thompson", Icons.person),
            _infoTile("Mobile Number", "+91 9876543210", Icons.phone),
            _infoTile("Gender", "Female", Icons.people),
            _infoTile("Address", "Pune, India", Icons.home),
            _infoTile("Blood Group", "O+", Icons.bloodtype),

            const SizedBox(height: 20),

            // 🔹 ACADEMIC
            _sectionTitle("Academic Details"),
            _infoTile("Course Name", "Bachelor of Technology", Icons.school),
            _infoTile("Course Year", "2nd Year", Icons.calendar_today),
            _infoTile("PRN Number", "PRN2021008542", Icons.fingerprint),

            const SizedBox(height: 20),

            // 🔹 FAMILY
            _sectionTitle("Family & Guardians"),
            _infoTile("Father's Name", "Mr. Sharma", Icons.person),
            _infoTile("Father's Contact", "+91 987654301", Icons.phone),
            _infoTile("Mother's Name", "Mrs. Sharma", Icons.person),
            _infoTile("Mother's Contact", "+91 987654302", Icons.phone),
            _infoTile("Local Guardian", "Mr. Local", Icons.security),
            _infoTile("Guardian Contact", "+91 987654303", Icons.phone),

            const SizedBox(height: 20),

            // 🔹 SETTINGS (WITH ARROWS)
            _sectionTitle("Account Settings"),
            _settingsTile(Icons.notifications, "Notifications", "Manage alerts"),
            _settingsTile(Icons.lock, "Privacy & Security", "Password & biometrics"),

            const SizedBox(height: 25),

            // 🔴 LOGOUT
           GestureDetector(
  onTap: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  },
  child: Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(14),
    ),
    child: const Center(
      child: Text(
        "Sign Out",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ),
  ),
),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🔹 SECTION TITLE
  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 🔹 INFO TILE (NO ARROW, VALUE BELOW)
  static Widget _infoTile(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 5),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 SETTINGS TILE (WITH ARROW)
  static Widget _settingsTile(
      IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
}