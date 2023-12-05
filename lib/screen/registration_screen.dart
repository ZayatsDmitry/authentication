import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/add_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Jack",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Monsterrat",
                  fontSize: 28,
                  color: colorWhite,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: Text(
                "of all trades",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Monsterrat",
                  fontSize: 28,
                  color: colorWhite,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Center(
              child: Text(
                "Please, enter your information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Monsterrat",
                  fontSize: 14,
                  color: colorWhite,
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,

            ),
          ],
        ),
      ),
    );
  }
}
