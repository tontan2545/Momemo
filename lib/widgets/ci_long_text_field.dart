import 'package:flutter/material.dart';

import '../constant.dart';

class CILongTextField extends StatelessWidget {
  final controller;
  final String title;
  final String hintText;
  final int maxLength;
  final Color? hintColor;

  const CILongTextField({
    required this.controller,
    required this.title,
    required this.hintText,
    required this.maxLength,
    this.hintColor = const Color(0x4D707070),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: kInTextFieldPrefixTextStyle,
                  ),
                ],
              ),
              TextField(
                maxLength: maxLength,
                controller: controller,
                textAlign: TextAlign.left,
                maxLines: null,
                style: kInTextFieldTextStyle,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(color: hintColor)),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
          color: Colors.white,
        ),
      ),
    );
  }
}
