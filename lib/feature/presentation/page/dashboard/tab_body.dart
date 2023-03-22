import 'package:flutter/material.dart';

import '../../../../widgets/dashboard.dart';
import '../../../../widgets/responsive_layout.dart';
import 'segments/body_segment.dart';
import 'segments/menu_segment.dart';
import 'segments/header_segment.dart';

class TabBody extends StatelessWidget {
  const TabBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabLayout(
      header: DashboardHeader(
        builder: (config) {
          return const HeaderSegment();
        },
      ),
      menu: DashboardMenu(
        builder: (config) {
          return const MenuSegment();
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
