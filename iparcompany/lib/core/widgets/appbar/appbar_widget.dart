import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';

class WAppBarWidget extends StatelessWidget {
  final BuildContext context;
  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final double? toolbarHeight;
  final double? leadingWidth;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback ontap;
  const WAppBarWidget(
      {super.key,
      this.leading,
      this.automaticallyImplyLeading,
      this.title,
      this.actions,
      this.centerTitle,
      this.elevation,
      this.titleTextStyle,
      this.toolbarHeight,
      this.leadingWidth,
      this.backgroundColor,
      this.foregroundColor,
      required this.context,
      required this.ontap});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: leading ??
              SvgPicture.asset(
                context.icons.arrowLeft,
              ),
        ),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      actions: actions,
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      titleTextStyle: titleTextStyle,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }
}
