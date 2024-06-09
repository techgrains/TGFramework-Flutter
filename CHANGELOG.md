## 1.5.9
* Avoided types as parameter names to allow <T> across TGService

## 1.5.8
* Formatted & improved code, based on Dart Analysis report

## 1.5.7
* Util
  * TGDateUtil
    * Introduced date-time conversion between different timezones

## 1.5.6
* Util
  * TGFlavor
    * Introduced custom flavor params to be set which overrides default flavors.json

## 1.5.5
* Service
  * TGService
    * Fixed stream response issue in "uploadFile" & "uploadFileSync"
    
* Service
  * TGRequest
    * Customized http request timeout can be setup during TGService.init (default value is 15 seconds)

## 1.5.3
* Service
  * TGRequest
    * GZip support with content compression and content-length header value

## 1.5.2
* Service
  * TGRequest
    * Inclusion of customised headers in TGRequest as addition to default headers

## 1.5.1
* Included example as quick reference for the plugin

## 1.5.0
* Upgraded environment sdk and flutter from version 2 to version 3
* Versions upgrades for dependency plugins

## 1.4.8
* Service
  * TGService
    * Add multi file upload support in "uploadFile" method
    * Add multi file upload support in "uploadFileSync" method

## 1.4.7
* Service
  * TGService
    * Resolved Exception while no active internet in service methods
* Memory
  * TGSharedPreference: key check added in 'remove' method
  
## 1.4.6
* Service
  * TGService
    * Resolved Exception while no active internet in service methods
    * Added "universal_io" for web support in HTTPClient
* Memory
  * TGSharedPreference: key check added in 'get' method

## 1.4.5
* TGText
  * Update textColor attribute for text rendering

* TGText
  * Removed fontFamily attribute for text rendering

## 1.4.3
* TGText
  * Added fontFamily, textAlign, maxLine, and textOverflow attribute for text rendering

## 1.4.2
* TGText
  * Added fontWeight attribute for text rendering

## 1.4.1
* TGText
  * Added textAlign attribute for text rendering

## 1.4.0
* View
  * TGText
    * Text related implementation based on various styles of TextTheme
  * TGView
    * Additional supportive method for ColorScheme in TGView
    * Deprecated color reference methods. Need to use ColorScheme.
* Versions upgrades for dependency plugins

## 1.3.12
* Service
  * TGService
    * Resolved TGGetRequest issue in "getSync" method

## 1.3.11
* Service
  * TGService
    * Set read mock files only when applyMock is true

## 1.3.10
* Service
  * TGService
    * Introduced "getSync" method
    * Introduced "postSync" method
    * Introduced "uploadFileSync" method

## 1.3.9+1
* TGNetUtil
  * Check internet and api health
  
## 1.3.8
* Service
  * TGRequest
    * Introduced TGUploadFileRequest to upload file
  * TGService
    * Introduced "uploadFile" method to upload file
  
## 1.3.7
* Localization (i18n)
  * TGLocale: Supports Locale files from dynamically provided path

## 1.3.6
* Upgraded flutter environment version

## 1.3.5
* TGNetUtil
  * Check reachability of site with dynamically provided URL

## 1.3.4
* TGView 
  * Banner & clear focus with Gesture implemented in TGView 
* Refactored TGFlavor naming and access

## 1.3.3
* TGFlavor
  * Implemented flavor with dart define route as suggested from Flutter 2.2 onwards.
  * Supports flavor, baseUrl, logLevel, applyMock, mockMappingsFile & custom params as part of configuration

## 1.3.2
* Added configurations params for TG view objects

## 1.3.1
* Resolved null safety type casting exception for Function

## 1.3.0
* Migrating to null safety
* Upgraded flutter environment version

## 1.2.2+1
* Platform
  * TGPlatformUtil gives quick check for iOS, Android, Mobile, Package Config, Local Host Name, Operating System etc.

## 1.2.1
* Localization (i18n)
  * Initializes locale property files upon startup for better performance

## 1.2.0
* Enabled support for Linux, macOS & Windows
* Upgraded versions of dependencies

## 1.1.10+2
* Localization (i18n)
  * TGLocale works without referencing context for locale key's value. It's very lightweight call now.

## 1.1.10+1
* TGView
  * Multiple Column Container: Multiple columns render equally in distance. Supports N number of columns.
  * Refresh Indicator: Configure background color of its container.

## 1.1.9
* TGView
  * Row Container: Dynamic support of (left, right) & (left, center and right) combination with CrossAxisAlignment
  * Box Container: Configure border color with default of transparent

## 1.1.8
* TGView
  * Row Container: Supports 3 sections - left, center & right
  * Box Container: Configure background color and border width

## 1.1.7
* Memory
  * TGAccessMatrix
    * Apply roles whenever user login (or scope of change in roles)

## 1.1.6
* Memory
  * TGAccessMatrix: In memory Access Matrix based on Access Key with Roles

## 1.1.5
* Service
  * TGRequest 
    * Introduced TGUploadRequest to upload file

## 1.1.4
* Memory
  * TGSession: Listener implementation for custom usage 
  * TGSharedPreference: Listener implementation for custom usage
* Util
  * TGValidate
    * Has Value for any type of object (supports dynamic)

## 1.1.3
* TGView
  * Body Color
  * Display Color
  * Divider
  * Row Container
  * Column Container
  * Columns Container
  * Box Container
  * App Bar Back Button
  * Show Snack Bar
  * Show Alert Dialog
  * Popup Menu Item

## 1.1.2
* Service
  * TGService
    * Treat as an error if unable to convert json response to given object type.

## 1.1.1
* Service
  * TGService
    * Support to enable "badCertificateCallback" for HTTPClient
  * TGView
    * Additional supportive methods for Theme in TGView

## 1.1.0
* Service
  * TGService
    * TGRequest
    * TGResponse
    * TGError
    * Mock

    HTTP wrapper implementation having Request and Response as objects with custom Error and Mock implementation.

## 1.0.7
* Localization (i18n)
  * TGLocale
    * Supports dynamic arguments as parameters 

## 1.0.6
* Localization (i18n)
  * TGLocale 
    * Supported, default and current locale holders with locale related supporting features
  * TGLocalization 
    * Localization for each locale loads values from json file
  * TGLocalizationsDelegate 
    * Extended implementation of LocalizationsDelegate which Flutter uses internally

## 1.0.4
* Cleanup
  * Code, versions, dependencies, documentation

## 1.0.3
* View
  * TGView
    * Custom Theme  

## 1.0.2
* Include `android` and `ios` folders with dependencies. 

## 1.0.1
* Changed package name. 
* Improved documentation. 
* Included empty example structure.	

## 1.0.0 
* Common
  * TGLog
    * Levels: Debug, Info, Error, Warn, Tag, All, Off  
* Memory
  * TGSession: In memory Session throughout the app 
  * TGSharedPreference: Shared Preferences (Android), User Defaults (iOS)
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
    * Scaffold Container
    * Custom Scroll View using Sliver List
    * Empty Sized Box
    * Clear Focus (Hide Keyboard)
    * Snackbar
    * Loading Indicator
