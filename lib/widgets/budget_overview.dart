import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:animations/animations.dart';

import 'ci_card.dart';
import '../constant.dart';
import '../providers/budget.dart';
import '../screens/item_history_screen.dart';

class BudgetOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Budget budget = Provider.of<Budget>(context);
    final double percentage =
        (budget.budgetAmount - budget.amountSpent) / budget.budgetAmount;

    

    return OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        closedColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 500),
        closedElevation: 0,
        openBuilder: (context, _) => ItemHistoryScreen(budget),
        closedBuilder: (context, VoidCallback openContainer) => CICard(
            radius: 15,
            onTap: openContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularPercentIndicator(
                  percent: percentage,
                  radius: MediaQuery.of(context).size.height * 0.1,
                  lineWidth: 10,
                  progressColor: ciPercentageColor(percentage),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                Text(budget.name),
              ],
            ),
          ),
    );
  }
}
