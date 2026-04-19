import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Color primaryTeal = const Color(0xFF005A80);
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: width > 500 ? 450 : width * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25), // Padding kam ki hai
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create Account!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF003F5C))),
                const SizedBox(height: 20),
                _buildField("User Name"),
                _buildField("Email Address"),
                _buildField("Enter Password", isPass: true),
                _buildField("Enter Confirm Password", isPass: true),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: rememberMe, activeColor: const Color(0xFF0d9488), onChanged: (v) => setState(() => rememberMe = v!)),
                        const Text("Remember me", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    TextButton(onPressed: () {}, child: Text("Forgot Password?", style: TextStyle(color: primaryTeal, fontSize: 12))),
                  ],
                ),

                const SizedBox(height: 15),

                // 🔥 LOG IN BUTTON - Ab lazmi dikhega
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryTeal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      elevation: 0,
                    ),
                    child: const Text("Log In", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),

                const SizedBox(height: 20),
                const Center(child: Text("OR", style: TextStyle(color: Colors.grey, fontSize: 12))),
                const SizedBox(height: 20),

                _socialBtn("Continue With Google", "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png"),
                const SizedBox(height: 10),
                _socialBtn("Continue With Facebook", "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1200px-Facebook_Logo_%282019%29.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String hint, {bool isPass = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        obscureText: isPass,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryTeal)),
        ),
      ),
    );
  }

  Widget _socialBtn(String text, String url) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black12)),
        child: Row(
          children: [
            Image.network(url, height: 18),
            const SizedBox(width: 20),
            Text(text, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}