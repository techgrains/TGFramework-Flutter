# TGFramework-Flutter
Purpose of TGFramework is to provide developer friendly library, that can help to improve feature development rather focusing on common structure creation during every mobile app development. 

## How to Use
Add dependency to your package's `pubspec.yaml`
```
dependencies:
    techgrains: 1.0.6
```

## Areas
TGFramework includes following areas as part of its framework. Further in this document, all of them explained with example.

* Common
  * TGLog
    * Levels: Debug, Info, Error, Warn, Tag, All, Off  
* Memory
  * TGSession: In memory Session throughout the app 
  * TGSharedPreference: Shared Preferences (Android), User Defaults (iOS)
* Localization (i18n)
  * TGLocale: Supported, default and current locale holders with locale related supporting features
  * TGLocalization: Localization for each locale loads values from json file
  * TGLocalizationsDelegate: Extended implementation of LocalizationsDelegate which Flutter uses internally
* Util
  * TGDateUtil
    * Format DateTime
    * Parse DateTime
  * TGNetUtil
    * Check Internet Availability
  * TGFileUtil
    * Read Local File
  * TGValidate
    * Validate Email, Alphabets, Numeric, Alphanumeric
* View
  * TGView
    * Theme
    * Scaffold Container
    * Custom Scroll View using Sliver List
    * Empty Sized Box
    * Clear Focus (Hide Keyboard)
    * Snackbar
    * Loading Indicator
  
## Common
### TGLog
##### Logging mechanism levels
* `ALL`, `TAG`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `OFF`

By default, Log Level is `ALL`. If wants to change, set in your app's initState().
```
[main.dart]
    @override
    void initState() {
        super.initState();
        TGLog.setLogLevel(TGLogLevel.DEBUG);
        ...
    }
```
How to Log which prints output in the console.
```
[Log]
    TGLog.t("TAG", "Tag log");  // Tag
    TGLog.d("Debug log");       // Debug
    TGLog.i("Info log");        // Info
    TGLog.w("Warning log");     // Warn
    TGLog.e("Error log");       // Error

[Output]
    2020-04-30 12:48:09.955850[TAG] Tag log
    2020-04-30 12:48:09.958239[DEBUG] Debug log
    2020-04-30 12:48:09.958661[INFO] Info log
    2020-04-30 12:48:09.958964[WARN] Warning log
    2020-04-30 12:48:09.959226[ERROR] Error log
```
## Memory
### TGSession
Single Session instance in memory to hold values in memory as Key-Value pair. No need to inherit or initialize anything.

#### Where to use:
- Whenever data is common across layers
- Managing data in memory without any disk-io
- When data become invalid after app close

Between Screens: 
Just straight put things in one screen and use it in another one.
```
[Profile Screen]
    TGSession.getInstance().set("Designation","Developer");

[Home Screen]
    String designation = TGSession.getInstance().get("Designation");
```
Between service and view layer: Just put in service and have it in view. (Easy to put any object.)
```
[Service]
    TGSession.getInstance().put("Person",Person);

[Screen 
    Person person = TGSession.getInstance().get("Person");
``` 
Thinking to manage piled up objects in session?
```
    TGSession.getInstance().remove("Person");
```

### TGSharedPreference
Access local disk storage mechanism through TGSharedPreference. Its uses Shared Preferences for Android, User Defaults for iOS internally. No need to inherit or initialize anything.
```
    TGSharedPreferences.getInstance().set("Designation", "Developer"); // Set
    await TGSharedPreferences.getInstance().get("Designation"); // Get
```  


## Localization (i18n)
  ### TGLocale
  Supported, default and current locale holders with locale related supporting features
  
  ### TGLocalization
  Localization for each locale loads values from json file
  
  ### TGLocalizationsDelegate
  Extended implementation of LocalizationsDelegate which Flutter uses internally

