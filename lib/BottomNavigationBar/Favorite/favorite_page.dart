import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_market2/TabBar/fruits_page.dart';
import '../../Colors/color.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  bool favr = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data;
  }
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        backgroundColor: myColor,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),

            ListView.separated(
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    /// Image
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,top: 9,right: 15,bottom: 9),
                        child: Container(
                          height: 121,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            image: DecorationImage(
                              image: NetworkImage(
                                data[index]['image'],),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  StatefulBuilder(
                                    builder:(BuildContext context, StateSetter setState)=>
                                        GestureDetector(
                                          onTap: () {
                                            favr = !favr;
                                            data.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 7, top: 7),
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              // child: fav(index: int.fromEnvironment("mamse")),
                                              child:
                                              Icon(
                                                  favr
                                                      ? Icons.favorite_outline
                                                      : Icons.favorite,
                                                  color: favr?Colors.black:Colors.red,size: 20
                                              ),
                                            ),
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// all text rating title
                    Expanded
                      (
                      child: Container(
                        height: sizeheight * 0.179, //139
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
                                  Text(data[index]['name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),

                                  SizedBox(height: 8),
                                  Text('Pick up form organic data',
                                      style: const TextStyle(color: Color(0xffB2B2B2), fontSize: 12)),
                                  SizedBox(height: 5),
                                  RatingBar.builder(
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
                                  SizedBox(height: 14),
                                  Row(
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// price and Add cart
                    Padding(
                      padding: const EdgeInsets.only(right: 6,top: 20),
                      child: Column(
                        children: [
                          Text(data[index]['price'],
                              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black)),

                          SizedBox(height: sizeheight*0.10),
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(duration: Duration(seconds: 1),
                                      content: Text('Data Add to Cart Please Check',
                                        style: TextStyle(color: Colors.white,fontSize: 15),
                                      ),
                                      backgroundColor: Colors.black12,
                                    ));
                                cart.add({
                                  'image': data[index]['image'],
                                  'name': data[index]['name'],
                                  'price': data[index]['price'],
                                });
                                //print(cart);
                              },
                              child: Container(
                                height: 30,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: AddColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Add",style: TextStyle(color: Colors.white,fontSize: 15)),
                                    Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1);
                },
              ),
            ],
          ),
        ),
      );
    }
}
List<Map> cart =[];