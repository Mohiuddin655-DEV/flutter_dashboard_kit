import 'package:flutter/material.dart';

import '../../../../widgets/dashboard_layout.dart';
import '../../../../widgets/responsive_layout.dart';
import 'segments/body_segment.dart';
import 'segments/menu_segment.dart';
import 'segments/header_segment.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      background: Colors.white,
      header: DashboardHeader(
        builder: (config) {
          return const HeaderSegment();
        },
      ),
      menu: DashboardMenu(
        builder: (config) {
          return const CategorySegment();
        },
      ),
      body: DashboardBody(
        builder: (config) {
          return const BodySegment();
        },
      ),
    );
  }
}
