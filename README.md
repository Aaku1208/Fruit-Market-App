# fruit_market

This is the app built using Flutter a tool which is very much using in deploying Android and IOS apps.


## Getting Started

**Step 1**
Create Flutter Project
```
flutter create project name
```

**Step 2**
Run a Flutter Project
```
flutter pub get
```

**Step 3**
Go to project root and execute the following command in console to get the required dependencies.
```
flutter pub get
```

## fruit_market Features

* Splash 
* Login
* Home
* Google Sign In
* Facebook Login
* Navigator
* Image Picker
* Phone Verification(Firebase auth)
* Shared Preferences(Data Store to Local Storage)
* Validation


### Libraries & Tools used
 * [firebase_core](https://pub.dev/packages?q=firebase_core)
 * [firebase_auth](https://pub.dev/packages?q=firebase_auth)
 * [google_sign_in](https://pub.dev/packages/google_sign_in)
 * [flutter_facebook_auth](https://pub.dev/packages/flutter_facebook_auth)
 * [Pinput](https://pub.dev/packages/pinput)
 * [fluttertoast](https://pub.dev/packages/fluttertoast)
 * [givestarreviews](https://pub.dev/packages/givestarreviews)
 * [auth_buttons](https://pub.dev/packages/auth_buttons)
 * [image_picker](https://pub.dev/packages/image_picker)
 * [star_menu](https://pub.dev/packages/star_menu)
 * [shared_preferences](https://pub.dev/packages/shared_preferences)


### Folder Structure
```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
|- web
|- windows
```

### Here is the Folder structure we have been using in this project.

```
lib/
|- All Images & Text Class(TabBar)/
    |- all_image_text_dryfruits.dart
    |- all_image_text_friuts.dart
    |- all_image_text_vegetables.dart
|- BottomNavigationBar/
    |- All Account Page/
        |- Help
            |- help.dart
        |- My orders/
            |- all_image_text_myorders.dart
            |- my_orders.dart
        |- Setting/
            |- setting.dart
    |- account.dart
    |- favorite.dart
    |- home.dart
    |- shopping.dart
|- Class Of (TabBar) UI/
    |- dryfruits_ui_class.dart
    |- fruits_ui_class.dart
    |- vegetables_ui_class.dart
|- Colors/
    |- color.dart
|- GoogleSignIn/
    |- google_sign_in.dart
|- onboardingScreen/
    |- eshopping.dart
    |- slidermodel.dart
|- Page/
    |- welcome_page.dart
|- PhoneLoadingVarification/
    |- loading_screen.dart
    |- name_address.dart
    |- phone_no_otp.dart
    |- varification_done.dart
|- Shared Preferences class/
    |- login_shared_preferences.dart
|- SplashScreen/
    |- splashscreen.dart
|- StartingPage/
    |- verificationpage.dart
|- TabBar/
    |- dry_fruits_Page.dart
    |- fruits_page.dart
    |- vagetables_page.dart
|- main.dart/

```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market2/Shared%20Preferences%20class/login_shared_preferences.dart';
import 'package:fruit_market2/SplashScreen/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LogInSharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      );
  }
}

```

* For Project: Github link for project 










