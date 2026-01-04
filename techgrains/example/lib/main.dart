import 'package:app/theme/app_theme.dart';
import 'package:app/view/some_screen.dart';
import 'package:app/view/view_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/localization/tg_localizations_delegate.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

void main() => runApp(const TechgrainsExampleApp());

class TechgrainsExampleApp extends StatefulWidget {
  static _TechgrainsExampleAppState? _state;

  const TechgrainsExampleApp({super.key});

  @override
  State<TechgrainsExampleApp> createState() => _TechgrainsExampleAppState();

  static void buildTheme(bool? flagDarkTheme, String textSize) async {
    TGLog.d("TGPortalApp.buildTheme : flagDarkTheme = $flagDarkTheme");
    _state?.buildTheme(flagDarkTheme);
  }

  static void setLocale(Locale locale) async {
    TGLog.d("TGPortalApp.setLocale : $locale");
    _state?.setLocale(locale);
  }
}

class _TechgrainsExampleAppState extends State<TechgrainsExampleApp> {
  static String configFlavorsFile = "assets/config/flavors.json";

  buildTheme(bool? flagDarkTheme) {
    setState(() {
      AppTheme.load(flagDarkTheme: flagDarkTheme!);
    });
  }

  setLocale(Locale locale) {
    setState(() {
      TGLocale.currentLocale = locale;
      TGLog.d("_TGPortalAppState.setLocale = ${TGLocale.currentLocale}");
    });
  }

  @override
  void didChangeDependencies() {
    TGLog.d("main.didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    // Assign static reference
    TechgrainsExampleApp._state = this;

    TGLog.d("main.initState()");
    _initFlavor();
    _initLocale();
  }

  void _initFlavor() {
    TGFlavor.init(configFlavorsFile);
  }

  void _initLocale() {
    TGLocale.init(
        defaultLocale: const Locale("en", "US"),
        otherLocales: [const Locale("gu", "IN"), const Locale("hi", "IN")]);
  }

  @override
  Widget build(BuildContext context) {
    TGLog.d("main.build");
    TGLog.d("TGLocale.currentLocale = ${TGLocale.currentLocale}");
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (TGView.theme() == null) {
      TGSession.getInstance().set("flagDarkTheme", true);
      buildTheme(true);
    }
    return TGView.clearFocusGesture(context, buildMaterialApp());
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TGView.theme(),
        supportedLocales: TGLocale.supportedLocales,
        locale: TGLocale.currentLocale,
        localizationsDelegates: const [TGLocalizationsDelegate()],
        localeResolutionCallback: (locale, supportedLocales) =>
            TGLocale.localeResolutionCallback(locale, supportedLocales),
        initialRoute: routeSplash,
        routes: <String, WidgetBuilder>{
          routeSplash: (BuildContext context) => const SomeScreen(),
          routeLogin: (BuildContext context) => const SomeScreen(),
          routeRegister: (BuildContext context) => const SomeScreen(),
          routeForgotPassword: (BuildContext context) => const SomeScreen(),
          routeHome: (BuildContext context) => const SomeScreen(),
          routeDashboard: (BuildContext context) => const SomeScreen(),
          routeProfile: (BuildContext context) => const SomeScreen(),
          routeChangePassword: (BuildContext context) => const SomeScreen(),
        });
  }
}
