import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'body.dart';

class DashboardPage extends StatefulWidget {
  static const String route = "home_page";

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DashboardConst.pageBackground,
      appBar: AppBar(
        backgroundColor: DashboardConst.pageBackground,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: DashboardConst.pageBackground,
        ),
      ),
      body: const DashboardBody(),
    );
  }
}

class DashboardConst {
  static const Color pageBackground = Color(0xfff1f1f1);
}
