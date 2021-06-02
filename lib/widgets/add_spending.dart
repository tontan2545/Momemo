import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../widgets/ci_text_field.dart';
import '../widgets/ci_long_text_field.dart';
import '../widgets/ci_rounded_button.dart';
import '../widgets/ci_pop_up.dart';
import '../widgets/total_card.dart';
import '../providers/budget.dart';

class AddSpending extends StatefulWidget {
  @override
  _AddSpendingState createState() => _AddSpendingState();
}

class _AddSpendingState extends State<AddSpending> {
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Budget budget = Provider.of<Budget>(context);
    return CIRoundedButton(
      EdgeInsets.all(10),
      "add spending",
      Color(0xFFF0BC68),
      () => showAnimatedDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => CIPopUp(
          child: [
            CITextField(
              controller: nameController,
              prefixText: "name",
              hintText: "usage name",
            ),
            CITextField(
              controller: amountController,
              prefixText: "amount",
              hintText: "spent amount",
              textInputType: TextInputType.number,
            ),
            CILongTextField(
              controller: noteController,
              title: "note",
              hintText: "note",
              maxLength: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          amountController.text.isNotEmpty) {
                        setState(() {
                          budget.addSpending(
                              nameController.text,
                              double.parse(amountController.text),
                              noteController.text);
                        });
                        Navigator.of(context).pop();
                        TotalCard.remainingBudget.value = Budget.getRemainingBudget;
                        nameController.text = "";
                        amountController.text = "";
                        noteController.text = "";
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
                ],
              ),
            )
          ],
        ),
        animationType: kCIAnimationType,
        curve: kCICurve,
        duration: kCIDuration,
      ),
    );
  }
}
