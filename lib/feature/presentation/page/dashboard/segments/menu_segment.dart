import 'package:flutter/material.dart';

class MenuSegment extends StatelessWidget {
  const MenuSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.red.shade50,
      child: const Text(
        "MENU",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
