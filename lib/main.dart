import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ✅ ADD THIS
import 'firebase_options.dart';
import 'package:smart_hostel_app/screens/auth/auth_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 🔴 TEMP RESET
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  runApp(const SmartHostelApp());
}

class SmartHostelApp extends StatelessWidget {
  const SmartHostelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   home: const AuthCheck(),
    );
  }
}