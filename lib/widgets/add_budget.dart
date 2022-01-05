import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../widgets/ci_text_field.dart';
import '../widgets/ci_pop_up.dart';
import '../widgets/ci_rounded_button.dart';
import '../widgets/total_card.dart';
import '../providers/budget.dart';

class AddBudget extends StatefulWidget {
  @override
  _AddBudgetState createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Budget budget = Provider.of<Budget>(context);
    return IconButton(
      constraints: const BoxConstraints(),
      splashRadius: 24,
      onPressed: () => showAnimatedDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => CIPopUp(
          child: [
            CITextField(
              controller: amountController,
              prefixText: "amount",
              hintText: "amount",
              textInputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CIRoundedButton(
                    EdgeInsets.all(10),
                    "subtract",
                    kLightRed,
                    () {
                      if (amountController.text.isNotEmpty) {
                        setState(
                          () {
                            budget.subtractBudgetAmount(
                                double.parse(amountController.text));
                          },
                        );
                        TotalCard.remainingBudget.value = Budget.getRemainingBudget;
                        Navigator.of(context).pop();
                        amountController.text = "";
                      }
                    },
                    textColor: Colors.white,
                  ),
                  CIRoundedButton(
                    EdgeInsets.all(10),
                    "add",
                    kLightGreen,
                    () {
                      if (amountController.text.isNotEmpty) {
                        setState(
                          () {
                            budget.addBudgetAmount(
                                double.parse(amountController.text));
                          },
                        );
                        TotalCard.remainingBudget.value = Budget.getRemainingBudget;
                        Navigator.of(context).pop();
                        amountController.text = "";
                      }
                    },
                    textColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
        animationType: kCIAnimationType,
        curve: kCICurve,
        duration: kCIDuration,
      ),
      icon: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Icon(Icons.edit),
      ),
    );
  }
}
