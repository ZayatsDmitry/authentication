import 'package:flutter/material.dart';
import 'package:flutter_authentication_ui/add_utils.dart';
import 'package:flutter_authentication_ui/screen/login_screen.dart';
import 'package:flutter_authentication_ui/widget/input_field_widget.dart';
import 'package:flutter_authentication_ui/widget/primary_button.dart';
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


  String genderSelected = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  fontFamily: fontFamily,
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
                  fontFamily: fontFamily,
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
                  fontFamily: fontFamily,
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
                  fontFamily: fontFamily,
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
                    fontFamily: fontFamily,
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
                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100), ))!;
                  String dateFormatter = date.toIso8601String();
                  DateTime dt = DateTime.parse(dateFormatter);
                  var formatter = DateFormat("dd-MMMM-yyyy");
                  birthDateController.text = formatter.format(dt);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "GENDER",
                    style: TextStyle(
                      color: colorWhite,
                      letterSpacing: 1,
                      fontSize: 14,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          groupValue: genderSelected,
                          activeColor: colorWhite,
                          title: const Text(
                            "MALE",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 14,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: "male",
                          onChanged: (val) {
                            setState(() {
                              genderSelected = val.toString();
                            });
                            print(genderSelected);
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          groupValue: genderSelected,
                          activeColor: colorWhite,
                          title: const Text(
                            "FEMALE",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 14,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: "female",
                          onChanged: (val) {
                            setState(() {
                              genderSelected = val.toString();
                            });
                            print(genderSelected);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            PrimaryButton(
              text: "Sign Up",
              onPressed: () {
                if (isValidate()) {
                  print("Data validate");
                }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign In",
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
    );
  }

  bool isValidate() {
    if (nameController.text.isEmpty) {
      showScaffold(context, "Please, enter your name");
      return false;
    }
    if (emailController.text.isEmpty) {
      showScaffold(context, "Please, enter your email");
      return false;
    }
    if (passwordController.text.isEmpty) {
      showScaffold(context, "Please, enter your password");
      return false;
    }
    if (birthDateController.text.isEmpty) {
      showScaffold(context, "Please, enter your birthdate");
      return false;
    }
    return true;
  }
}
