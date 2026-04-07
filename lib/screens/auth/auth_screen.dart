import 'package:flutter/material.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool obscure1 = true;
  bool obscure2 = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC9C6DB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/icon.png', width: 280)),

              // TITLE
              Text(
                isLogin ? "Welcome Back" : "Create Account",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                isLogin
                    ? "Fill out the information below in order to access your account."
                    : "Let's get started by filling out the form below.",
              ),

              const SizedBox(height: 30),

              // EMAIL
              _input("Email", false, false),

              const SizedBox(height: 15),

              // PASSWORD
              _input("Password", true, false),

              const SizedBox(height: 15),

              // CONFIRM PASSWORD
              if (!isLogin) _input("Confirm password", true, true),

              const SizedBox(height: 25),

            
              // BUTTON
              GestureDetector(
                onTap: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email == "1" && password == "2") {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid credentials")),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      isLogin ? "Login" : "Sign up",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              // GOOGLE BUTTON
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(child: Text("Continue with Google")),
              ),

              const Spacer(),

              // TOGGLE
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isLogin = false);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: !isLogin ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("Create Account")),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isLogin = true);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isLogin ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("Log In")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(String hint, bool isPass, bool isConfirm) {
    return TextField(
      controller: hint == "Email"
          ? emailController
          : hint == "Password"
          ? passwordController
          : null,
      obscureText: isPass ? (isConfirm ? obscure2 : obscure1) : false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: isPass
            ? IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    if (isConfirm) {
                      obscure2 = !obscure2;
                    } else {
                      obscure1 = !obscure1;
                    }
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
