import 'package:flutter/material.dart';
import 'package:flutter_erp_software/utils/configurations/size_config.dart';

import '../../../../../widgets/text_view.dart';

class ProfitCards extends StatelessWidget {
  final SizeConfig config;
  final List<ProfitCardItem> items;

  const ProfitCards({
    Key? key,
    required this.config,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((e) {
        return ProfitCard(
          item: e,
          config: config,
        );
      }).toList(),
    );
  }
}

class ProfitCard extends StatelessWidget {
  final SizeConfig config;
  final ProfitCardItem item;

  const ProfitCard({
    Key? key,
    required this.item,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(config.px(12)),
        padding: EdgeInsets.symmetric(
          vertical: config.px(12),
          horizontal: config.px(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(config.px(12)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: item.title,
                    textColor: Colors.grey,
                    fontWeight: FontWeight.w500,
                    textSize: config.px(12),
                  ),
                  TextView(
                    text: "\$ ${item.profit}",
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    textSize: config.px(14),
                    padding: EdgeInsets.only(top: config.px(8)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: config.px(8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: item.isProfit
                                ? Colors.green.withOpacity(0.05)
                                : Colors.redAccent.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(config.px(8)),
                          ),
                          padding: EdgeInsets.all(config.px(4)),
                          child: Icon(
                            item.isProfit
                                ? Icons.call_made
                                : Icons.call_received,
                            size: config.px(14),
                            color:
                                item.isProfit ? Colors.green : Colors.redAccent,
                          ),
                        ),
                        TextView(
                          text:
                              "${item.isProfit ? "+" : "-"} ${item.percentage}%",
                          textColor:
                              item.isProfit ? Colors.green : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          textSize: 12,
                          margin: EdgeInsets.only(left: config.px(8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.grain_outlined,
              size: config.px(40),
              color: item.isProfit
                  ? Colors.green.withOpacity(0.2)
                  : Colors.redAccent.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfitCardItem {
  final String title;
  final double profit;
  final double percentage;
  final bool isProfit;

  const ProfitCardItem({
    this.title = "",
    this.profit = 0,
    this.percentage = 0,
    this.isProfit = false,
  });

  static const List<ProfitCardItem> items = [
    ProfitCardItem(
      title: "Avg. Selling Price",
      percentage: 9.82,
      profit: 121.10,
      isProfit: true,
    ),
    ProfitCardItem(
      title: "Ava. CiCks",
      percentage: 51.71,
      profit: 1912,
      isProfit: false,
    ),
    ProfitCardItem(
      title: "Rola. impressions",
      percentage: 43.71,
      profit: 120191,
      isProfit: false,
    ),
  ];
}
