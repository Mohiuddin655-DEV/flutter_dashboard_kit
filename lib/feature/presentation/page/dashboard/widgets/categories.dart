import 'package:flutter/material.dart';

import 'category_view.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  String selectedItem = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuCategory(
          title: "Menu",
          items: [
            MenuItem(
              title: "Dashboard",
              isSelected: selectedItem == "Dashboard",
              icon: Icons.home,
              counter: 0,
              onClick: (value) {
                selectedItem = value;
                setState(() {});
              },
            ),
            MenuItem(
              title: "Earnings",
              isSelected: selectedItem == "Earnings",
              icon: Icons.attach_money,
              counter: 0,
              onClick: (value) {
                selectedItem = value;
                setState(() {});
              },
            ),
            MenuItem(
              title: "My Services",
              isSelected: selectedItem == "My Services",
              icon: Icons.miscellaneous_services_outlined,
              counter: 12,
              onClick: (value) {
                selectedItem = value;
                setState(() {});
              },
            ),
            MenuItem(
              title: "Inbox",
              isSelected: selectedItem == "Inbox",
              icon: Icons.inbox,
              counter: 4,
              onClick: (value) {
                selectedItem = value;
                setState(() {});
              },
            ),
            MenuItem(
              title: "Report",
              isSelected: selectedItem == "Report",
              icon: Icons.analytics_outlined,
              counter: 0,
              onClick: (value) {
                selectedItem = value;
                setState(() {});
              },
            ),
          ],
        ),
        MenuCategory(
          title: "Other",
          items: [
            MenuItem(
              title: "Report",
              icon: Icons.report_gmailerrorred,
            ),
            MenuItem(
              title: "Helps",
              icon: Icons.help_outline_outlined,
            ),
            MenuItem(
              title: "Settings",
              icon: Icons.settings_outlined,
            ),
            MenuItem(
              title: "Logout",
              icon: Icons.logout_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
