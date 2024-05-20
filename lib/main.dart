
import 'package:flutter/material.dart';

import 'bmi_input.dart';

Color kcolorScheme = const Color.fromARGB(255, 46, 44, 56);

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: const SafeArea(
        child: Bmi()
      )));
}
