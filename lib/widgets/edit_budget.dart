import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../widgets/ci_text_field.dart';
import '../widgets/ci_long_text_field.dart';
import '../widgets/ci_rounded_button.dart';
import '../widgets/ci_pop_up.dart';
import '../providers/budget.dart';

class EditBudget extends StatefulWidget {
  @override
  _EditBudgetState createState() => _EditBudgetState();
}

class _EditBudgetState extends State<EditBudget> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Budget budget = Provider.of<Budget>(context);
    return CIRoundedButton(
        EdgeInsets.all(10),
        "edit budget",
        Color(0xFFFD5DCDD),
        () => showAnimatedDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) => CIPopUp(
                child: [
                  CITextField(
                    controller: nameController,
                    prefixText: "name",
                    hintText: "name",
                  ),
                  CITextField(
                    controller: amountController,
                    prefixText: "amount",
                    hintText: "starting amount",
                    textInputType: TextInputType.number,
                  ),
                  CILongTextField(
                    controller: descriptionController,
                    title: "description",
                    hintText: "description",
                    maxLength: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (nameController.text.isNotEmpty &&
                                amountController.text.isNotEmpty &&
                                descriptionController.text.isNotEmpty) {
                              setState(() {
                                budget.editBudgetCategory(
                                    nameController.text,
                                    descriptionController.text,
                                    double.parse(amountController.text));
                                Navigator.of(context).pop();
                                nameController.text = "";
                                amountController.text = "";
                                descriptionController.text = "";
                              });
                            }
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
                                MaterialStateProperty.all<Color>(kLightGreen),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
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
            ));
  }
}
