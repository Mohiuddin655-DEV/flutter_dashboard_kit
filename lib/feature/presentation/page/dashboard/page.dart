import 'package:flutter/material.dart';

import '../../../../widgets/dashboard.dart';
import 'segments/body_segment.dart';
import 'segments/header_segment.dart';
import 'segments/menu_segment.dart';
import 'segments/side_bar_segment.dart';

class DashboardPage extends StatefulWidget {
  static const String route = "home_page";

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
      background: Colors.white,
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
          return BodySegment(
            config: config,
          );
        },
      ),
      report: DashboardReport(
        builder: (config) {
          return const SideBarSegment();
        },
      ),
    );
  }
}

class DashboardConst {
  static const Color pageBackground = Color(0xfff1f1f1);
}
