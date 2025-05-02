import 'package:flutter/material.dart';
import 'package:work_bee/core/theme/app_helper.dart';
import '../../core/utils/validator.dart';
import '../sign_page/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/login_intro.png",
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Welcome Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 20),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            hintStyle: Theme.of(context).textTheme.titleMedium,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                          ),
                          validator: Validators.validateEmail,
                        ),
                        const SizedBox(height: 16),

                        // Password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: Theme.of(context).textTheme.titleMedium,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ),
                          validator: Validators.validatePassword,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Forgot password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login
                        }

                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member? "),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Register now",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
