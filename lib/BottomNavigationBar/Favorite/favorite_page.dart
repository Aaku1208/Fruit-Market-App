import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import '../../Colors/color.dart';
import 'all_image_text_favorite.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
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
              itemCount: FavoriteText.length,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
                                FavoriteText[index]['image'],),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(""),
                        ),
                      ),
                    ),
                    Expanded(
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
                                  Text(FavoriteText[index]['subtitle1'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),

                                  SizedBox(height: 8),
                                  Text(FavoriteText[index]['subtitle2'],
                                      style: const TextStyle(color: Color(0xffB2B2B2), fontSize: 12)),
                                  //SizedBox(height: 8),
                                  Padding(
                                    padding: EdgeInsets.only(right: sizeheight* 0.050),
                                    child: GiveStarReviews(
                                      starData: [
                                        GiveStarData(
                                          text: "",
                                          onChanged: (rate) {},
                                          size: 17,
                                          spaceBetween: 2,
                                          activeStarColor: const Color(0xffFFB238),
                                          inactiveStarColor: const Color(0xff707070),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                    Container(
                      margin: EdgeInsets.only(right: 9),
                      width: sizeheight * 0.085, // 0.076
                      alignment: Alignment.topRight,
                      height: 125,
                      child: Column(
                        children: [
                          Text(FavoriteText[index]['subtitle3'],
                              style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black)),

                          SizedBox(height: 82),

                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AddColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Add",style: TextStyle(color: Colors.white,fontSize: 15)),
                                Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 18,)
                              ],
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
