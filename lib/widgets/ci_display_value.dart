import 'package:flutter/material.dart';

import '../constant.dart';

class CIDisplayValue extends StatefulWidget {
  final String text;
  final double number;

  CIDisplayValue(this.text, this.number);

  @override
  _CIDisplayValueState createState() => _CIDisplayValueState();
}

class _CIDisplayValueState extends State<CIDisplayValue> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: TextStyle(color: kBlackFontColor, fontSize: 16),
        ),
        Spacer(),
        Text(
          widget.number.toStringAsFixed(2),
          style: TextStyle(
              color: kBlackFontColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
