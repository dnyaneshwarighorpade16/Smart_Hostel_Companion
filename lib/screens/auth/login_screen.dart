import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_hostel_app/screens/dashboards/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool rememberMe = false;

  void login() async {
  setState(() => isLoading = true);

  await Future.delayed(const Duration(seconds: 1));

  if (emailController.text.trim() == "student@gmail.com" &&
      passwordController.text.trim() == "12345678") {

    final prefs = await SharedPreferences.getInstance();

    if (rememberMe) {
      await prefs.setBool('isLoggedIn', true);   // ✅ SAVE LOGIN
    } else {
      await prefs.setBool('isLoggedIn', false);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );

  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Invalid Email or Password")),
    );
  }

  setState(() => isLoading = false);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // ICON
                Icon(
                  Icons.account_balance,
                  size: 70,
                  color: Colors.indigo[400],
                ),

                const SizedBox(height: 20),

                // TITLE
                Text(
                  "Hostel Companion App",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Login to your account",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                // EMAIL LABEL
                Row(
                  children: [
                    Icon(Icons.email, size: 18, color: Colors.indigo),
                    const SizedBox(width: 6),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    filled: true,
                    fillColor: const Color(0xFFF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // PASSWORD LABEL
                Row(
                  children: [
                    Icon(Icons.lock, size: 18, color: Colors.indigo),
                    const SizedBox(width: 6),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    filled: true,
                    fillColor: const Color(0xFFF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // REMEMBER + FORGOT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() => rememberMe = val!);
                          },
                        ),
                        Text("Remember me",
                            style: GoogleFonts.poppins(fontSize: 13)),
                      ],
                    ),
                    
                  ],
                ),

                const SizedBox(height: 20),

                // LOGIN BUTTON
                GestureDetector(
                  onTap: login,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5A73F0), Color(0xFF7B4FE0)],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white)
                          : Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // SIGN UP OPTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to SignUp Screen
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}