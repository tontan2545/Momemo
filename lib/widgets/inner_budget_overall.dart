import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../widgets/ci_card.dart';
import '../widgets/ci_circle_data_summary.dart';
import '../widgets/ci_display_value.dart';
import '../providers/budget.dart';

class InnerBudgetOverAll extends StatefulWidget {
  @override
  _InnerBudgetOverAllState createState() => _InnerBudgetOverAllState();
}

class _InnerBudgetOverAllState extends State<InnerBudgetOverAll> {
  @override
  Widget build(BuildContext context) {
    Budget budget = Provider.of<Budget>(context);
    double percentage = 100 * (budget.budgetAmount - budget.amountSpent)/budget.budgetAmount; 
    return CICard(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  CICircleDataSummary(percentage),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CICard(
                      radius: 12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 13),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CIDisplayValue(
                                "budget",
                                budget.budgetAmount,
                              ),
                              CIDisplayValue(
                                "spent",
                                budget.amountSpent,
                              )
                            ],
                          ),
                        ),
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
