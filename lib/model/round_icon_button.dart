import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton( {
    required this.onpressed,
    required this.icon,
    super.key,
  });
  final Function onpressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
        backgroundColor:const  Color.fromARGB(94, 142, 142, 142),
        shape: const CircleBorder(),
        onPressed: () {
          onpressed();
        },
        child: icon);
  }
}
