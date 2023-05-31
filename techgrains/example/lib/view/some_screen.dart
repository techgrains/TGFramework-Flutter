import 'package:app/common/keys.dart';
import 'package:app/view/app_init.dart';
import 'package:app/view/view_constant.dart';
import 'package:flutter/material.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class SomeScreen extends StatelessWidget {
  const SomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: TGView.theme()!.scaffoldBackgroundColor,
      body: _SplashBody(),
    );
  }
}

class _SplashBody extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<_SplashBody> {
  @override
  void initState() {
    TGLog.d("Splash.initState()");
    super.initState();
    _asyncInit();
  }

  _asyncInit() async {
    TGLog.d("Splash._asyncInit()");
    await _init();
    checkAutoLogin();
  }

  Future<void> _init() async {
    TGLog.d("_init: Start");
    await initTheme(context);
    await initUser();
    await initProfile();
    await initService();
    await initAppVersionInfo();
    await initLocale();
    TGLog.d("_init: End");
  }

  void checkAutoLogin() {
    TGLog.d("Splash.checkAutoLogin()");
    if (TGSession.getInstance().get(KEY_OBJ_USER) == null) {
      Navigator.of(context).pushReplacementNamed(ROUTE_HOME);
    } else {
      Navigator.of(context).pushReplacementNamed(ROUTE_DASHBOARD);
    }
  }

  @override
  Widget build(BuildContext context) {
    TGLog.d("Splash.build()");
    return Scaffold(
      body: Container(
        color: TGView.colorScheme().inversePrimary,
        alignment: Alignment.center,
      ),
      backgroundColor: TGView.colorScheme().inversePrimary,
    );
  }
}
