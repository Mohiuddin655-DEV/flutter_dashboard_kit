import 'package:flutter/material.dart';
import 'package:flutter_erp_software/widgets/dashboard_layout.dart';

import '../../../../widgets/responsive_layout.dart';
import 'desktop_body.dart';
import 'mobile_body.dart';
import 'segments/body_segment.dart';
import 'segments/menu_segment.dart';
import 'segments/header_segment.dart';
import 'segments/message_segment.dart';
import 'tab_body.dart';

class DashboardBodyB extends StatelessWidget {
  const DashboardBodyB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileBody(),
      tabBody: TabBody(),
      desktopBody: DesktopBody(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
