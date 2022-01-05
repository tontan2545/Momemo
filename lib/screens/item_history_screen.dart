import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../widgets/ci_card.dart';
import '../widgets/upper_curve.dart';
import '../widgets/item_history_list.dart';
import '../widgets/daily_spendings.dart';
import '../widgets/inner_budget_overall.dart';
import '../widgets/edit_budget.dart';
import '../widgets/add_spending.dart';
import '../widgets/add_budget.dart';
import '../providers/budget.dart';
import '../providers/budgets.dart';

class ItemHistoryScreen extends StatefulWidget {
  static const routeName = './itemHistory';

  final Budget budget;

  ItemHistoryScreen(this.budget);

  @override
  _ItemHistoryScreenState createState() => _ItemHistoryScreenState();
}

class _ItemHistoryScreenState extends State<ItemHistoryScreen> {

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Budgets budgets = Provider.of<Budgets>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ChangeNotifierProvider.value(
        value: widget.budget,
        child: CustomScrollView(
          slivers: [
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
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.budget.name,
                            style: kHeaderTextStyle.copyWith(height: 0.9)),
                        Text(
                          widget.budget.description,
                          style: kHeaderTextStyle.copyWith(
                              height: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          children: [
                            CICard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 5),
                                    child: ListTile(
                                      title: Text("total",
                                          style: kInListTileTextTheme),
                                      trailing: AddBudget(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      (widget.budget.getCurrentRemainingBudget).toStringAsFixed(2),
                                      textAlign: TextAlign.end,
                                      style: kInListTileTextTheme.copyWith(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            Row(
                              children: [
                                EditBudget(),
                                AddSpending(),
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            InnerBudgetOverAll(),
                            SizedBox(height: size.height * 0.03),
                            DailySpendings(widget.budget, size),
                            SizedBox(height: size.height * 0.03),
                            ItemHistoryList(widget.budget, _refreshPage),
                            SizedBox(height: size.height * 0.03),
                            TextButton(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                child: Text(
                                  "remove",
                                  style: TextStyle(
                                    color: kRed,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                  budgets.removeBudget(widget.budget.id);
                                });
                              },
                              style: TextButton.styleFrom(
                                primary: kRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
