import 'package:flutter/material.dart';

import 'package:budget_list/constant.dart';

class CICard extends StatelessWidget {
  final Widget? child;
  final Function()? onTap;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double radius;

  CICard({this.child, this.color = const Color(0x80FFFFFF), this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5) , this.radius = kRoundedCorner, this.onTap,});

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.radius),
      ),
      elevation: 0,
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(this.radius),
              child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
