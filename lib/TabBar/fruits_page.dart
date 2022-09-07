import 'package:flutter/material.dart';
import '../Colors/color.dart';
import 'All Images & Text Class(TabBar)/all_image_text_fruits.dart';

class FruitsPage extends StatefulWidget {
  const FruitsPage({Key? key}) : super(key: key);

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Organic Fruits
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 11),
              child: RichText(
                text: TextSpan(
                  text: "Organic Fruits",
                  style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "\t\t\t(20% Off)",
                      style: TextStyle(color: myColor,fontWeight: FontWeight.bold,fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: sizeheight *.01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Pick up from organic farms",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13),
              ),
            ),

            /// ListView.Builder
            SizedBox(
              height: 282,
              child: ListView.builder(
                itemCount: organicFruits.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      organicFruits[i],
                    ],
                  );
                },
              ),
            ),

            /// Mixed Fruits Pack
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: "Mixed Fruits Pack",
                  style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "\t\t\t(10% Off)",
                      style: TextStyle(color: myColor,fontWeight: FontWeight.bold,fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: sizeheight *.01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Mixed Fruit pack",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13),
              ),
            ),
            /// ListView.Builder
            SizedBox(
              height: 282,
              child: ListView.builder(
                itemCount: mixedFruitsPack.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      mixedFruitsPack[i],
                    ],
                  );
                },
              ),
            ),

            /// Stone Fruits
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: "Stone Fruits",
                  style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "\t\t\t(20% Off)",
                      style: TextStyle(color: myColor,fontWeight: FontWeight.bold,fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: sizeheight *.01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Fresh Stone Fruits",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13),
              ),
            ),
            /// ListView.Builder
            SizedBox(
              height: 282,
              child: ListView.builder(
                itemCount: stoneFruits.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      stoneFruits[i],
                    ],
                  );
                },
              ),
            ),

            /// Melons Fruits
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: "Melons",
                  style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "\t\t\t(5% Off)",
                      style: TextStyle(color: myColor,fontWeight: FontWeight.bold,fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: sizeheight *.01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Fresh Melons Fruits",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13),
              ),
            ),
            /// ListView.Builder
            SizedBox(
              height: 311,
              child: ListView.builder(
                itemCount: melons.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      melons[i],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

