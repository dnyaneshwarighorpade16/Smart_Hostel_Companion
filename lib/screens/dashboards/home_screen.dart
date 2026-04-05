import 'package:flutter/material.dart';

import 'package:smart_hostel_app/screens/dashboards/guest_entry_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/doctor_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/events_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/housekeeping_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/issue_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/leave_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/mess_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/outpass_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/parcel_screen.dart';
import 'package:smart_hostel_app/screens/dashboards/alerts_screen.dart';

import 'package:smart_hostel_app/screens/dashboards/profile_screen.dart';

import 'package:flutter/services.dart';
import 'package:smart_hostel_app/app_colours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_hostel_app/screens/auth/login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

void _onItemTapped(int index) async {
  if (index == 3) {

    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Logout"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);

     Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (_) => const LoginScreen()),
  (route) => false,
);
    }

  } else {
    setState(() {
      _selectedIndex = index;
    });
  }
}

  @override
  Widget build(BuildContext context) {
   final List<Widget> screens = [
  _homeContent(),        // 0
 ProfileScreen(
  onBack: () {
    setState(() {
      _selectedIndex = 0;
    });
  },
), // 1
  const AlertsScreen(),  // 2
  _homeContent(),        // 3 (dummy for logout)
];

    return Scaffold(
     body: Container(
  color: AppColors.background,
  child: SafeArea(
    child: screens[_selectedIndex],
  ),
),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
    );
  }

  // 🔹 HOME CONTENT
  Widget _homeContent() {
    return SingleChildScrollView( // ✅ removed extra SafeArea
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "Alex Thompson",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Stack(
                  children: [
                    Icon(Icons.notifications, size: 30,color: AppColors.textPrimary),

                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.danger,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "3",
                          style: TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🔹 PROFILE CARD
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150?img=3"),
                  ),
                  const SizedBox(width: 15),

                  // ✅ FIXED OVERFLOW
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alex Thompson",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                              
                        ),
                        SizedBox(height: 5),
                        Text(
                          "ID: STU-2024-089",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          ),
                          ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(width: 5),
                            Text(
                              "Room B-402",
                              style: TextStyle(color: AppColors.secondary),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔴 EMERGENCY SOS
          buildCard(
            color: AppColors.danger.withOpacity(0.1),
            icon: Icons.help,
            title: "Emergency SOS",
            subtitle: "Immediate assistance & security alert",
          ),

          const SizedBox(height: 15),



          const SizedBox(height: 25),

          const Text(
            "Quick Actions",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold,
                color: AppColors.textPrimary),
          ),

          const SizedBox(height: 15),

          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GuestEntryScreen(),
                    ),
                  );
                },
                child: const QuickItem(Icons.group_add, "Guest Visit"),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> const LeaveScreen(),
                    ),
                  );
                },
                child: const QuickItem(Icons.logout, "Leave"), 
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const MessScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.restaurant, "Mess"),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const IssuesScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.warning_amber, "Issues"),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const DoctorScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.medical_services, "Doctor"),
              ),

             

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const EventsScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.event, "Events"),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const HousekeepingScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.cleaning_services, "Housekeeping"),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const OutpassScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.confirmation_number, "Outpass"),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> const ParcelScreen(),
                    ),
                  );
                },
                child :const QuickItem(Icons.local_shipping, "Parcels"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(subtitle,
                    style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}

class QuickItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.cardSoft,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: AppColors.secondary, // ✅ updated
          ),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}