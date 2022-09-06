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
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          backgroundColor: myColor,
          title: Text("My Orders"),
      ),
      body: ListView.separated(
        itemCount: Myorderstext.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          Myorderstext[index]['image'],),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 121,
                    child: Text(""),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 122,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(Myorderstext[index]['subtitle1'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              GiveStarReviews(
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
                              SizedBox(height: 3),
                              Text('Rate this Product',
                                  style: const TextStyle(color: Color(0xffB2B2B2), fontSize: 12)),
                              SizedBox(height: 4),
                              Text(
                                Myorderstext[index]['subtitle3'],
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  width: size* 0.076,
                  alignment: Alignment.topRight,
                  height: 100,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(thickness: 1);
        },
      ),
    );
  }
}

