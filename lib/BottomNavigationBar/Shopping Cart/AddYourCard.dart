import 'package:flutter/material.dart';
import 'package:fruit_market2/Colors/color.dart';

class AddYourCard extends StatefulWidget {
  const AddYourCard({Key? key}) : super(key: key);

  @override
  State<AddYourCard> createState() => _AddYourCardState();
}

class _AddYourCardState extends State<AddYourCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        centerTitle: false,
        title: Text("Add your card"),
      ),
    );
  }
}
