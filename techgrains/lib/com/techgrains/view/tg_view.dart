import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// TGFramework's View related implementation
class TGView {
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

  /// Clears focus of current object. Generally used to hide keyboard
  static void clearFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  /// Snackbar widget
  static Widget snackBar(String text) {
    return SnackBar(content: Text(text));
  }

  /// Loading Indicator with given Color code
  static Widget loadingIndicator(Color color) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(color))));
  }
}
