import 'package:flutter/material.dart';
import 'package:flutter_erp_software/utils/configurations/size_config.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../widgets/horizontal_graph.dart';
import '../../../../../widgets/text_view.dart';

class OverviewCard extends StatelessWidget {
  final SizeConfig config;

  const OverviewCard({Key? key, required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextView(
                text: "Overview Order",
                textSize: 14,
                fontWeight: FontWeight.bold,
              ),
              Container(
                decoration: BoxDecoration(
                  color: KColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Row(
                  children: const [
                    TextView(
                      text: "Monthly",
                      textSize: 12,
                      fontWeight: FontWeight.bold,
                      textColor: KColors.primary,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_downward,
                      color: KColors.primary,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              BulletedText(
                title: "Completed",
                bulletColor: KColors.primary,
              ),
              SizedBox(width: 16),
              BulletedText(title: "Canceled"),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Graphs(
              ranks: const [500, 100, 50, 25, 5, 0],
              lineHeight: 0.2,
              lineColor: Colors.grey,
              graph: [
                GraphValue(current: 74, old: 36),
                GraphValue(current: 80, old: 70),
                GraphValue(current: 60, old: 50),
                GraphValue(current: 40, old: 30),
                GraphValue(current: 20, old: 10),
                GraphValue(current: 100, old: 90),
                GraphValue(current: 80, old: 70),
                GraphValue(current: 60, old: 50),
                GraphValue(current: 40, old: 30),
                GraphValue(current: 20, old: 10),
                GraphValue(current: 20, old: 10),
                GraphValue(current: 20, old: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BulletedText extends StatelessWidget {
  final String title;
  final Color? bulletColor;

  const BulletedText({
    Key? key,
    required this.title,
    this.bulletColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: bulletColor ?? Colors.grey.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(right: 6),
        ),
        TextView(
          text: title,
          textSize: 12,
          textColor: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
