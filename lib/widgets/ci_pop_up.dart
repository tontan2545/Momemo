import 'package:flutter/material.dart';

import '../constant.dart';

class CIPopUp extends StatelessWidget {
  final List<Widget> child;
  final List<Widget>? actions;

  CIPopUp({this.child = const [Text("Placeholder")], this.actions});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: child,
        ),
      ),
      backgroundColor: kBackgroundColor,
      actions: actions,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kRoundedCorner))),
    );
  }
}
