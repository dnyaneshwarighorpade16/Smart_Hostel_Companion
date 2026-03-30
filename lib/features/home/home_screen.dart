import 'package:flutter/material.dart';
import 'package:smart_hostel_app/features/guest/presentation/guest_entry_screen.dart';
import 'package:smart_hostel_app/features/attendance/attendance_screen.dart';
import 'package:smart_hostel_app/features/doctor/doctor_screen.dart';
import 'package:smart_hostel_app/features/events/events_screen.dart';
import 'package:smart_hostel_app/features/housekeeping/housekeeping_screen.dart';
import 'package:smart_hostel_app/features/issues/issue_screen.dart';
import 'package:smart_hostel_app/features/leave/leave_screen.dart';
import 'package:smart_hostel_app/features/mess/mess_screen.dart';
import 'package:smart_hostel_app/features/outpass/outpass_screen.dart';
import 'package:smart_hostel_app/features/parcel/parcel_screen.dart';
import 'package:smart_hostel_app/features/payment/payment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔽 BOTTOM NAV BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, color: Colors.red),
            label: "Exit",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning,",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Alex Thompson",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      const Icon(Icons.notifications, size: 30),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            "3",
                            style: TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 PROFILE CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Alex Thompson",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text("ID: STU-2024-089"),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.blue),
                            SizedBox(width: 5),
                            Text(
                              "Room B-402",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔴 EMERGENCY SOS
              buildCard(
                color: Colors.red.shade100,
                icon: Icons.help,
                title: "Emergency SOS",
                subtitle: "Immediate assistance & security alert",
              ),

              const SizedBox(height: 15),

              // 🟡 FIRE ALARM
              buildCard(
                color: Colors.yellow.shade100,
                icon: Icons.local_fire_department,
                title: "Fire Alarm",
                subtitle: "Report smoke or fire in the building",
              ),

              const SizedBox(height: 25),

              // 🔹 QUICK ACTIONS TITLE
              const Text(
                "Quick Actions",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // 🔹 GRID (UPDATED)
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [


                  // ✅ CLICKABLE GUEST VISIT
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
                          builder:(context)=> const AttendanceScreen(),
                        ),
                      );
                    },
                    child :const QuickItem(Icons.check_circle, "Attendance"),
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
                          builder:(context)=> const PaymentScreen(),
                        ),
                      );
                    },
                    child :const QuickItem(Icons.payment, "Payments"),
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
        ),
      ),
    );
  }

  // 🔹 CARD WIDGET
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

// 🔹 QUICK ACTION ITEM
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
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}