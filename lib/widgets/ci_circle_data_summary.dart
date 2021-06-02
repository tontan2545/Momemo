import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

import '../constant.dart';

class CICircleDataSummary extends StatefulWidget {
  final double percentage;

  CICircleDataSummary(this.percentage);

  @override
  _CICircleDataSummaryState createState() => _CICircleDataSummaryState();
}

class _CICircleDataSummaryState extends State<CICircleDataSummary> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CircularPercentIndicator(
            percent: widget.percentage / 100,
            radius: MediaQuery.of(context).size.height * 0.25,
            lineWidth: 37,
            progressColor: ciPercentageColor(widget.percentage / 100),
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 700,
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.percentage.toStringAsFixed(2) + "%",
                      style: TextStyle(
                        color: kBlackFontColor,
                        fontWeight: FontWeight.w500,
                        height: 0.6,
                        fontSize: 28,
                      )),
                  Text(
                    'remaining',
                    style: TextStyle(
                        color: kBlackFontColor, fontSize: 12, height: 1),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Text(
            DateFormat.yMMMMd('en_US').format(DateTime.now()),
            style: TextStyle(
              color: kBlackFontColor,
              fontSize: 12,
            ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
