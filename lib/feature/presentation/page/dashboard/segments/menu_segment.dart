import 'package:flutter/material.dart';

import '../widgets/menus.dart';
import '../widgets/header_logo.dart';

class CategorySegment extends StatelessWidget {
  const CategorySegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 1),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderLogo(),
          Menus(),
        ],
      ),
    );
  }
}
