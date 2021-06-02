import 'package:flutter/material.dart';

import '../widgets/ci_card.dart';
import '../widgets/ci_display_value.dart';
import '../widgets/ci_circle_data_summary.dart';

class CIDashboard extends StatefulWidget {
  final double percentage;
  final double budgetAmount;
  final double amountSpent;

  CIDashboard(this.percentage, this.budgetAmount, this.amountSpent);

  @override
  _CIDashboardState createState() => _CIDashboardState();
}

class _CIDashboardState extends State<CIDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CICircleDataSummary(widget.percentage),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CICard(
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CIDisplayValue(
                      "budget",
                      widget.budgetAmount,
                    ),
                    CIDisplayValue(
                      "spent",
                      widget.amountSpent,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
