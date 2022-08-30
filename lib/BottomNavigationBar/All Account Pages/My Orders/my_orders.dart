import 'package:flutter/material.dart';
import 'package:fruit_market2/Colors/color.dart';
import 'package:givestarreviews/givestarreviews.dart';

import 'all_image_text_myorders.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}


class _MyOrdersState extends State<MyOrders> {

  @override
  Widget build(BuildContext context) {
    //double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: Text("My Orders")
      ),
      body: ListView.separated(
          itemCount: Myorderstext.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          return  Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(Myorderstext[index]['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(Myorderstext[index]['subtitle1'],style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width *0.39),
                                Column(
                                  children: [
                                    (Myorderstext[index]['icon']),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 88,bottom: 7),
                        child: GiveStarReviews(
                          starData: [
                            GiveStarData(
                              text: "",
                              onChanged: (rate) {},
                              size: 20,
                              activeStarColor: const Color(0xffA6A1A1),
                              inactiveStarColor: const Color(0xffA6A1A1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 104,bottom: 7),
                          child: Text(Myorderstext[index]['subtitle2'],style: const TextStyle(color: Color(0xffB2B2B2),fontSize: 12),
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 31),
                          child: Text(Myorderstext[index]['subtitle3'])
                      ),
                    ],
                  ),
                ],
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) { return Divider(thickness: 1); },
        ),
    );
  }
}
