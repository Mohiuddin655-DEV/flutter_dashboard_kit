import 'package:flutter/material.dart';
import '../../../../../widgets/image_view.dart';
import '../../../../../widgets/text_view.dart';
import '../components/logo_const.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: const [
          ImageView(
            width: 40,
            height: 40,
            src: LogoConst.logo,
            srcType: ImageType.asset,
            cacheMode: false,
          ),
          TextView(
            text: LogoConst.name,
            textSize: 12,
            margin: EdgeInsets.only(left: 16),
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
