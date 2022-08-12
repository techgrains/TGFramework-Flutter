import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

/// TGFramework's Text related implementation based on various styles of TextTheme
class TGText {
  // ***   Typography   *** //

  /// "displayLarge" style text
  static Text displayLarge(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().displayLarge, color));
  }

  /// "displayMedium" style text
  static Text displayMedium(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().displayMedium, color));
  }

  /// "displaySmall" style text
  static Text displaySmall(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().displaySmall, color));
  }

  /// "headlineLarge" style text
  static Text headlineLarge(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().headlineLarge, color));
  }

  /// "headlineMedium" style text
  static Text headlineMedium(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().headlineMedium, color));
  }

  /// "headlineSmall" style text
  static Text headlineSmall(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().headlineSmall, color));
  }

  /// "titleLarge" style text
  static Text titleLarge(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().titleLarge, color));
  }

  /// "titleMedium" style text
  static Text titleMedium(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().titleMedium, color));
  }

  /// "titleSmall" style text
  static Text titleSmall(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().titleSmall, color));
  }

  /// "bodyLarge" style text
  static Text bodyLarge(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().bodyLarge, color));
  }

  /// "bodyMedium" style text
  static Text bodyMedium(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().bodyMedium, color));
  }

  /// "bodySmall" style text
  static Text bodySmall(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().bodySmall, color));
  }

  /// "labelLarge" style text
  static Text labelLarge(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().labelLarge, color));
  }

  /// "labelMedium" style text
  static Text labelMedium(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().labelMedium, color));
  }

  /// "labelSmall" style text
  static Text labelSmall(String text, {Color? color}) {
    return Text(text, style: _merge(TGView.textTheme().labelSmall, color));
  }

  static TextStyle? _merge(TextStyle? textStyle, Color? color) {
    if (color != null) {
      textStyle = textStyle?.merge(TextStyle(color: color));
    }
    return textStyle;
  }
}
