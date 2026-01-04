# TGFramework-Flutter

Purpose of TGFramework is to provide developer friendly library, that can help to improve feature development rather focusing on common structure creation
during every mobile app development.

TGFramework includes following areas as part of its framework. Further, in this document, all of them explained with example.

* Common
    * TGLog
        * Levels: Debug, Info, Error, Warn, Tag, All, Off
* Memory
    * TGSession: In memory Session throughout the app
    * TGSharedPreference: Shared Preferences (Android), User Defaults (iOS)
    * TGAccessMatrix: In memory Access Matrix based on Access Key with Roles
* Localization (i18n)
    * TGLocale: Supported, default and current locale holders with locale related supporting features
    * TGLocalization: Localization for each locale loads values from json file
    * TGLocalizationsDelegate: Extended implementation of LocalizationsDelegate which Flutter uses internally
* Util
    * TGFlavor
        * Supports name, baseUrl, logLevel, applyMock, mockMappingsFile & custom params as part of configuration
    * TGDateUtil
        * Format DateTime
        * Parse DateTime
        * Convert DateTime between Timezones
    * TGNetUtil
        * Check Internet Availability
        * Check internet And Api Health
    * TGFileUtil
        * Read Local File
    * TGPlatformUtil
        * Check platform related properties like iOS, Android, Mobile, Package Config, Local Host Name, Operating System etc.
    * TGValidate
        * Validate Email, Alphabets, Numeric, Alphanumeric

* Service
    * TGService
        * TGRequest
            * TGPostRequest, TGGetRequest, TGPutRequest, TGDeleteRequest, TGPatchRequest, TGUploadRequest, TGUploadFilesRequest
        * TGResponse
        * TGError
        * Mock
* View
    * TGView
        * Theme
        * Scaffold Container
        * Custom Scroll View using Sliver List
        * Empty Sized Box
        * Row Container
        * Column Container
        * Columns Container
        * Box Container
        * Clear Focus
        * Clear Focus with Gesture
        * Banner
        * Body Color
        * Display Color
        * Divider
        * App Bar Back Button
        * Show Snack Bar
        * Show Alert Dialog
        * Popup Menu Item
        * Loading Indicator
        * Refresh Indicator
    * TGText
        * Render Text

## Common

### TGLog

##### Logging mechanism levels

* `ALL`, `TAG`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `OFF`

By default, Log Level is `ALL`. If it needs to be changed, set in your app's initState().

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

[Screen] 
    Person person = TGSession.getInstance().get("Person");
``` 

Time sensitive key-value setup via future Duration. After validity duration, won't return value through get.
```
    TGSession.getInstance().set("allowPayment", true, validFor: Duration(minutes: 1));
``` 

Thinking to manage piled up objects in session?

```
    TGSession.getInstance().remove("Person");
```

##### Custom TGSession Listener

Use TGSessionListener with custom implementation to listen whenever any key has been set/removed to/from TGSession.

### TGSharedPreference

Access local disk storage mechanism through TGSharedPreference. Its uses Shared Preferences for Android, User Defaults for iOS internally. No need to inherit or
initialize anything.

```
    await TGSharedPreferences.getInstance().set("Designation", "Developer"); // Set
    await TGSharedPreferences.getInstance().get("Designation"); // Get
```  

Time sensitive key-value setup via future Duration. After validity duration, won't return value through get.
```
    await TGSharedPreferences.getInstance().set("allowPayment", true, validFor: Duration(minutes: 1));
``` 

##### Custom TGSharedPreferences Listener

Use TGSharedPreferencesListener with custom implementation to listen whenever any key has been set/removed to/from TGSharedPreferences.

### TGAccessMatrix

In memory Access Matrix based on Access Key with Roles. No need to put business logic based on Roles in various parts of the application. Centralised common
structure of access gives full flexibility to manage with multiple roles from api.

#### Create access matrix for each role and add them into TGAccessMatrix

```
    TGAccessMatrixVO employeeAccess = TGAccessMatrixVO(key: "Profile", roleId: 1, read: true, update: true, delete: false, create: false);
    TGAccessMatrixVO editorAccess = TGAccessMatrixVO(key: "Profile", roleId: 2, read: true, update: true, delete: false, create: false);

    TGAccessMatrix.getInstance().addAll([employeeAccess, editorAccess]);
```

#### Apply roles whenever user login (or scope of change in roles)

```
    TGAccessMatrix.getInstance().applyRoles([1,2]);
