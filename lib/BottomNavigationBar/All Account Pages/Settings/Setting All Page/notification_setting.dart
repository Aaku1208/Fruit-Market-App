import 'package:flutter/material.dart';
import '../../../../Colors/color.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {

  bool of = false;
  bool off = false;

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: const Text("Notification Setting"),
      ),
      body: Column(
        children: [
          SizedBox(height: sizeheight * 0.01),
          ListTile(
            leading: Icon(Icons.notifications_rounded,color: myColor,size: 30),
            title: const Text("My Account",style: TextStyle(color: Colors.black)),
            subtitle: Container(
                margin: EdgeInsets.only(top: 7),
                child: const Text("You will receive daily updates")),
            trailing: Switch(
              inactiveThumbColor: Colors.white,
              activeColor: myColor,
              value: of,
              onChanged: (value) {
                setState(() {
                  of = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications_rounded,color: myColor,size: 30),
            title: const Text("Pramotional Notifications",style: TextStyle(color: Colors.black)),
            subtitle: Container(
                margin: EdgeInsets.only(top: 7),
                child: const Text("You will receive daily updates")),
            trailing: Switch(
              inactiveThumbColor: Colors.white,
              activeColor: myColor,
              value: off,
              onChanged: (value) {
                setState(() {
                  off = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
