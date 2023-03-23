import 'package:flutter/material.dart';

class GraphValue {
  final double current;
  final double old;
  final String? name;

  GraphValue({
    this.current = 0,
    this.old = 0,
    this.name,
  });
}

class Graphs extends StatelessWidget {
  final List<int>? ranks;
  final List<GraphValue>? graph;
  final double bottomTextSpaceTop;
  final Color? indicatorActiveColor, indicatorInactiveColor;
  final BorderRadius? indicatorRadius;
  final double indicatorSpaceBetween;
  final double indicatorWeight;
  final Color? lineColor;
  final double lineHeight;
  final double lineSpacer;
  final Color? textColor;
  final double textSize;
  final double textSpace;
  final double height;

  const Graphs({
    Key? key,
    this.bottomTextSpaceTop = 16,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.indicatorRadius,
    this.indicatorSpaceBetween = 4,
    this.indicatorWeight = 16,
    this.lineColor,
    this.lineHeight = 2,
    this.lineSpacer = 12,
    this.textColor,
    this.textSize = 12,
    this.textSpace = 32,
    this.height = 200,
    this.ranks,
    this.graph,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _GraphLines(
          textColor: textColor,
          textSize: textSize,
          textSpace: textSpace,
          lineColor: lineColor,
          lineHeight: lineHeight,
          lineSpacer: lineSpacer,
          height: height,
          values: ranks ?? const [100, 80, 60, 40, 20, 0],
        ),
        _GraphIndicators(
          width: double.infinity,
          height: height,
          margin: EdgeInsets.only(left: textSpace + lineSpacer),
          indicatorActiveColor: indicatorActiveColor,
          indicatorInactiveColor: indicatorInactiveColor,
          indicatorRadius: indicatorRadius,
          indicatorSpaceBetween: indicatorSpaceBetween,
          indicatorWeight: indicatorWeight,
          textColor: textColor,
          textSize: textSize,
          textSpaceTop: bottomTextSpaceTop,
          items: graph ?? List.generate(4, (index) => GraphValue()),
        ),
      ],
    );
  }
}

class _GraphLines extends StatelessWidget {
  final double height;
  final Color? textColor;
  final double textSize;
  final double textSpace;
  final Color? lineColor;
  final double lineHeight;
  final double lineSpacer;
  final List<int> values;

  const _GraphLines({
    Key? key,
    required this.height,
    required this.values,
    this.textColor,
    this.textSize = 12,
    this.textSpace = 32,
    this.lineColor,
    this.lineHeight = 2,
    this.lineSpacer = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: values.map((value) {
          return _GraphLine(
            text: "$value",
            textColor: textColor,
            textSize: textSize,
            textSpace: textSpace,
            lineColor: lineColor,
            lineHeight: lineHeight,
            lineSpacer: lineSpacer,
          );
        }).toList(),
      ),
    );
  }
}

class _GraphIndicators extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final List<GraphValue> items;
  final double textSize;
  final Color? textColor;
  final double textSpaceTop;
  final Color? indicatorActiveColor, indicatorInactiveColor;
  final BorderRadius? indicatorRadius;
  final double indicatorSpaceBetween;
  final double indicatorWeight;

  const _GraphIndicators({
    Key? key,
    required this.items,
    required this.height,
    this.width = 0,
    this.margin,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.indicatorRadius,
    this.indicatorSpaceBetween = 4,
    this.indicatorWeight = 16,
    this.textColor,
    this.textSize = 12,
    this.textSpaceTop = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + (textSpaceTop * 2),
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: textSpaceTop / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return Expanded(
            child: _GraphIndicator(
              item: item,
              height: height - textSpaceTop,
              index: index(items, item),
              indicatorActiveColor: indicatorActiveColor,
              indicatorInactiveColor: indicatorInactiveColor,
              indicatorRadius: indicatorRadius,
              indicatorSpaceBetween: indicatorSpaceBetween,
              indicatorWeight: indicatorWeight,
              textColor: textColor,
              textSize: textSize,
              textSpaceTop: textSpaceTop,
            ),
          );
        }).toList(),
      ),
    );
  }

  int index(List<GraphValue> items, GraphValue item) => items.indexOf(item);
}

class _GraphIndicator extends StatelessWidget {
  final GraphValue item;
  final int index;
  final double height;
  final double textSize;
  final Color? textColor;
  final double textSpaceTop;
  final Color? indicatorActiveColor, indicatorInactiveColor;
  final BorderRadius? indicatorRadius;
  final double indicatorSpaceBetween;
  final double indicatorWeight;

  const _GraphIndicator({
    Key? key,
    required this.index,
    required this.item,
    this.height = 0,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.indicatorRadius,
    this.indicatorSpaceBetween = 4,
    this.indicatorWeight = 16,
    this.textColor,
    this.textSize = 12,
    this.textSpaceTop = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _GraphPosition(
              percentage: height * (item.current / 100),
              color: indicatorActiveColor ?? primary,
              radius: indicatorRadius,
              weight: indicatorWeight,
            ),
            SizedBox(width: indicatorSpaceBetween),
            _GraphPosition(
              percentage: height * (item.old / 100),
              color: indicatorInactiveColor,
              radius: indicatorRadius,
              weight: indicatorWeight,
            ),
          ],
        ),
        Container(
          width: (indicatorWeight * 2) + indicatorSpaceBetween,
          padding: EdgeInsets.only(top: textSpaceTop),
          child: Text(
            _name(index, item.name),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.black.withOpacity(0.35),
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ),
      ],
    );
  }

  String _name(int index, [String? name]) {
    if (name != null) {
      return name;
    } else {
      switch (index) {
        case 0:
          return "Jan";
        case 1:
          return "Feb";
        case 2:
          return "Mar";
        case 3:
          return "Apr";
        case 4:
          return "May";
        case 5:
          return "Jun";
        case 6:
          return "Jul";
        case 7:
          return "Aug";
        case 8:
          return "Sep";
        case 9:
          return "Oct";
        case 10:
          return "Nov";
        case 11:
          return "Dec";
        default:
          return "";
      }
    }
  }
}

class _GraphPosition extends StatelessWidget {
  final double? percentage;
  final Color? color;
  final BorderRadius? radius;
  final double? weight;

  const _GraphPosition({
    Key? key,
    this.percentage,
    this.color,
    this.radius,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentage,
      width: weight ?? 12,
      decoration: BoxDecoration(
        color: color ?? const Color(0xffdbdbdd),
        borderRadius: radius ?? BorderRadius.circular(25),
      ),
    );
  }
}

class _GraphLine extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double textSize;
  final double textSpace;
  final Color? lineColor;
  final double? lineHeight;
  final double lineSpacer;

  const _GraphLine({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize = 12,
    this.textSpace = 32,
    this.lineColor,
    this.lineHeight = 2,
    this.lineSpacer = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: textSpace,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.black.withOpacity(0.35),
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: lineHeight,
            decoration: BoxDecoration(
              color: lineColor ?? Colors.grey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.only(left: lineSpacer),
          ),
        ),
      ],
    );
  }
}
