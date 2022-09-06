import 'package:shared_preferences/shared_preferences.dart';

class LogInSharedPreferences {
  static SharedPreferences? pref;
  static String fbName = 'fbName';
  static String fbEmail = 'fbEmail';
  static String fbPhoto = 'Fbphoto';

  static String glName = 'Name';
  static String glEmail = 'Email';
  static String glPhoto = 'Glphoto';

  static String firstName = 'FirstName';
  static String secondName = 'secondName';
  static String OtpEmail = 'OtpEmail';
  static String OtpAddress = 'OtpAddress';

  static String ProfileImage = 'ProfileImage';

  static init() async => pref = await SharedPreferences.getInstance();

  /// Image
  static set setPofilePhoto(value) => pref!.setString(ProfileImage, value);

  static String? get getPofilePhoto => pref!.getString(ProfileImage);


  /// OTP
  static set setFName(value) => pref!.setString(firstName, value);

  static String? get getFName => pref!.getString(firstName);

  static set setSName(value) => pref!.setString(secondName, value);

  static String? get getSName => pref!.getString(secondName);

  static set setOEmail(value) => pref!.setString(OtpEmail, value);

  static String? get getOEmail => pref!.getString(OtpEmail);

  static set setOAddress(value) => pref!.setString(OtpAddress, value);

  static String? get getOAddress => pref!.getString(OtpAddress);


  /// Facebook
  static set setFbName(value) => pref!.setString(fbName, value);

  static String? get getFbName => pref!.getString(fbName);

  static set setFbEmail(value) => pref!.setString(fbEmail, value);

  static String? get getFbEmail => pref!.getString(fbEmail);

  static set setFbPhoto(value) => pref!.setString(fbPhoto, value);

  static String? get getFbPhoto => pref!.getString(fbPhoto);

  /// Google
  static set setGlName(value) => pref!.setString(glName, value);

  static String? get getGlName => pref!.getString(glName);

  static set setGlEmail(value) => pref!.setString(glEmail, value);

  static String? get getGlEmail => pref!.getString(glEmail);

  static set setGlPhoto(value) => pref!.setString(glPhoto, value);

  static String? get getGlPhoto => pref!.getString(glPhoto);

}
