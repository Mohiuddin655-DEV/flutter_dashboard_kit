import 'package:flutter/material.dart';
import 'package:flutter_erp_software/feature/presentation/page/dashboard/page.dart';
import 'package:flutter_erp_software/utils/configurations/size_config.dart';

import '../widgets/overview.dart';
import '../widgets/profit_items.dart';

class BodySegment extends StatelessWidget {
  final SizeConfig config;

  const BodySegment({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    print(config.size);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: DashboardConst.pageBackground,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      child: Column(
        children: [
          ProfitCards(
            config: config,
            items: ProfitCardItem.items,
          ),
          OverviewCard(
            config: config,
          ),
        ],
      ),
    );
  }
}
