import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

/// TGFramework's Text related implementation based on various styles of TextTheme
class TGText {
  // ***   Typography   *** //

  /// "displayLarge" style text
  static Text displayLarge(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().displayLarge, color),
        textAlign: textAlign);
  }

  /// "displayMedium" style text
  static Text displayMedium(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().displayMedium, color),
        textAlign: textAlign);
  }

  /// "displaySmall" style text
  static Text displaySmall(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().displaySmall, color),
        textAlign: textAlign);
  }

  /// "headlineLarge" style text
  static Text headlineLarge(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().headlineLarge, color),
        textAlign: textAlign);
  }

  /// "headlineMedium" style text
  static Text headlineMedium(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().headlineMedium, color),
        textAlign: textAlign);
  }

  /// "headlineSmall" style text
  static Text headlineSmall(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().headlineSmall, color),
        textAlign: textAlign);
  }

  /// "titleLarge" style text
  static Text titleLarge(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().titleLarge, color),
        textAlign: textAlign);
  }

  /// "titleMedium" style text
  static Text titleMedium(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().titleMedium, color),
        textAlign: textAlign);
  }

  /// "titleSmall" style text
  static Text titleSmall(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().titleSmall, color),
        textAlign: textAlign);
  }

  /// "bodyLarge" style text
  static Text bodyLarge(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().bodyLarge, color),
        textAlign: textAlign);
  }

  /// "bodyMedium" style text
  static Text bodyMedium(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().bodyMedium, color),
        textAlign: textAlign);
  }

  /// "bodySmall" style text
  static Text bodySmall(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().bodySmall, color),
        textAlign: textAlign);
  }

  /// "labelLarge" style text
  static Text labelLarge(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().labelLarge, color),
        textAlign: textAlign);
  }

  /// "labelMedium" style text
  static Text labelMedium(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().labelMedium, color),
        textAlign: textAlign);
  }

  /// "labelSmall" style text
  static Text labelSmall(String text,
      {Color? color, TextAlign textAlign = TextAlign.start}) {
    return Text(text,
        style: _merge(TGView.textTheme().labelSmall, color),
        textAlign: textAlign);
  }

  static TextStyle? _merge(TextStyle? textStyle, Color? color) {
    if (color != null) {
      textStyle = textStyle?.merge(TextStyle(color: color));
    }
    return textStyle;
  }
}
