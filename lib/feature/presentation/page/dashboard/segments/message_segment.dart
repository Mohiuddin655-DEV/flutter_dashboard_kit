import 'package:flutter/material.dart';

class SideBarSegment extends StatelessWidget {
  const SideBarSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.blue.shade50,
      child: const Text(
        "SIDE BAR",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