```  

#### Use access matrix from anywhere (Uses default applied roles from above)

```
    TGAccessMatrix.getInstance().hasRead("Profile");
    TGAccessMatrix.getInstance().hasUpdate("Profile");
    TGAccessMatrix.getInstance().hasDelete("Profile");
    TGAccessMatrix.getInstance().hasCreate("Profile");
```  

#### How to override default roles by providing roleIds explicitly

```
    TGAccessMatrix.getInstance().hasRead("Profile", roleIds: [3]);
    TGAccessMatrix.getInstance().hasUpdate("Profile", roleIds: [3]);
    TGAccessMatrix.getInstance().hasDelete("Profile", roleIds: [3]);
    TGAccessMatrix.getInstance().hasCreate("Profile", roleIds: [3]);
```  

## Localization (i18n)

### TGLocale

Supported, default and current locale holders with a locale related supporting features

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
        ],
        customPath: "/data/user/0/com.test.test/files/" // Locale folder custom path if provided else load files from 'assets/locale/'
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
[Without arguments]
    TGLocale.text("button.login"); // Having "button.login": "Login"

[With arguments]
    TGLocale.text("message.hello", args: ["Amit Patel"]); // Having "message.hello": "Welcome {0} to our team!"
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

### TGFlavor

#### Initialize

```
  TGFlavor.init("assets/config/flavors.json");
```

#### flavors.json

```
[
  {
    "name": "dev",
    "baseUrl": "https://dev.api.tgportal.com",
    "logLevel": "DEBUG",
    "applyMock": true,
    "mockMappingsFile": "assets/mocks/_mappings.json",
    "params": {
      "key": "dev value"
    }
  },
  {
    "name": "stage",
    "baseUrl": "https://stage.api.tgportal.com",
    "logLevel": "INFO",
    "applyMock": false,
    "params": {
      "key": "stage value"
    }
  },
  {
    "name": "prod",
    "baseUrl": "https://api.tgportal.com",
    "logLevel": "ERROR",
    "applyMock": false,
    "params": {
      "key": "prod value"
    }
  }
]
```

#### Access

```
    TGFlavor.name();
    TGFlavor.baseUrl();
    TGFlavor.logLevel();
    TGFlavor.applyMock();
    TGFlavor.mockMappingsFile();
    TGFlavor.param("key");
```

#### Run app with flavor name

```
  flutter run --dart-define=flavor=dev
```

#### Custom flavor params on top of flavors.json 

```
[Splash]
    TGFlavor.setParam("secretKey", "key");
    
[Other Screen]
    String secretKey = TGFlavor.param("secretKey");
    
[Remove Param]
    TGFlavor.removeParam("secretKey");
```

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

#### Convert date Between Timezones

```
[String input]
    String dateTime = TGDateUtil.convertTimezoneWithString("16/05/2020 12:47:52", TGTimeZone.IST_INDIA, TGTimeZone.CST_CHINA, dateTimePattern: 
    "dd/MM/yyyyTHH:mm:ss");

[Datetime input]
    DateTime dateTimeParsed = TGDateUtil.parseDateTime("16/05/2020 12:47:52", dateTimePattern: "dd/MM/yyyy HH:mm:ss");
    DateTime dateTime = TGDateUtil.convertTimezoneWithDateTime(dateTimeParsed, TGTimeZone.IST_INDIA, TGTimeZone.CST_CHINA, dateTimePattern: 
    "dd/MM/yyyy HH:mm:ss");
```

### TGNetUtil

#### Check internet availability

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

### TGPlatformUtil

#### Check isApp, isDesktop, isWeb, isIOS, isAndroid, operatingSystem etc

```
    bool isApp = TGPlatformUtil.isApp();
    bool isDesktop = TGPlatformUtil.isDesktop();
    bool isWeb = TGPlatformUtil.isWeb();
    bool isAndroid = TGPlatformUtil.isAndroid();
    bool isIOS = TGPlatformUtil.isIOS();
    String operatingSystem = TGPlatformUtil.operatingSystem();
```

### TGValidate

Validators like email, alphabets, numeric, alphanumeric.

```
[Has Value]
    TGValidate.hasValue(anything);

[Email]
    TGValidate.email("valid@email.com");

[Alphabets]
    TGValidate.alphabets("AbcPqrXyz");

[Numeric]
    TGValidate.numeric("1234567890");

