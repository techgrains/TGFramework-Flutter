import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TGView {
// Common Scaffold
  static Scaffold scaffoldContainer(List<Widget> widgets, {Container backgroundContainer}) {
    return Scaffold(
      body: Container(
        child: new Stack(
          children: <Widget>[
            backgroundContainer != null ? backgroundContainer : emptyContainer(),
            sliverScrollView(widgets),
          ],
        ),
      ),
    );
  }

// Common Background Container
  static Container emptyContainer() {
    return Container();
  }

// Common Sliver Scroll View
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

// Generic
  static Widget emptySizedBox({double height, double width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

// Keyboard
  static void clearFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

// Snackbar
  static Widget snackBar(String text) {
    return SnackBar(content: Text(text));
  }

// Loading Indicator
  static Widget loadingIndicator(Color color) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(color)
            )
        )
    );
  }
}
