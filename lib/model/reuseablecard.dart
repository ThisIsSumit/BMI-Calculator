import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  const Reuseablecard({
    required this.onpressed,
    required this.elevation,
    required this.keychild,
    super.key,
  });

  final Widget keychild;
  final Function onpressed;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onpressed(), // Corrected to pass function reference
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: elevation,
          child: keychild,
        ),
      ),
    );
  }
}