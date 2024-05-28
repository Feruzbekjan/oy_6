import 'package:flutter/material.dart';
import 'package:iparcompany/assets/colors.dart';
import 'package:iparcompany/assets/fonts.dart';
import 'package:iparcompany/assets/icons.dart';
import 'package:iparcompany/assets/images.dart';
import 'package:iparcompany/assets/routes.dart';
import 'package:iparcompany/assets/theme.dart';

extension GeneralBuildContextExtension on BuildContext {
  AppColor get color {
    return AppColor();
  }

  AppIcons get icons {
    return AppIcons();
  }

  AppImages get images {
    return AppImages();
  }

  AppRouteNames get route {
    return AppRouteNames();
  }
AppTheme get theme {
    return AppTheme();
  }
  AppFonts get style {
    return theme.lightTheme().extension<AppFonts>()!;
  }

  
}
