import 'package:flutter/material.dart';

import '../../../../Colors/color.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: const Text("Account"),
      ),
      body: Column(
        children: [
          SizedBox(height: sizeheight * 0.01),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: Icon(Icons.security_rounded, color: myColor,size: 27),
            title: const Text("Security"),
          ),
          Divider(),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: Icon(Icons.highlight_remove_rounded, color: myColor,size: 27),
            title: const Text("Deactivate Account"),
          ),
          Divider(),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: Icon(Icons.delete_rounded, color: myColor,size: 27),
            title: const Text("Delete Account"),
          ),
        ],
      ),
    );
  }
}
