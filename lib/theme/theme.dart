import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hex_color.dart';
import 'app_color.dart';

class AppTheme {
  const AppTheme();

  static TextTheme _buildTextTheme(TextTheme base) {
    final b = GoogleFonts.ptSansTextTheme(base);
    return GoogleFonts.ptSansTextTheme(base).copyWith(
      headline1:
          b.headline1?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      headline2:
          b.headline2?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      headline3:
          b.headline3?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      headline4:
          b.headline4?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      headline5:
          b.headline5?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      headline6:
          b.headline6?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      subtitle1:
          b.subtitle1?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      subtitle2:
          b.subtitle2?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      bodyText1:
          b.bodyText1?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      bodyText2:
          b.bodyText2?.copyWith(color: HexColor("#11365D").withOpacity(1)),
      caption: b.caption?.copyWith(
          color: HexColor("#83888c").withOpacity(1),
          fontWeight: FontWeight.w600,
          fontSize: 11),
      button: b.button?.copyWith(fontFamily: 'arial'),
      overline: b.overline?.copyWith(fontFamily: 'arial'),
    );
  }

  static ThemeData buildLightTheme() {
    final Color primaryColor = AppColors.primary;
    Color secondaryColor = AppColors.accent;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      // ignore: deprecated_member_use
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      // ignore: deprecated_member_use
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: AppColors.backgroundColorGrey,
      scaffoldBackgroundColor: AppColors.backgroundColorGrey,
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(elevation: 0, color: AppColors.dark),

      textTheme: _buildTextTheme(
        base.textTheme,
      ),
      primaryTextTheme: _buildTextTheme(
        base.primaryTextTheme,
      ),

      platform: TargetPlatform.iOS,
    );
  }
}
