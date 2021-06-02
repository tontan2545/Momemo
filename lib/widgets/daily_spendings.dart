import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../constant.dart';
import '../widgets/ci_card.dart';
import '../providers/budget.dart';

class DailySpendings extends StatefulWidget {
  final Budget budget;
  final Size size;

  DailySpendings(this.budget, this.size);

  @override
  _DailySpendingsState createState() => _DailySpendingsState();
}

class _DailySpendingsState extends State<DailySpendings> {
  @override
  Widget build(BuildContext context) {
    Map<int, String> _indexToDays = {
      0: 'Mo',
      1: 'Tu',
      2: 'We',
      3: 'Th',
      4: 'Fe',
      5: 'Sa',
      6: 'Su',
    };
    List<double> _spendingInWeek = widget.budget.getWeeklySpending;
    return CICard(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "daily spendings",
              style: TextStyle(
                color: kBlackFontColor,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _spendingInWeek.asMap().entries.map((entries) {
                double sum = _spendingInWeek.reduce((a, b) => a + b);
                double percentage = (sum == 0) ? 0 : entries.value / sum * 100;
                return Column(children: [
                  Container(
                    height: widget.size.height * 0.15,
                    child: FAProgressBar(
                      borderRadius: BorderRadius.circular(12),
                      size: 20,
                      progressColor:
                          ciPercentageBarColor(percentage / 100),
                      backgroundColor: Color(0xCCFFFFFF),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      currentValue: percentage.toInt(),
                      animatedDuration: Duration(
                          milliseconds: 500 * (Random().nextInt(7) + 3) ~/ 5.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(7),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: (_indexToDays[entries.key] ==
                              DateFormat.EEEE()
                                  .format(DateTime.now())
                                  .substring(0, 2))
                          ? Color(0xFFF0BC68)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(_indexToDays[entries.key].toString()),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
