import 'package:flutter/material.dart';
import '../../../../Colors/color.dart';
import 'Setting All Page/account.dart';
import 'Setting All Page/change_address.dart';
import 'Setting All Page/language.dart';
import 'Setting All Page/notification_setting.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 25),
              leading: Icon(Icons.account_circle_rounded, color: myColor,size: 27),
              title: const Text("Account"),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Account()));
            },
          ),
          Divider(),
          GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 25),
              leading: Icon(Icons.notifications_rounded, color: myColor,size: 27),
              title: const Text("Notification Setting"),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NotificationSetting()));
            },
          ),
          Divider(),
          GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 25),
              leading: Icon(Icons.language_rounded, color: myColor,size: 27),
              title: const Text("Languages"),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Languages()));
            },
          ),
          Divider(),
          GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 25),
              leading: Icon(Icons.location_on_rounded, color: myColor,size: 27),
              title: const Text("Change Address"),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChangeAddress()));

            },
          ),
        ],
      ),
    );
  }
}