[Alphanumeric]
    TGValidate.alphanumeric("abc123");
```

## Service

### TGService

HTTP wrapper implementation having Request and Response as objects. JSon is Api standard so converting json string response into provided response object. In
case of error, also converting json error string response into provided error object.

#### Initialize

```
    await TGService.init(
      baseUrl: "https://api.company.com/v1",
      headers: defaultHeaders(),
      applyMock: true,
      mockMappingsFile: "assets/mocks/_mappings.json",
      badCertificateCallbackEnabled: false,
      connectionTimeoutInSeconds: 30
    );

    Map<String, String> defaultHeaders() {
      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';
      return headers;
    }
```

All the attributes provided during TGService.init(...) remains same across the entire lifecycle of TGService and all the requests. (Stored as static attributes which will be used for all the requests - TGRequest.) 

#### HTTP Request (Example: Login)

```
    TGPostRequest request = LoginRequest(
      email: _email,
      password: _password
    );

    new TGService<LoginResponse, ServiceError>(() => new LoginResponse(), () => new ServiceError())
      .post(
        request: request,
        onSuccess: (response) => _onSuccess(response),
        onError: (error) => _onError(error)
    );
```

Custom headers can also be set to the specific request as well. It will override default headers which were being set in TGService.init before.
```
    TGPostRequest request = ...
    request.customHeaders = {
      'Content-Encoding': 'gzip'
    };
```

#### Request, Response & Error (Example: Login)

##### Request extends type of request TGGetRequest, TGPostRequest, TGPutRequest, TGDeleteRequest, TGUploadRequest, TGUploadFileRequest

```
[login-request.dart]
    class LoginRequest extends TGPostRequest {
      String email;
      String password;
    
      LoginRequest({this.email, this.password});
    
      Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
    
      @override
      String getUri() {
        return "/login";
      }
    
      String body() {
        return json.encode(toJson());
      }
    }
```

##### Response extends standard TGResponse

```
[login-response.dart]
    class LoginResponse extends TGResponse {
      String userId;
      String accessToken;
      String refreshToken;
      String email;
      String name;
    
      LoginResponse();
    
      LoginResponse.fromJson(dynamic json) {
        fromJson(json);
      }
    
      @override
      fromJson(dynamic json) {
        userId = json['userId'];
        accessToken = json['accessToken'];
        refreshToken = json['refreshToken'];
        name = json['name'];
        email = json['email'];
      }
    }
```

##### Error represents common service error attributes which can be used common across all the services which extends TGError

```
[service-error.dart]
    class ServiceError extends TGError {
      int timestamp;
      int errorCode;
      String message;
      List details;
    
      ServiceError({
        this.timestamp,
        this.errorCode,
        this.message,
        this.details,
      });
    
      @override
      ServiceError fromJson(dynamic json) {
        return ServiceError(
          timestamp: json['timestamp'],
          errorCode: json['errorCode'],
          message: json['message'],
          details: json['details'],
        );
      }
    }
```

#### Mock Service (Example: Login)

Mapping file holds all the success and error files for each combination of request uri and method. Framework decides based on httpStatus code weather to take
success or error file.

One can simply bypass the entry by making `applyMock` as false which triggers live service call instead of relying on mock.

```
[assets/mocks/_mappings.json]
    [
      {
        "uri": "/login",
        "method": "POST",
        "applyMock": true,
        "httpStatus": 200,
        "successFile": "assets/mocks/login_success.json",
        "errorFile": "assets/mocks/login_error.json"
      }
    ]

[assets/mocks/login_success.json]
    {
      "userId": "Kmh76tYuH92BvkYt498Gv6FcL0Ut",
      "accessToken": "Mh9TgfE26Df9vp76Hjk4eDf67GvdS",
      "refreshToken": "K8gHr4I8tHklM9Hkt6EfDoPkn84dA",
      "email": "vishal@techgrains.com",
      "name": "Vishal Patel"
    }

[assets/mocks/login_error.json]
    {
      "timestamp": 1234567890,
      "errorCode": 2003,
      "message": "Invalid password",
      "details": [
        "Password must be 6 characters long"
      ],
    }
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

##### Options to load theme different ways

```
    TGView.loadLightTheme(); // Default Light
    TGView.loadDarkTheme(); // Default Dark
    TGView.loadTheme(...); // ThemeData
```

##### Refer Theme references directly

