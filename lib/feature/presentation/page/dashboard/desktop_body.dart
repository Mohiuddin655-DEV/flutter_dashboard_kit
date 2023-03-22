import 'package:flutter/material.dart';

import '../../../../widgets/dashboard_layout.dart';
import 'segments/body_segment.dart';
import 'segments/menu_segment.dart';
import 'segments/header_segment.dart';
import 'segments/message_segment.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
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
      report: DashboardReport(
        builder: (config) {
          return const MessageSegment();
        },
      ),
    );
  }
}
