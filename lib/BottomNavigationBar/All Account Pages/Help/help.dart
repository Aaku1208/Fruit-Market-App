import 'package:flutter/material.dart';

import '../../../Colors/color.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: const Text("Help"),
      ),
      body: Column(
        children: [
          SizedBox(height: sizeheight * 0.01),
          Padding(
            padding: const EdgeInsets.all(17),
            child: Text(
            "Lorem Ipsum is simply dummy text of the printing "
            "and typesetting industry. Lorem Ipsum has been "
            "the industry’s standard dummy text ever since the "
            "1500s, when an unknown printer took a galley of "
            "type and scrambled it to make a type specimen "
            "book. It has survived not only five centuries, but "
            "also the leap into electronic typesetting, remaining "
            "essentially unchanged. It was popularised in the "
            "1960s with the release of Letraset sheets containing "
            "Lorem Ipsum passages, and more recently with "
            "desktop publishing software like Aldus PageMaker "
            "including versions of Lorem Ipsum. \n\n"

            "Lorem Ipsum is simply dummy text of the printing "
            "and typesetting industry. Lorem Ipsum has been "
           " the industry’s standard dummy text ever since the "
            "1500s, when an unknown printer took a galley of "
            "type and scrambled it to make a type specimen "
            "book. It has survived not only five centuries, but "
            "also the leap into electronic typesetting, remaining "
           " essentially unchanged. It was popularised in the "
            "1960s with the release of Letraset sheets containing"
                "Lorem Ipsum passages, and more recently with "
            "desktop publishing software like Aldus PageMaker "
              "including versions of Lorem Ipsum."
            ),
          ),
        ],
      )
    );
  }
}
