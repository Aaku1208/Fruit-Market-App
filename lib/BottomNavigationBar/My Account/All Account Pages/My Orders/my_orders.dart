import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_market2/Colors/color.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 7,left: 2),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: Myorderstext.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 9,right: 15,bottom: 9),
                    child: Container(
                      height: 121,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        image: DecorationImage(
                          image: NetworkImage(
                            Myorderstext[index]['image'],),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(""),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 122,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(Myorderstext[index]['subtitle1'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              Padding(
                                padding: const EdgeInsets.only(right: 20,top: 10),
                                child: RatingBar.builder(
                                  initialRating: 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 22,
                                  itemBuilder: (context, _) => Icon(
                                      Icons.star,color: RatingColor),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('Rate this Product',
                                  style: const TextStyle(color: Color(0xffB2B2B2), fontSize: 12)),
                              SizedBox(height: 10),
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
                  margin: EdgeInsets.only(right: 9,top: 2),
                  width: size* 0.082,
                  alignment: Alignment.topRight,
                  height: 100,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 1);
          },
        ),
      ),
    );
  }
}