##### Configuration dependencies in pubspec.yaml
```
[pubspec.yaml]
    dependencies:
      flutter:
        sdk: flutter
      flutter_localizations:
        sdk: flutter

  assets:
    - assets/locale/
```
##### Put locale files at "assets/locale/"
```
[assets/locale/en_US.json]
    {
      "button.login": "Login"
    }
```
##### Setup locale in your main dart
```
[main.dart]
    @override
    void initState() {
      TGLocale.init(
        defaultLocale:
          const Locale("en", "US"), // en_US.json
        otherLocales: [
          const Locale("gu", "IN"), // gu_IN.json
          const Locale("hi", "IN")  // hi_IN.json
        ]
      );
    }

    MaterialApp(
    ...
      theme: TGView.theme(),
      supportedLocales: TGLocale.supportedLocales,
      locale: TGLocale.currentLocale,
      localizationsDelegates: [TGLocalizationsDelegate(), GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
      localeResolutionCallback: (locale, supportedLocales) => TGLocale.localeResolutionCallback(locale, supportedLocales),
    ...
    )
```
##### How to get text from locale
```
    TGLocale.text(context, "button.login")
```
##### How to change locale
```
[set locale]
    setLocale("en_US");
    ...
    setLocale(String localeCode) {
      setState(() {
        TGLocale.currentLocale = TGLocale.findLocaleByCode(localeCode );
      });
    }
    // -- OR -- //
    setLocale(Locale locale) {
      setState(() {
        TGLocale.currentLocale = locale;
      });
    }
```

##### Helper methods just in case needed anywhere
```
[Find locale by code]
    Locale locale = TGLocale.findLocaleByCode("en_US");

[Generate code by locale]
    Locale locale = Locale("en", "US");
    String localeCode = TGLocale.generateCode(locale); // returns "en_US"

```


## Util

### TGDateUtil

#### Format
```
[Default Pattern]
    TGDateUtil.formatDate(date); //"2020-05-16"
    TGDateUtil.formatDateTime(dateTime); //"2020-05-16 12:47:52"

[Custom Pattern]
    TGDateUtil.formatDate(date, datePattern: "dd/MM/yyyy"); //"16/05/2020"
    TGDateUtil.formatDateTime(dateTime, dateTimePattern: "dd/MM/yyyy HH:mm:ss"); //"16/05/2020 12:47:52"
```
#### Parse
```
[Default Pattern]
    DateTime date = TGDateUtil.parseDate("2020-05-16");
    DateTime dateTime = TGDateUtil.parseDateTime("2020-05-16 12:47:52");

[Custom Pattern]
    DateTime date = TGDateUtil.parseDate("16/05/2020", datePattern: "dd/MM/yyyy");
    DateTime dateTime = TGDateUtil.parseDateTime("16/05/2020T12:47:52", dateTimePattern: "dd/MM/yyyyTHH:mm:ss");
```

### TGNetUtil
#### Check inernet availability
```
    if(await TGNetUtil.isInternetAvailable()) {
        ...
    }
```

### TGFileUtil
#### Read File as String
```
    String content = await TGFileUtil.readFileAsString("assets/files/company.txt");
```

### TGValidate
Validators like email, alphabets, numeric, alphanumeric.
```
[Email]
    TGValidate.email("valid@email.com")

[Alphabets]
    TGValidate.alphabets("AbcPqrXyz");

[Numeric]
    TGValidate.numeric("1234567890");

[Alphanumeric]
    TGValidate.alphanumeric("abc123");
```

## View
### TGView
Common view object creation and helper.

#### Theme
```
[main.dart] 
    @override
    void initState() {
        super.initState();
        TGView.loadDark();
        ...
    }

[Usage 1: Passing in MaterialApp()]
    child: MaterialApp(
        ...
        theme: TGView.theme(),
        initialRoute: ...
    ),

[Usage 2: Give particular color from Theme]
    IconButton(
        ...
        color: TGView.theme().primaryColor,
        onPressed: ...
    );
```

Options to load theme different ways
```
    TGView.loadLightTheme(); // Default Light
    TGView.loadDarkTheme(); // Default Dark
    TGView.loadTheme(...); // ThemeData
```

#### Scaffold Container
Provide custom background and list of widgets to render.
```
[Without Background]
    List<Widget> widgets = ...; // Initialise
    Scaffold scaffold = TGView.scaffoldContainer(widgets);

[With Background]
    List<Widget> widgets = ...; // Initialise
    Container background = ...; // Initialise
    Scaffold scaffold = TGView.scaffoldContainer(widgets, backgroundContainer: background);
```

#### Custom Scroll View having Sliver List
Custom Scroll View 
```
    Container container = TGView.sliverScrollView();
```

#### Empty Sized Box
To create empty box by providing height, width or both.
```
    TGView.emptySizedBox(height: 50);
```

#### Clear Focus (Hide Keyboard)
```
    TGView.clearFocus(context); 
```

#### Snackbar
```
    TGView.snackBar("Email has been sent!");
```

#### Loading Indicator
```
    TGView.loadingIndicator(Colors.blue);
```

