import 'package:flutter/material.dart';

import '../widgets/ci_card.dart';

class CIRoundedButton extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final Color color;
  final Color? textColor;
  final Function() onTap;

  CIRoundedButton(this.padding, this.text, this.color, this.onTap, {this.textColor});
  @override
  Widget build(BuildContext context) {
    return Flexible(
    child: CICard(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ),
      ),
      color: color,
      radius: 25,
    ),
  );
  }
}

