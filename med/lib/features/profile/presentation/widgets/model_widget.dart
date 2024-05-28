import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final double? leftPadding;
  final double? rightPadding;
  final Color? color;
  const LineDivider({
    super.key,
    this.height,
    this.width,
    this.leftPadding,
    this.rightPadding,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: leftPadding ?? 16, right: rightPadding ?? 16),
      child: Container(
        width: width ?? double.maxFinite,
        height: height ?? 0.5,
        color: color ?? Colors.white,
      ),
    );
  }
}
