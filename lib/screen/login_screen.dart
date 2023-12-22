import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/add_utils.dart';
import 'package:flutter_authentication_ui/screen/registration_screen.dart';
import 'package:flutter_authentication_ui/widget/input_field_widget.dart';
import 'package:flutter_authentication_ui/widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 20,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 1.5,
                      ),
                      Container(
                        width: 20,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "JOT",
                    style: TextStyle(
                        color: colorWhite,
                        fontFamily: fontFamily,
                        fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Welcome back...!",
                style: TextStyle(
                    color: colorWhite,
                    fontFamily: fontFamily,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Please, enter your details below",
                style: TextStyle(
                  color: colorWhite,
                  fontFamily: fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              InputField(
                controller: emailController,
                hintText: "Enter your email",
                icon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                controller: passwordController,
                hintText: "Enter your password",
                icon: Icons.password,
                obscureText: true,
              ),
              const SizedBox(
                height: 70,
              ),
              PrimaryButton(
                  text: "Sign In",
                  onPressed: () {
                    if (isValidate()) {}
                  }),
              const SizedBox(
                height: 25,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Already have an account!",
                  style: TextStyle(
                    color: colorWhite,
                    fontFamily: fontFamily,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: colorWhite,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidate() {
    if (emailController.text.isEmpty) {
      showScaffold(context, "Please, enter your email");
      return false;
    }
    if (passwordController.text.isEmpty) {
      showScaffold(context, "Please, enter your password");
      return false;
    }
    return true;
  }
}
