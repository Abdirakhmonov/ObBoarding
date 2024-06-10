import 'package:flutter/material.dart';
import 'package:lesson_54/views/screens/registr_page.dart';
import 'package:lesson_54/views/widgets/bottom_icons.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool obscureTextChange = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _submitForm() {
    bool isValidate = _formKey.currentState?.validate() ?? false;
    if (isValidate) {
      print("Validate");
    } else {
      print("Not Valid");
    }
  }

  void changeObscureText() {
    setState(() {
      obscureTextChange = !obscureTextChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0XFF1F41BB),
                        fontWeight: FontWeight.w800,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome back you've been missed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  TextFormField(
                    validator: _validateEmail,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0XFFF1F4FF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xff1F41BB))),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: _validatePassword,
                    obscureText: obscureTextChange,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: changeObscureText,
                        icon: obscureTextChange
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      filled: true,
                      fillColor: const Color(0XFFF1F4FF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xff1F41BB))),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: _submitForm,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff1F41BB)),
                      child: const Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    child: const Text(
                      "Create new account",
                      style: TextStyle(
                          color: Color(0XFF494949),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const BottomIcons()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
