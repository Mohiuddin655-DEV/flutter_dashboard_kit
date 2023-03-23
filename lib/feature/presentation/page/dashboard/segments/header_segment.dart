import 'package:flutter/material.dart';

import '../../../../../utils/models/state_value.dart';
import '../../../../../widgets/action_button.dart';
import '../../../../../widgets/edit_text.dart';
import '../../../../../widgets/text_view.dart';

class HeaderSegment extends StatelessWidget {
  const HeaderSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: kToolbarHeight,
      color: Colors.white,
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextView(
            text: "Dashboard",
            textColor: Colors.black,
            fontWeight: FontWeight.bold,
            textSize: 14,
          ),
          const Spacer(),
          const EditText(
            enabled: false,
            hint: "Search",
            width: 150,
            textSize: 10,
            background: Color(0xfff5f5f5),
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            borderRadius: 25,
            drawableStart: DrawableIcon(
              active: "assets/icons/Search.svg",
            ),
            drawablePadding: 6,
            drawableSize: 14,
            drawableTint: StateValue(active: Colors.grey),
          ),
          ActionButton(
            icon: Icons.notifications_none,
            size: 24,
            background: Colors.transparent,
            tint: Colors.grey,
            margin: const EdgeInsets.only(left: 4),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
