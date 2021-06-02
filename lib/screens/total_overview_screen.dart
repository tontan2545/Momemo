import 'package:budget_list/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/upper_curve.dart';
import '../widgets/ci_display_value.dart';
import '../widgets/ci_dashboard.dart';
import '../widgets/ci_card.dart';
import '../providers/budget.dart';

class TotalOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10, left: 17),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: kBlackButtonColor, size: 18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x99F5F2F0),
                ),
                padding: EdgeInsets.only(right: 2),
              ),
              customBorder: CircleBorder(),
              splashColor: Colors.black,
            ),
          ),
          expandedHeight: AppBar().preferredSize.height + 3,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Stack(
                children: <Widget>[
                  UpperCurve(size, 0.25, 0.1, 55),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CICard(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  'total',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: kBlackFontColor,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  Budget.getRemainingBudget.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackFontColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.05,),
                        CICard(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          child: CIDashboard(
                              Budget.getRemainingBudget /
                                  Budget.totalBudget *
                                  100,
                              Budget.totalBudget,
                              Budget.totalSpent),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            childCount: 1,
          ),
        )
      ]),
    );
  }
}
