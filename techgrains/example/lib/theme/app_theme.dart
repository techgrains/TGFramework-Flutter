import 'package:flutter/material.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class AppTheme {
  static load({bool flagDarkTheme = true}) {
    TextTheme textTheme = _deriveTextTheme();
    TGView.loadTheme(flagDarkTheme ? _createDarkTheme(textTheme) : _createLightTheme(textTheme));
  }

  static TextTheme _deriveTextTheme() {
    String? textTheme = TGSession.getInstance().get("textSize");
    switch (textTheme) {
      case "S":
        return _textThemeSmall;
      case "R":
        return _textThemeRegular;
      case "L":
        return _textThemeLarge;
    }
    return _textThemeRegular;
  }

  static ThemeData _createDarkTheme(TextTheme textTheme) {
    ColorScheme colorScheme = _darkColorScheme;
    return ThemeData(
      useMaterial3: true,
        colorScheme: colorScheme,
        brightness: colorScheme.brightness,
        canvasColor: colorScheme.onBackground,
        dialogBackgroundColor: colorScheme.onBackground,
        scaffoldBackgroundColor: colorScheme.inversePrimary,
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryContainer,
        primaryColorDark: colorScheme.onPrimaryContainer,
        secondaryHeaderColor: colorScheme.secondary,
        indicatorColor: colorScheme.secondary,
        hintColor: colorScheme.error,
        highlightColor: colorScheme.error,
        splashColor: colorScheme.surface,
        dividerColor: colorScheme.onSurface,
        disabledColor: colorScheme.surfaceVariant,
        cardColor: colorScheme.inversePrimary,
        focusColor: Colors.white.withOpacity(0.12),
        hoverColor: Colors.white.withOpacity(0.04),
        unselectedWidgetColor: Colors.white70,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorScheme.secondaryContainer),
          shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        )),
        textTheme: textTheme.apply(
          bodyColor: colorScheme.surfaceVariant,
          displayColor: colorScheme.surfaceTint,
        ));
  }
  static ColorScheme get _darkColorScheme => const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF1864AD),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xFF5D93C6),
    onPrimaryContainer: Color(0xFF11529C),
    secondary: Color(0xFF7CC242),
    onSecondary: Color(0xFF262626),
    secondaryContainer: Color(0xFF74BC3C),
    onSecondaryContainer: Color(0xFF74BC3C),
    tertiary: Colors.white,
    onTertiary: Colors.white70,
    tertiaryContainer: Colors.white70,
    onTertiaryContainer: Color(0xFF939393),
    error: Color(0xFFFF9E12),
    onError: Color(0xFFFF9E12),
    errorContainer: Color(0xFFFF9E12),
    onErrorContainer: Color(0xff410001),
    background: Color(0xfffbfbfb),
    onBackground: Color(0xFF2D2D2D),
    surface: Color(0xFF2D2D2D),
    onSurface: Color(0xFF7B7B7B),
    surfaceVariant: Color(0xFF707070),
    onSurfaceVariant: Color(0xFFD1D1D1),
    outline: Color(0xff6f7978),
    inverseSurface: Color(0xff313131),
    onInverseSurface: Color(0xfff0f0f0),
    inversePrimary: Color(0xFF1F1F1F),
    surfaceTint: Color(0xFF939393),
    shadow: Color(0xff000000),
  );

  static ThemeData _createLightTheme(TextTheme textTheme) {
    ColorScheme colorScheme = _lightColorScheme;
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        brightness: colorScheme.brightness,
        canvasColor: colorScheme.background,
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryContainer,
        primaryColorDark: colorScheme.onPrimaryContainer,
        secondaryHeaderColor: colorScheme.secondary,
        indicatorColor: colorScheme.secondary,
        hintColor: colorScheme.error,
        highlightColor: colorScheme.error,
        splashColor: colorScheme.surface,
        dividerColor: colorScheme.onSurface,
        disabledColor: colorScheme.surfaceVariant,
        cardColor: Colors.white,
        focusColor: Colors.black.withOpacity(0.12),
        hoverColor: Colors.black.withOpacity(0.04),
        unselectedWidgetColor: Colors.black54,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorScheme.secondaryContainer),
          shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        )),
        textTheme: textTheme.apply(
          bodyColor: colorScheme.surfaceVariant,
          displayColor: colorScheme.surfaceTint,
        ));
  }

  static ColorScheme get _lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF1864AD),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xFF5D93C6),
        onPrimaryContainer: Color(0xFF11529C),
        secondary: Color(0xFF7CC242),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xFF74BC3C),
        onSecondaryContainer: Color(0xFF74BC3C),
        tertiary: Colors.black,
        onTertiary: Colors.black87,
        tertiaryContainer: Color(0xFF515151),
        onTertiaryContainer: Color(0xFF646464),
        error: Color(0xFFFF9E12),
        onError: Color(0xFFFF9E12),
        errorContainer: Color(0xFFFF9E12),
        onErrorContainer: Color(0xff410001),
        background: Color(0xfffbfbfb),
        onBackground: Color(0xFF1864AD),
        surface: Color(0xFFF2F2F2),
        onSurface: Color(0xFFCBCBCB),
        surfaceVariant: Color(0xFF363636),
        onSurfaceVariant: Color(0xFF646464),
        outline: Color(0xff6f7978),
        inverseSurface: Color(0xff313131),
        onInverseSurface: Color(0xfff0f0f0),
        inversePrimary: Color(0xFF1864AD),
        surfaceTint: Color(0xFF969696),
        shadow: Color(0xff000000),
      );


  static const TextTheme _textThemeSmall = TextTheme(
    displayLarge: TextStyle(fontSize: 102.0, fontWeight: FontWeight.w300, letterSpacing: -3.5),
    displayMedium: TextStyle(fontSize: 92.0, fontWeight: FontWeight.w300, letterSpacing: -2.5),
    displaySmall: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headlineLarge: TextStyle(fontSize: 52.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headlineMedium: TextStyle(fontSize: 40.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headlineSmall: TextStyle(fontSize: 28.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    labelLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    labelMedium: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    labelSmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.normal, letterSpacing: 1.5),
  );

  static const TextTheme _textThemeRegular = TextTheme(
    displayLarge: TextStyle(fontSize: 114.0, fontWeight: FontWeight.w300, letterSpacing: -3.5),
    displayMedium: TextStyle(fontSize: 106.0, fontWeight: FontWeight.w300, letterSpacing: -2.5),
    displaySmall: TextStyle(fontSize: 96.0, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headlineLarge: TextStyle(fontSize: 60.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headlineMedium: TextStyle(fontSize: 48.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headlineSmall: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    titleMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, letterSpacing: 1.5),
  );

  static const TextTheme _textThemeLarge = TextTheme(
    displayLarge: TextStyle(fontSize: 122.0, fontWeight: FontWeight.w300, letterSpacing: -4.5),
    displayMedium: TextStyle(fontSize: 114.0, fontWeight: FontWeight.w300, letterSpacing: -3.5),
    displaySmall: TextStyle(fontSize: 112.0, fontWeight: FontWeight.w300, letterSpacing: -2.5),
    headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headlineMedium: TextStyle(fontSize: 58.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    headlineSmall: TextStyle(fontSize: 40.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    titleLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.normal, letterSpacing: 0.0),
    titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),
    labelMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    labelSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 1.5),
  );
}
