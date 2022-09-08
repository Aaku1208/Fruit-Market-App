import 'package:flutter/material.dart';
import 'package:fruit_market2/BottomNavigationBar/Shopping%20Cart/all_image_text_shoppingcart.dart';

import '../../Colors/color.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    double sizehight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("440001 Nagpur,Maharashtra"),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                    SizedBox(width: 15),
                    Text(
                      "Change Address",
                      style: TextStyle(color: Color(0xff7089F0), fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Vegetables
          Container(
            height: 33,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Vegetables",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Container(
            height: 306,
            width: double.infinity,
            //color: Colors.grey,
            child: Column(
              children: [
                ListView.separated(
                  itemCount: ShoppingCartImageText.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, right: 30, bottom: 9),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    ShoppingCartImageText[index]['image'],
                                  ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(height: 51),
                                    Text(
                                        ShoppingCartImageText[index]
                                            ['subtitle1'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(width: 10),
                                    Text(
                                        ShoppingCartImageText[index]
                                            ['subtitle2'],
                                        style: TextStyle(
                                            color: myColor, fontSize: 11)),
                                  ],
                                ),
                                // SizedBox(height: 0),
                                Text(ShoppingCartImageText[index]['subtitle3'],
                                    style: const TextStyle(fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                SizedBox(height: 8),
                                Text(
                                  ShoppingCartImageText[index]['subtitle4'],
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700)),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 87),
                                  child: Row(
                                    children: [
                                      /// -
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                                          border: Border.all(
                                            color: Colors.black54,
                                            width: 1.6,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.remove,size: 15),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Row(
                                        children: [
                                          Text("2")
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      /// +
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                                          border: Border.all(
                                            color: Colors.black54,
                                            width: 1.6,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add,size: 15),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 9, top: 9),
                          width: sizewidth * 0.085,
                          // 0.076
                          alignment: Alignment.topRight,
                          height: 100,
                          child: Column(
                            children: [
                              Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
