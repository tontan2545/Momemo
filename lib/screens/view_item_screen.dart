import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../widgets/ci_card.dart';
import '../widgets/upper_curve.dart';
import '../widgets/ci_long_text_field.dart';
import '../widgets/ci_text_field.dart';
import '../widgets/total_card.dart';
import '../providers/item.dart';
import '../providers/budget.dart';

class ViewItemScreen extends StatefulWidget {
  final Item item;
  final Budget budget;
  final Function rebuildParent;
  ViewItemScreen(this.item, this.budget, this.rebuildParent);

  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
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
                      Text(widget.item.name,
                          style: kHeaderTextStyle.copyWith(height: 0.9)),
                      Text(
                        widget.item.description,
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
                    UpperCurve(size, 0.6, 0.1, 55),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: size.height * 0.135,
                          ),
                          CICard(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CITextField(
                                  controller: nameController,
                                  hintText: widget.item.name,
                                  maxLines: 1,
                                  prefixText: "name",
                                  hintColor: Color(0xFF707070),
                                ),
                                CITextField(
                                  controller: amountController,
                                  hintText:
                                      widget.item.amount.toStringAsFixed(2),
                                  maxLines: 1,
                                  prefixText: "amount",
                                  textInputType: TextInputType.number,
                                  hintColor: Color(0xFF707070),
                                ),
                                CILongTextField(
                                  controller: noteController,
                                  title: 'note',
                                  hintText: widget.item.description,
                                  maxLength: 30,
                                  hintColor: Color(0xFF707070),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    DateFormat.yMMMMd('en_US')
                                        .add_jm()
                                        .format(widget.item.datetime),
                                    style: TextStyle(
                                      color: kBlackFontColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: TextButton(
                              onPressed: (nameController.text.isEmpty &&
                                      amountController.text.isEmpty &&
                                      noteController.text.isEmpty)
                                  ? null
                                  : () {
                                      String name = nameController.text.isEmpty
                                          ? widget.item.name
                                          : nameController.text;
                                      double amount = amountController
                                              .text.isEmpty
                                          ? widget.item.amount
                                          : double.parse(amountController.text);
                                      String note = noteController.text.isEmpty
                                          ? widget.item.description
                                          : noteController.text;
                                      widget.budget.editItem(
                                          widget.item.id, name, amount, note);
                                      TotalCard.remainingBudget.value =
                                          Budget.getRemainingBudget;
                                      widget.rebuildParent();
                                      Navigator.of(context).pop();
                                      nameController.text = "";
                                      amountController.text = "";
                                      noteController.text = "";
                                    },
                              child: Text(
                                "make change",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 14)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        (nameController.text.isEmpty &&
                                                amountController.text.isEmpty &&
                                                noteController.text.isEmpty)
                                            ? Colors.grey
                                            : kLightGreen),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: TextButton(
                              onPressed: () {
                                widget.budget.removeItem(widget.item.id);
                                TotalCard.remainingBudget.value =
                                    Budget.getRemainingBudget;
                                Navigator.of(context).pop();
                                widget.rebuildParent();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                child: Text(
                                  'remove',
                                  style: TextStyle(
                                    color: kRed,
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  primary: kRed,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          )
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
    );
  }
}
