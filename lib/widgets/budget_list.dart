import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import './ci_card.dart';
import './ci_pop_up.dart';
import './ci_text_field.dart';
import './ci_long_text_field.dart';
import './budget_overview.dart';
import '../constant.dart';
import '../providers/budgets.dart';

class BudgetList extends StatefulWidget {

  @override
  _BudgetListState createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  @override
  Widget build(BuildContext context) {
    final budgets = Provider.of<Budgets>(context);
    final budgetList = budgets.budgets;

    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final descriptionController = TextEditingController();

    return CICard(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "budget",
              style: kInListTileTextTheme,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => showAnimatedDialog(
                context: context,
                builder: (context) => CIPopUp(
                  child: [
                    CITextField(
                      controller: nameController,
                      prefixText: "name",
                      hintText: "budget name",
                      maxLines: 1,
                    ),
                    CITextField(
                      controller: amountController,
                      prefixText: "amount",
                      hintText: "amount",
                      maxLines: 1,
                      textInputType: TextInputType.number,
                    ),
                    CILongTextField(
                      controller: descriptionController,
                      hintText: "",
                      maxLength: 30,
                      title: "description",
                    ),
                  ],
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty &&
                              amountController.text.isNotEmpty &&
                              descriptionController.text.isNotEmpty) {
                            setState(() {
                              print("Added successfully");
                              budgets.addNewBudget(
                                  nameController.text,
                                  descriptionController.text,
                                  double.parse(amountController.text));
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("add"),
                        style: ElevatedButton.styleFrom(
                          primary: kLightGreen,
                          padding: EdgeInsets.all(20),
                          shape: CircleBorder(),
                          elevation: 0,
                        ),
                      ),
                    )
                  ],
                ),
                animationType: DialogTransitionType.scale,
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: 500),
                barrierDismissible: true,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashRadius: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (ctx, i) => MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: budgets),
                  ChangeNotifierProvider.value(value: budgetList[i]),
                ],
                child: BudgetOverview(),
              ),
              itemCount: budgetList.length,
            ),
          ),
        ],
      ),
      color: const Color(0x80FFFFFF),
    );
  }
}
