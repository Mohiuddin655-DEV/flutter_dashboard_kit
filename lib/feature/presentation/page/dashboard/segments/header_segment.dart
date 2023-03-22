import 'package:flutter/material.dart';

class HeaderSegment extends StatelessWidget {
  const HeaderSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      alignment: Alignment.center,
      color: Colors.white,
      child: const Text(
        "HEADER",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
