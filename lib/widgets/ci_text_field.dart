import 'package:flutter/material.dart';

import '../constant.dart';

class CITextField extends StatelessWidget {

  final controller;
  final String prefixText;
  final String hintText;
  final Color? hintColor;
  final int? maxLines;
  final TextInputType? textInputType;

  CITextField({this.controller, this.prefixText = "text", this.hintText = "text", this.maxLines, this.textInputType = TextInputType.text, this.hintColor = const Color(0x4D707070)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        style: kInTextFieldTextStyle,
        maxLines: maxLines,
        keyboardType: textInputType,
        textAlign: TextAlign.right,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, top: 11.2, right: 10),
            child: Text(
              prefixText,
              style: kInTextFieldPrefixTextStyle,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(kTextFieldBorderRadius),
          ),
        ),
      ),
    );
  }
}
