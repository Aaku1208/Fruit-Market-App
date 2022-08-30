import 'package:shared_preferences/shared_preferences.dart';

class LogInSharedPreferences {
  static SharedPreferences? pref;
  static String fbName = 'fbName';
  static String fbEmail = 'fbEmail';
  static String fbPhoto = 'Fbphoto';

  static String glName = 'Name';
  static String glEmail = 'Email';
  static String glPhoto = 'Glphoto';

  static init() async => pref = await SharedPreferences.getInstance();

  /// FB
  static set setFbName(value) => pref!.setString(fbName, value);

  static String? get getFbName => pref!.getString(fbName);

  static set setFbEmail(value) => pref!.setString(fbEmail, value);

  static String? get getFbEmail => pref!.getString(fbEmail);

  static set setFbPhoto(value) => pref!.setString(fbPhoto, value);

  static String? get getFbPhoto => pref!.getString(fbPhoto);

  /// GG
  static set setGlName(value) => pref!.setString(glName, value);

  static String? get getGlName => pref!.getString(glName);

  static set setGlEmail(value) => pref!.setString(glEmail, value);

  static String? get getGlEmail => pref!.getString(glEmail);

  static set setGlPhoto(value) => pref!.setString(glPhoto, value);

  static String? get getGlPhoto => pref!.getString(glPhoto);
}
