import 'package:flutter/material.dart';
import '../../../../../Colors/color.dart';


class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {

  // Initial Selected Value
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  var items = [
    'English',
    'Hindi',
    'Gujarati',
  ];

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: const Text("Languages"),
      ),
      body: Column(
        children: [
          SizedBox(height: sizeheight * 0.01),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Language",style: TextStyle(color: Colors.grey)),
                SizedBox(height: sizeheight * 0.017),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Languages",style: TextStyle(color: Colors.black)),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      value: dropdownvalue,
                      icon: Icon(Icons.arrow_drop_down_outlined,color: myColor,size: 30),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
