import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;
const Color colorPrimary = Color(0xFF363CB4);
const Color colorGrey = Colors.grey;

const String fontFamily = "Montserrat";

showScaffold (BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}