// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:med/assets/icons.dart';

CupertinoPageRoute fade(Widget widget) {
  return CupertinoPageRoute(
    builder: (context) {
      return widget;
    },
  );
}

TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

class Bnb {
  final String label;
  final String icon;
  Bnb({
    required this.label,
    required this.icon,
  });

  @override
  String toString() => 'Bnb(label: $label, icon: $icon)';
}

Bnb getNavigatorBar(int value) {
  switch (value) {
    case 0:
      return Bnb(label: "Asosiy", icon: AppIcons.asosiy);
    case 1:
      return Bnb(label: "Maqolalar", icon: AppIcons.maqola);
    case 2:
      return Bnb(label: "Chat", icon: AppIcons.chat);
    case 3:
      return Bnb(label: "Kalendar", icon: AppIcons.calendar);

    default:
      return Bnb(label: "Profil", icon: AppIcons.profile);
  }
}

Bnb getTurkumlar(int value) {
  switch (value) {
    case 0:
      return Bnb(label: "Psixologiya", icon: AppIcons.psixolog);
    case 1:
      return Bnb(label: "Kardiologiya", icon: AppIcons.kardiolog);

    default:
      return Bnb(label: "Nevrologiya", icon: AppIcons.nerv);
  }
}

String timeFormat(DateTime time) {
  String day = time.day.toString().padLeft(2, '0');
  String month = time.month.toString().padLeft(2, '0');
  String year = time.year.toString();
  return '$day.$month.${year}y';
}