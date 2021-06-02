import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import './ci_card.dart';
import '../constant.dart';
import '../providers/budget.dart';
import '../widgets/add_spending_icon.dart';
import '../screens/view_item_screen.dart';

class ItemHistoryList extends StatefulWidget {
  final Budget budget;
  final Function refreshPage;

  ItemHistoryList(this.budget, this.refreshPage);

  @override
  _ItemHistoryListState createState() => _ItemHistoryListState();
}

class _ItemHistoryListState extends State<ItemHistoryList> {

  @override
  Widget build(BuildContext context) {
    return CICard(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 17),
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "budget usage history",
                  style: TextStyle(
                    color: kBlackFontColor,
                    fontSize: 16,
                  ),
                ),
              ),
              trailing: AddSpendingIcon(),
            ),
            ...widget.budget.itemsHistory.map((item) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 1),
                child: CICard(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  radius: 12,
                  child: OpenContainer(
                    closedBuilder: (context, VoidCallback openContainer) =>
                        ListTile(
                      title: Text(
                        item.name,
                        style: TextStyle(color: kBlackFontColor, fontSize: 16),
                      ),
                      trailing: Text(
                        item.amount.toStringAsFixed(2),
                        style: TextStyle(
                            color: kBlackFontColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    closedColor: Colors.transparent,
                    openBuilder: (context, _) => ViewItemScreen(item, widget.budget, widget.refreshPage),
                    closedElevation: 0,
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