```
    TGView.textTheme()... for TextTheme
    TGView.appBarTheme()... for AppBarTheme
    TGView.tabBarTheme()... for TabBarThemeData
    TGView.platform()... for TargetPlatform
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

#### Row Container

```
    // Some icon and text as left and right aligned widgets for example
    TGView.rowContainer (
    left: [
       Icon(Icons.done_outline, color: TGView.theme().accentColor),
       TGView.emptySizedBox(width: 10),
       Text("Completed", style: TGView.textTheme().bodyText2)
     ], center: [
       Icon(Icons.keyboard_arrow_left, color: TGView.theme().hintColor)
     ],
     ], right: [
       Icon(Icons.keyboard_arrow_right, color: TGView.theme().dividerColor)
     ]
    );
```

#### Column Container

```
    // Some icon and text as children widgets for example
    TGView.columnContainer (
      children: [
       Icon(Icons.done_outline, color: TGView.theme().accentColor),
       TGView.emptySizedBox(height: 10),
       Text("Completed", style: TGView.textTheme().bodyText2)
     ]
   );
```

#### Columns Container

Supports N number of columns.

```
    // Some icon and text as children widgets for example
    TGView.columnsContainer (
    TGView.columnsContainer (
      children: [
        [
          Icon(Icons.done),
          Text("First Column", style: TGView.textTheme().bodyText2)
        ],
        [
          Icon(Icons.done_outline),
          Text("Second Column", style: TGView.textTheme().bodyText2)
        ],
     ]
   );
```

#### Box Container

```
    // Some icon and text as children widgets for example
    TGView.boxContainer(
      margin: EdgeInsets.all(0),
      bgColor: Colors.grey,
      color: TGView.theme().dividerColor,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      children: [
        Icon(Icons.done_outline, color: TGView.theme().accentColor),
        TGView.emptySizedBox(height: 10),
        Text("Completed", style: TGView.textTheme().bodyText2)
      ]
    );
```

#### Clear Focus Gesture

```
    GestureDetector gestureDetector = TGView.clearFocusGesture(context, child);
    // ... Utilize gestureDetector in appropriate heirarchy of widgets
```

#### Banner

```
    GestureDetector gestureDetector = TGView.banner(
      child, // Material App in most of the cases
      message: "Banner",
      bannerColor: Colors.orange,
      textColor: Colors.white,
      bannerLocation: BannerLocation.startEnd,
    );
```

#### Clear Focus (Hide Keyboard)

```
    TGView.clearFocus(context); 
```

#### Body Color

```
    TGView.bodyColor();
```

#### Display Color

```
    TGView.displayColor();
```

#### Divider

```
    TGView.divider();
```

#### App Bar Back Button

```
    // With standrd icon
    TGView.appBarBackButton(context: context);

    // With custom icon
    TGView.appBarBackButton(context: context, icon: Icons.arrow_back_ios);
```

#### Show Snack Bar

```
    // By default it picks theme's accent color as background color.
    TGView.showSnackBar(context: context, message: "Email has been sent successfully!", backgroundColor: Colors.green, duration: Duration(seconds: 2)); 
```

#### Show Alert Dialog

```
    TGView.showAlertDialog(context: context, actions: actions, onDismiss: onDismiss, content: content, titleRowWidgets: titleRowWidgets, barrierColor: barrierColor, 
      backgroundColor: backgroundColor,
      barrierDismissible : barrierDismissible,
      insetPadding: insetPadding,
    );
```

#### Popup Menu Item

```
    TGView.popupMenuItem(icon: Icons.expand_more, value: 1, text: "Expand All");
```

#### Loading Indicator

```
    TGView.loadingIndicator(Colors.blue);
```

#### Refresh Indicator

```
    TGView.refreshIndicator(widgets: widgets, onRefresh: onRefresh);
```

### TGText

Text related implementation based on various styles of TextTheme

#### Render Text

```
    TGText.bodyMedium("Thanking You!");
    TGText.bodySmall("Thanking You!", color: TGView.colorScheme().primary);
    TGText.bodySmall("Thanking You!", color: TGView.colorScheme().primary, fontWeight: FontWeight.bold, textAlign: TextAlign.center);
    TGText.bodySmall("Thanking You!", color: TGView.colorScheme().primary, textAlign: TextAlign.center);
    TGText.bodySmall("Thanking You!", color: TGView.colorScheme().primary, textAlign: TextAlign.center, maxLine: 2, overflow: TextOverflow.ellipsis);
```
