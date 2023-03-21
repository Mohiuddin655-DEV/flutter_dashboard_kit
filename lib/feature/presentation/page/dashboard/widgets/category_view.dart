import 'package:flutter/material.dart';
import 'package:flutter_erp_software/widgets/text_view.dart';

class MenuCategory extends StatelessWidget {
  final String title;
  final List<MenuItem> items;

  const MenuCategory({
    Key? key,
    this.title = "",
    this.items = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              TextView(
                text: title,
                textSize: 10,
                textColor: Colors.grey.shade600,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  color: Colors.grey.withOpacity(0.1),
                  height: 1.5,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((e) {
              return _MenuItem(
                item: e,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final MenuItem item;

  const _MenuItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    const color = Color(0xffd5d5d7);
    return GestureDetector(
      onTap: () => item.onClick?.call(item.title),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: item.isSelected ? primary.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 18,
              color: item.isSelected ? primary : color,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    margin: const EdgeInsets.only(left: 8),
                    text: item.title,
                    textColor: item.isSelected ? primary : color,
                    textSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  Visibility(
                    visible: item.counter > 0,
                    child: Container(
                      width: 32,
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: TextView(
                        text: item.counter.toString(),
                        textSize: 12,
                        textColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final bool isSelected;
  final String title;
  final int counter;
  final dynamic icon;
  final Function(String title)? onClick;

  MenuItem({
    this.isSelected = false,
    this.title = "",
    this.counter = 0,
    this.icon,
    this.onClick,
  });
}
