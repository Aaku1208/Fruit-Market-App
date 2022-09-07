import 'package:flutter/material.dart';
import '../Colors/color.dart';
import 'All Images & Text Class(TabBar)/all_image_text_vagetables.dart';

class VegeTablesPage extends StatefulWidget {
  const VegeTablesPage({Key? key}) : super(key: key);

  @override
  State<VegeTablesPage> createState() => _VegeTablesPageState();
}

class _VegeTablesPageState extends State<VegeTablesPage> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Organic Vegetables
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 11),
                child: RichText(
                  text: TextSpan(
                    text: "Organic Vegetables",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\t\t\t(20% Off)",
                        style: TextStyle(
                            color: myColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeheight *.01), // 8
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Pick up from organic farms",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),

              /// ListView.Builder
              SizedBox(
                height: 282,
                child: ListView.builder(
                  itemCount: organicVegetables.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        organicVegetables[i],
                      ],
                    );
                  },
                ),
              ),

              /// Mixed Vegetables Pack
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Mixed Vegetables Pack",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\t\t\t(10% Off)",
                        style: TextStyle(
                            color: myColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeheight *.01),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Vegetable mix fresh pack",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),

              /// ListView.Builder
              SizedBox(
                height: 282,
                child: ListView.builder(
                  itemCount: mixedVegetables.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        mixedVegetables[i],
                      ],
                    );
                  },
                ),
              ),

              /// Allium Vegetables
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Allium Vegetables",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\t\t\t(20% Off)",
                        style: TextStyle(
                            color: myColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeheight *.01),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Fresh Allium Vegetables",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),
              /// ListView.Builder
              SizedBox(
                height: 282,
                child: ListView.builder(
                  itemCount: alliumVegetables.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        alliumVegetables[i],
                      ],
                    );
                  },
                ),
              ),

              /// Root Vegetabels
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Root Vegetabels",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\t\t\t(5% Off)",
                        style: TextStyle(
                            color: myColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeheight *.01),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Fresh Root Vegetabels",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),
              /// ListView.Builder
              SizedBox(
                height: 311,
                child: ListView.builder(
                  itemCount: rootVegetabels.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        rootVegetabels[i],
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


