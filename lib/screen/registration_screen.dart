import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/add_utils.dart';
import 'package:flutter_authentication_ui/widget/input_field_widget.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

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
                  fontFamily: "Montserrat",
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
                  fontFamily: "Montserrat",
                  fontSize: 28,
                  color: colorWhite,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03,
            ),
            const Center(
              child: Text(
                "Please, enter your information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  color: colorWhite,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: nameController,
              hintText: "Enter your name",
              icon: Icons.person,
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: emailController,
              hintText: "Enter your email",
              icon: Icons.email,
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: passwordController,
              hintText: "Enter your password",
              icon: Icons.password,
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                style: const TextStyle(
                  color: colorWhite,
                  fontFamily: "Montserrat",
                ),
                textAlign: TextAlign.center,
                controller: birthDateController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: colorWhite,
                    size: 25,
                  ),
                  hintText: "Enter your birthday",
                  hintStyle: TextStyle(
                    color: colorGrey,
                    fontSize: 12,
                    fontFamily: "Montserrat",
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite),
                  ),
                ),
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());
                  date = (await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100)))!;
                  String dateFormatter = date.toIso8601String();
                  DateTime dt = DateTime.parse(dateFormatter);
                  var formatter = DateFormat("dd-MMMM-yyyy");
                  birthDateController.text = formatter.format(dt);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
