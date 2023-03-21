import 'package:flutter/material.dart';

import 'segments/header_segment.dart';
import 'segments/body_segment.dart';
class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const HeaderSegment(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const BodySegment(),
            ),
          ),
        ],
      ),
    );
  }
}
