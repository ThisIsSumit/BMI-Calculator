import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.onpressed,
    required this.lable,
    super.key,
  });
  final Function onpressed;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(color: Colors.red),
      child: TextButton(
        onPressed: onpressed(),
        child: Text(
          lable,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
