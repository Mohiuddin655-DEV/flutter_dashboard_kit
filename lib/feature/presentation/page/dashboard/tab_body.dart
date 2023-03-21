import 'package:flutter/material.dart';
import 'package:flutter_erp_software/feature/presentation/page/dashboard/segments/header_segment.dart';

import 'segments/body_segment.dart';
import 'segments/category_segment.dart';

class TabBody extends StatelessWidget {
  const TabBody({Key? key}) : super(key: key);

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
                  child: const BodySegment(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
