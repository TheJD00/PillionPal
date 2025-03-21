// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pillionpal/Screens/RoleSelectionPage.dart';
import 'package:pillionpal/Screens/SignUpScreen.dart';
import '../widgets/InputFields.dart';
import '../widgets/PrimaryButton.dart';
import '../widgets/CustomButtons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false; // 🔥 Password visibility state

  void _signIn() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields are required"),
          backgroundColor: Color.fromRGBO(0, 137, 85, 1),
        ),
      );
      return;
    }

    if (email == "Admin@gmail.com" && password == "admin123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RoleSelectionPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _sendPasswordReset() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password Reset Link Sent to your Email"),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Title
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 137, 85, 1),
                ),
              ),
              const SizedBox(height: 30),

              // Email Input using InputFields.dart ✅
              InputFields.buildTextField(
                hint: "Enter your email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                context: context
              ),
              const SizedBox(height: 16),

              // Password Input using InputFields.dart ✅
              InputFields.buildTextField(
                hint: "Enter your password",
                controller: passwordController,
                context: context,
                isPassword: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _sendPasswordReset,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromRGBO(0, 137, 85, 1)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sign In Button
              PrimaryButton(text: "Sign In", onPressed: _signIn),
              const SizedBox(height: 20),

              // OR Divider
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),

              // Google Sign-in Button
              CustomButtons.buildOutlinedButton(
                text: "Sign in with Gmail",
                icon: FontAwesomeIcons.google,
                onPressed: () {
                  // TODO: Implement Google Sign-In
                },
              ),
              const SizedBox(height: 10),

              // Apple Sign-in Button
              CustomButtons.buildOutlinedButton(
                text: "Sign in with Apple",
                icon: Icons.apple,
                onPressed: () {
                   // TODO: Implement Apple Sign-In
                },
              ),
              const SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Color.fromRGBO(0, 137, 85, 1)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
