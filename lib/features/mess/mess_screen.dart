import 'package:flutter/material.dart';
import 'package:smart_hostel_app/core/constants/app_colours.dart';

class MessScreen extends StatefulWidget {
  const MessScreen({super.key});

  @override
  State<MessScreen> createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  int selectedDay = 1;

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

  Widget vendorCard(String name, String place) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 20),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(place, style: const TextStyle(color: Colors.grey)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget mealCard({
    required String title,
    required String time,
    required String menu,
    required String provider,
    required double rating,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.restaurant),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          Text(menu),
          const SizedBox(height: 8),
          const Divider(),
          Row(
            children: [
              const CircleAvatar(radius: 16),
              const SizedBox(width: 8),
              Text(provider),
              const SizedBox(width: 6),
              const Icon(Icons.star, size: 14, color: Colors.amber),
              Text(rating.toString()),
              const Spacer(),
              const Text("Feedback",
                  style: TextStyle(color: AppColors.primary)),
            ],
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
                      Text("Mess Menu",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("Central Hostel Dining Hall",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 DAYS
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

              // 🔹 VENDORS
              const Text("On Duty Today",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  vendorCard("Elite Catering", "Main Kitchen"),
                  const SizedBox(width: 10),
                  vendorCard("Spice Route", "South Wing"),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 MENU TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Tuesday Menu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Chip(label: Text("Veg Only")),
                ],
              ),

              const SizedBox(height: 10),

              // 🔹 MEALS
              mealCard(
                title: "Breakfast",
                time: "07:30 – 09:30 AM",
                menu:
                    "Masala Dosa, Sambhar, Coconut Chutney, Boiled Eggs, Seasonal Fruits\nSpecial: Filter Coffee",
                provider: "Elite Catering",
                rating: 4.8,
              ),
              mealCard(
                title: "Lunch",
                time: "12:30 – 02:30 PM",
                menu:
                    "Paneer Butter Masala, Dal Tadka, Jeera Rice, Butter Naan, Fresh Salad",
                provider: "Spice Route",
                rating: 4.5,
              ),
              mealCard(
                title: "Dinner",
                time: "07:30 – 09:30 PM",
                menu:
                    "Veg Pulao, Mix Veg Curry, Roti, Curd, Gulab Jamun\nSpecial: Gulab Jamun",
                provider: "Elite Catering",
                rating: 4.8,
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // 🔹 BOTTOM BAR
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            Expanded(
              child: Text(
                "Going for Dinner?\nMark your attendance to avoid wastage",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Chip(label: Text("Nutrients")),
          ],
        ),
      ),
    );
  }
}