import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../widgets/header_logo.dart';

class CategorySegment extends StatelessWidget {
  const CategorySegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      margin: const EdgeInsets.only(right: 1),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderLogo(),
          CategoriesView(),
        ],
      ),
    );
  }
}
