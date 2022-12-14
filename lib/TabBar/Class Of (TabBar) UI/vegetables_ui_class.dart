import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_market2/TabBar/All%20Images%20&%20Text%20Class(TabBar)/all_image_text_vagetables.dart';
import '../../Colors/color.dart';


//bool favorite = false;
//int? index;
class Vegetables{
  Widget model1(image,text1,text2) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              //color: myColor,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 7,top: 7),
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Center(
                        //child: fav(index: int.fromEnvironment("mamse")),
                      child: Icon(Icons.favorite_outlined,color: Colors.red,size: 18)),
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
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
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text(text1,style: const TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text(text2,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13)),
          ),
        ],
      ),
    );
  }

}

// Widget fav({i, required int index}){
//   return StatefulBuilder(builder:(BuildContext context, StateSetter setState){
//     return GestureDetector(
//         onTap: () {
//           favorite = !favorite;
//           setState(() {});
//           //data.add(organicVegetables);
//           //print(data);
//         },
//         child: Icon(favorite?Icons.favorite:Icons.favorite_outline,
//             color: favorite?Colors.red:Colors.black,size: 18));
//   } );
// }
//
//
// List data=[
//
// ];
