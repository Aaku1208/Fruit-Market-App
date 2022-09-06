// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../All Images & Text Class(TabBar)/all_image_text_dryfruits.dart';
import '../Colors/color.dart';

class DryFruitsPage extends StatefulWidget {
  const DryFruitsPage({Key? key}) : super(key: key);

  @override
  State<DryFruitsPage> createState() => _DryFruitsPageState();
}

class _DryFruitsPageState extends State<DryFruitsPage> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Indehiscent Dry Fruits
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 11),
                child: RichText(
                  text: TextSpan(
                    text: "Indehiscent Dry Fruits",
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
                //h 280,
                child: ListView.builder(
                  itemCount: indehiscentDryFruits.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        indehiscentDryFruits[i],
                      ],
                    );
                  },
                ),
              ),

              /// Mixed Dry Fruits Pack
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Mixed Dry Fruits Pack",
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
                  "Dry Fruits mix fresh pack",
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
                  itemCount: mixedDryFruitsPack.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        mixedDryFruitsPack[i],
                      ],
                    );
                  },
                ),
              ),

              /// Dehiscent Dry Fruits
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Dehiscent Dry Fruits",
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
                  "Fresh Dehiscent Dry Fruits",
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
                  itemCount: dehiscentDryFruits.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        dehiscentDryFruits[i],
                      ],
                    );
                  },
                ),
              ),

              /// Kashmiri Dry Fruits
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Kashmiri Dry Fruits",
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
                  "Fresh Kashmiri Dry Fruits",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),
              /// ListView.Builder
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: kashmiriDryFruits.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        kashmiriDryFruits[i],
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
