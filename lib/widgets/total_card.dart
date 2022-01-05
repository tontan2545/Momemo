import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ci_card.dart';
import '../providers/budget.dart';
import '../providers/budgets.dart';
import '../screens/total_overview_screen.dart';

class TotalCard extends StatefulWidget {
  static ValueNotifier<double> remainingBudget = ValueNotifier<double>(Budget.getRemainingBudget);
  @override
  _TotalCardState createState() {
    return _TotalCardState();
  }
}

class _TotalCardState extends State<TotalCard> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Budgets>(context);
    return CICard(
      child: ListTile(
        title: Row(
          children: [
            Text(
              "total",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Spacer(),
            ValueListenableBuilder(
              valueListenable: TotalCard.remainingBudget,
              builder: (context, value, child) => Text(
                (Budget.totalBudget - Budget.totalSpent).toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TotalOverview()));
          },
          padding: EdgeInsets.zero,
          splashRadius: 20,
          iconSize: 18,
          constraints: BoxConstraints(),
          icon: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
