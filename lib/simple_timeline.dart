library simple_timeline;

import 'package:flutter/material.dart';
import 'package:simple_timeline/src/colors.dart';

class SimpleTimeline extends StatefulWidget {

  final List<Widget> children;
  final List<Widget> indicator;
  final int itemCount;
  final double itemSpan;
  final double spacing;
  final EdgeInsets padding;
  final ScrollController controller;
  final ScrollPhysics scrollPhysics;
  final bool isLeftAlign;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  // Timeline Styling
  final Color lineColor;
  final Color indicatorColor;
  final double lineSpan;
  final double indicatorSize;
  final double strokeWidth;
  final PaintingStyle indicatorStyle;
  final PaintingStyle style;
  final StrokeCap strokeCap;

  SimpleTimeline({
    @required this.children,
    this.indicator,
    this.itemSpan = 10.0,
    this.spacing = 4.0,
    this.padding = const EdgeInsets.all(12.0),
    this.controller,
    this.scrollPhysics,
    this.isLeftAlign = true,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.lineColor = Purple,
    this.indicatorColor = Purple,
    this.lineSpan = 4.0,
    this.indicatorSize = 24.0,
    this.strokeWidth = 2.0,
    this.indicatorStyle = PaintingStyle.fill,
    this.style = PaintingStyle.stroke,
    this.strokeCap = StrokeCap.round,
  }) : itemCount = children.length,
        assert(itemSpan >= 0),
        assert(lineSpan >= 0),
        assert(indicator == null || children.length == indicator.length);

  @override
  _SimpleTimelineState createState() => _SimpleTimelineState();
}

class _SimpleTimelineState extends State<SimpleTimeline> with TickerProviderStateMixin {

  AnimationController _ac;
  Animation<double> _a;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this, value: 0.1);

    _a = CurvedAnimation(
        parent: _ac,
        curve: Curves.easeIn
    );

    _ac.forward();
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(

        padding: widget.padding,
        physics: widget.scrollPhysics,
        shrinkWrap: widget.shrinkWrap,
        controller: widget.controller,
        reverse: widget.reverse,
        primary: widget.primary,

        itemBuilder: (context, i) {
          final child = widget.children[i];

          Widget indicator;
          if (widget.indicator != null) {
            indicator = widget.indicator[i];
          }

          final isFirst = i == 0;
          final isLast = i == widget.itemCount - 1;

          final timelineTile = <Widget>[
            CustomPaint(
              foregroundPainter: _SimpleTimelinePainter(
                hideDefaultIndicator: indicator != null,
                lineColor: widget.lineColor,
                indicatorColor: widget.indicatorColor,
                indicatorSize: widget.indicatorSize,
                indicatorStyle: widget.indicatorStyle,
                isFirst: isFirst,
                isLast: isLast,
                lineSpan: widget.lineSpan,
                strokeCap: widget.strokeCap,
                strokeWidth: widget.strokeWidth,
                style: widget.style,
                itemSpan: widget.itemSpan,
              ),
              child: SizedBox(
                height: double.infinity,
                width: widget.indicatorSize,
                child: indicator,
              ),
            ),
            SizedBox(width: widget.spacing),
            Expanded(
                child: ScaleTransition(
                  child: child,
                  scale: _a,
                )
            ),
          ];

          return IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              widget.isLeftAlign ? timelineTile : timelineTile.reversed.toList(),
            ),
          );
        }, separatorBuilder: (_, __) => SizedBox(height: widget.itemSpan),
        itemCount: widget.itemCount);
  }
}

class _SimpleTimelinePainter extends CustomPainter {
  _SimpleTimelinePainter({
    @required this.hideDefaultIndicator,
    @required this.indicatorColor,
    @required this.indicatorStyle,
    @required this.indicatorSize,
    @required this.lineSpan,
    @required this.strokeCap,
    @required this.strokeWidth,
    @required this.style,
    @required this.lineColor,
    @required this.isFirst,
    @required this.isLast,
    @required this.itemSpan,
  })  : linePaint = Paint()
    ..color = lineColor
    ..strokeCap = strokeCap
    ..strokeWidth = strokeWidth
    ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineSpan;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemSpan;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemSpan = itemSpan / 2;
    final indicatorMargin = indicatorRadius + lineSpan;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemSpan));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemSpan));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
