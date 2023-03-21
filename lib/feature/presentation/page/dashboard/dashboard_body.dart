import 'package:flutter/material.dart';

import 'segments/header_segment.dart';
import 'segments/body_segment.dart';
import 'segments/category_segment.dart';
import 'segments/message_segment.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CategorySegment(),
        Expanded(
          child: Column(
            children: [
              const HeaderSegment(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const BodySegment(),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: const MessageSegment(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
