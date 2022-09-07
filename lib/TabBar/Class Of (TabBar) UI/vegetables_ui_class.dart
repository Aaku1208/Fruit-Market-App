import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';


bool favorite=true;
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
                      child:  const Center(
                        child: Icon(Icons.favorite_outlined,color: Colors.red,size: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              GiveStarReviews(
                starData: [
                  GiveStarData(
                    text: "",
                    onChanged: (rate) {},
                    spaceBetween: 3,
                    size: 20,
                    activeStarColor: const Color(0xffFFB238),
                    inactiveStarColor: const Color(0xff707070),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(text1,style: const TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 4),
          Text(text2,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13)),
        ],
      ),
    );
  }
}

