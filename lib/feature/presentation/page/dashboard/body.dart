import 'package:flutter/material.dart';
import 'package:flutter_erp_software/utils/configurations/device_config.dart';

import '../../../../widgets/responsive_layout.dart';
import 'dashboard_body.dart';
import 'mobile_body.dart';
import 'tab_body.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
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
