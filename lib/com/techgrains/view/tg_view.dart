import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// TGFramework's View related implementation
class TGView {
  static ThemeData _theme;

  // ***   Theme   *** //

  /// Reference of Theme
  static ThemeData theme() {
    if (_theme == null) loadLightTheme();
    return _theme;
  }

  /// Load Default Light Theme
  static void loadLightTheme() {
    _theme = ThemeData.light();
  }

  /// Load Default Dark Theme
  static void loadDarkTheme() {
    _theme = ThemeData.dark();
  }

  /// Load Theme by provided ThemeData
  static void loadTheme(ThemeData themeData) {
    _theme = themeData;
  }

  /// Reference of TextTheme
  static TextTheme textTheme() {
    return theme().textTheme;
  }

  /// Reference of AppBarTheme
  static AppBarTheme appBarTheme() {
    return theme().appBarTheme;
  }

  /// Reference of TabBarTheme
  static TabBarTheme tabBarTheme() {
    return theme().tabBarTheme;
  }

  /// Reference of TargetPlatform
  static TargetPlatform platform() {
    return theme().platform;
  }

  // ***   Colors   *** //

  /// Body Color: TextTheme applies `bodyColor` to headline5, headline6, subtitle1, subtitle2, button, bodyText1, bodyText2 and overline.
  static Color bodyColor() {
    return textTheme().bodyText1.color;
  }

  /// Display Color: TextTheme applies `displayColor` is applied to headline1, headline2, headline3, headline4 and caption.
  static Color displayColor() {
    return textTheme().caption.color;
  }

  // ***   Divider   *** //

  /// Standard Divider
  static Widget divider({double height}) {
    return Divider(height: height, color: theme().dividerColor);
  }

  // ***   Container   *** //

  /// Common Scaffold Container
  static Scaffold scaffoldContainer(List<Widget> widgets,
      {Container backgroundContainer}) {
    return Scaffold(
      body: Container(
        child: new Stack(
          children: <Widget>[
            backgroundContainer != null
                ? backgroundContainer
                : emptyContainer(),
            sliverScrollView(widgets),
          ],
        ),
      ),
    );
  }

  /// Empty Background Container
  static Container emptyContainer() {
    return Container();
  }

  /// Customer Scroll View with Sliver List
  static Container sliverScrollView(List<Widget> widgets) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              widgets,
            ),
          ),
        ],
      ),
    );
  }

  /// Empty Sized Box with given height and/or width
  static Widget emptySizedBox({double height, double width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  /// Row container to display widgets row. Left & Right aligned
  static Container rowContainer(
      {EdgeInsetsGeometry margin,
      EdgeInsetsGeometry padding,
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
      Color color = Colors.transparent,
      List<Widget> left,
      List<Widget> center,
      List<Widget> right}) {
    if (margin == null) margin = EdgeInsets.all(0);
    if (padding == null) padding = EdgeInsets.all(0);
    List<Widget> children = [];

    if (left != null) {
      children.add(Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: left,
        ),
      ));
    }
    if (center != null) {
      children.add(Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: center,
      )));
    }
    if (right != null) {
      if (center != null) {
        children.add(Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: right,
        )));
      } else {
        children.addAll(right);
      }
    }

    return Container(
      margin: margin,
      padding: padding,
      color: color,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }

  /// Column container to display
  static Container columnContainer(
      {EdgeInsetsGeometry margin,
      EdgeInsetsGeometry padding,
      Color color = Colors.transparent,
      CrossAxisAlignment crossAxisAlignment,
      MainAxisAlignment mainAxisAlignment,
      List<Widget> children}) {
    if (margin == null) margin = EdgeInsets.all(0);
    if (crossAxisAlignment == null)
      crossAxisAlignment = CrossAxisAlignment.center;
    if (mainAxisAlignment == null) mainAxisAlignment = MainAxisAlignment.start;
    return Container(
      margin: margin,
      padding: padding,
      color: color,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }

  /// Multiple Columns container to display
  static Container columnsContainer({
    List<List<Widget>> columns,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    Color color = Colors.transparent,
    MainAxisAlignment mainAxisAlignment,
    CrossAxisAlignment crossAxisAlignment,
  }) {
    if (margin == null) margin = EdgeInsets.all(0);
    if (crossAxisAlignment == null)
      crossAxisAlignment = CrossAxisAlignment.center;
    if (mainAxisAlignment == null) mainAxisAlignment = MainAxisAlignment.start;
    List<Widget> children = [];
    columns.forEach((column) {
      children.add(
        Expanded(
            child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                children: column)),
      );
    });
    return Container(
      margin: margin,
      padding: padding,
      color: color,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }

  /// Box Container
  static Container boxContainer(
      {EdgeInsetsGeometry margin,
      EdgeInsetsGeometry padding,
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
      Color color = Colors.transparent,
      Color borderColor = Colors.transparent,
      List<Widget> children,
      double borderWidth = 0.5,
      double borderRadius = 10}) {
    if (margin == null) margin = EdgeInsets.all(0);
    if (padding == null) padding = EdgeInsets.all(0);
    return Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
              width: borderWidth, color: borderColor, style: BorderStyle.solid),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ));
  }

  // ***   App Bar   *** //

  /// App Bar Back Button
  static IconButton appBarBackButton(
      {@required BuildContext context, IconData icon = Icons.arrow_back_ios}) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  // ***   Notifications   *** //

  /// Show Snackbar
  static void showSnackBar(
      {@required BuildContext context,
      @required String message,
      Duration duration,
      Color backgroundColor,
      SnackBarBehavior behavior = SnackBarBehavior.floating}) {
    if (duration == null) duration = Duration(seconds: 2);
    if (backgroundColor == null) backgroundColor = theme().accentColor;
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: behavior,
      duration: duration,
    ));
  }

  /// Loading Indicator with given Color code
  static Widget loadingIndicator(Color color) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(color))));
  }

  /// Show alert dialog with various components
  static void showAlertDialog(
      {@required BuildContext context,
      List<Widget> titleRowWidgets,
      Widget content,
      List<Widget> actions,
      Function onDismiss}) {
    if (titleRowWidgets == null) titleRowWidgets = [];
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: Row(children: titleRowWidgets),
              content: content,
              actions: actions,
            )).then((value) => {
          if (onDismiss != null)
            onDismiss()
          else
            Navigator.of(context).pop(false)
        });
  }

  /// Popup Menu Item
  static PopupMenuItem popupMenuItem(
      {IconData icon,
      String text,
      dynamic value,
      Color iconColor,
      Color textColor}) {
    return PopupMenuItem(
        value: value,
        child: rowContainer(margin: EdgeInsets.all(0), left: [
          if (icon != null) Icon(icon, color: iconColor),
          if (icon != null) TGView.emptySizedBox(width: 10),
          if (text != null) Text(text, style: TextStyle(color: textColor))
        ]));
  }

  /// Refresh Indicator
  static RefreshIndicator refreshIndicator(
      {List<Widget> widgets,
      Function onRefresh,
      Color backgroundContainerColor = Colors.transparent}) {
    return RefreshIndicator(
      child: scaffoldContainer(widgets,
          backgroundContainer: Container(color: backgroundContainerColor)),
      onRefresh: onRefresh,
    );
  }

  // ***   Utility Actions   *** //

  /// Clears focus of current object. Generally used to hide keyboard
  static void clearFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
