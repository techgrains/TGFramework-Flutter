import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

/// TGFramework's Text related implementation based on various styles of TextTheme
class TGText {
  // ***   Typography   *** //

  /// "custom" style text
  static Text withStyle(String text, TextStyle textStyle,
      {FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: (overflow != null
          ? overflow
          : (maxLine != null && maxLine > 0
              ? TextOverflow.ellipsis
              : TextOverflow.visible)),
      maxLines: maxLine,
      style: textStyle,
    );
  }

  /// "displayLarge" style text
  static Text displayLarge(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().displayLarge, color, fontWeight),
        textAlign: textAlign);
  }

  /// "displayMedium" style text
  static Text displayMedium(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().displayMedium, color, fontWeight),
        textAlign: textAlign);
  }

  /// "displaySmall" style text
  static Text displaySmall(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().displaySmall, color, fontWeight),
        textAlign: textAlign);
  }

  /// "headlineLarge" style text
  static Text headlineLarge(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().headlineLarge, color, fontWeight),
        textAlign: textAlign);
  }

  /// "headlineMedium" style text
  static Text headlineMedium(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().headlineMedium, color, fontWeight),
        textAlign: textAlign);
  }

  /// "headlineSmall" style text
  static Text headlineSmall(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
    int? maxLine,
  }) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().headlineSmall, color, fontWeight),
        textAlign: textAlign);
  }

  /// "titleLarge" style text
  static Text titleLarge(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().titleLarge, color, fontWeight),
        textAlign: textAlign);
  }

  /// "titleMedium" style text
  static Text titleMedium(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().titleMedium, color, fontWeight),
        textAlign: textAlign);
  }

  /// "titleSmall" style text
  static Text titleSmall(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().titleSmall, color, fontWeight),

        //style: TextStyle(fontFamily: fontFamily, color: Colors.red, fontWeight: FontWeight.bold),

        textAlign: textAlign);
  }

  /// "bodyLarge" style text
  static Text bodyLarge(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
    int? maxLine,
  }) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().bodyLarge, color, fontWeight),
        textAlign: textAlign);
  }

  /// "bodyMedium" style text
  static Text bodyMedium(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    TextAlign textAlign = TextAlign.start,
    TextOverflow? overflow,
    int? maxLine,
  }) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().bodyMedium, color, fontWeight),
        textAlign: textAlign);
  }

  /// "bodySmall" style text
  static Text bodySmall(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().bodySmall, color, fontWeight),
        textAlign: textAlign);
  }

  /// "labelLarge" style text
  static Text labelLarge(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().labelLarge, color, fontWeight),
        textAlign: textAlign);
  }

  /// "labelMedium" style text
  static Text labelMedium(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().labelMedium, color, fontWeight),
        textAlign: textAlign);
  }

  /// "labelSmall" style text
  static Text labelSmall(String text,
      {Color? color,
      FontWeight? fontWeight,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow,
      int? maxLine}) {
    return Text(text,
        overflow: (overflow != null
            ? overflow
            : (maxLine != null && maxLine > 0
                ? TextOverflow.ellipsis
                : TextOverflow.visible)),
        maxLines: maxLine,
        style: _merge(TGView.textTheme().labelSmall, color, fontWeight),
        textAlign: textAlign);
  }

  static TextStyle? _merge(
      TextStyle? textStyle, Color? color, FontWeight? fontWeight) {
    if (color != null && fontWeight != null) {
      return textStyle?.merge(TextStyle(color: color, fontWeight: fontWeight));
    }
    if (color != null) {
      return textStyle?.merge(TextStyle(color: color));
    }
    if (fontWeight != null) {
      return textStyle?.merge(TextStyle(fontWeight: fontWeight));
    }
    return textStyle;
  }
}
