import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Colors/color.dart';

class FruitsPage extends StatefulWidget {

  const FruitsPage({Key? key}) : super(key: key);

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {

  final CollectionReference _Organicfruits =
      FirebaseFirestore.instance.collection('Organic Fruits');
  late Stream<QuerySnapshot> _organicfruits;

  final CollectionReference _Mixedfruits =
      FirebaseFirestore.instance.collection('Mixed Fruits Pack');
  late Stream<QuerySnapshot> _mixedfruits;

  final CollectionReference _Stonefruits =
      FirebaseFirestore.instance.collection('Stone Fruits');
  late Stream<QuerySnapshot> _stonefruits;

  final CollectionReference _Melonsfruits =
      FirebaseFirestore.instance.collection('Melons');
  late Stream<QuerySnapshot> _melonsfruits;

  bool favr = false;
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _organicfruits = _Organicfruits.snapshots();
    _mixedfruits = _Mixedfruits.snapshots();
    _stonefruits = _Stonefruits.snapshots();
    _melonsfruits = _Melonsfruits.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Organic Fruits
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 11),
              child: RichText(
                text: TextSpan(
                  text: "Organic Fruits",
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
            SizedBox(height: sizeheight * .01),
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

            /// Organic Fruits ListView.Builder
            SizedBox(
              height: 270,
              child: StreamBuilder(
                stream: _organicfruits,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  return ListView.builder(
                      itemCount: document.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot docs = document[index];
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
                                    image: NetworkImage(docs['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
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
                                              child: Icon(
                                                  Icons.favorite_outlined,
                                                  color: Colors.red,
                                                  size: 18)),
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
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: RatingColor),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  docs['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('₹${docs['price']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13)),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),

            // Mixed Fruits Pack
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: "Mixed Fruits Pack",
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
            SizedBox(height: sizeheight * .01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Mixed Fruit pack",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),

            /// Mixed Fruits Pack ListView.Builder
            SizedBox(
              height: 270,
              child: StreamBuilder(
                stream: _mixedfruits,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  return ListView.builder(
                      itemCount: document.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot docs = document[index];
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
                                    image: NetworkImage(docs['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
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
                                              child: Icon(
                                                  Icons.favorite_outlined,
                                                  color: Colors.red,
                                                  size: 18)),
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
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: RatingColor),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  docs['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('₹${docs['price']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13)),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),

            // Stone Fruits
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: "Stone Fruits",
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
            SizedBox(height: sizeheight * .01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Fresh Stone Fruits",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),

            /// Stone Fruits ListView.Builder
            SizedBox(
              height: 270,
              child: StreamBuilder(
                stream: _stonefruits,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  return ListView.builder(
                      itemCount: document.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot docs = document[index];
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
                                    image: NetworkImage(docs['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
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
                                              child: Icon(
                                                  Icons.favorite_outlined,
                                                  color: Colors.red,
                                                  size: 18)),
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
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: RatingColor),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  docs['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('₹${docs['price']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13)),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),

            // Melons Fruits
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: "Melons",
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
            SizedBox(height: sizeheight * .01),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Fresh Melons Fruits",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),

            /// Melons Fruits ListView.Builder
            SizedBox(
              height: 300,
              child: StreamBuilder(
                stream: _melonsfruits,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  return ListView.builder(
                      itemCount: document.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot docs = document[index];
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
                                    image: NetworkImage(docs['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                          Container(
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
                                                child: StatefulBuilder(
                                                    builder:(BuildContext context, StateSetter setState)=>
                                                    GestureDetector(
                                                      onTap: () {
                                                        favr = !favr;
                                                        setState(() {});
                                                        data.add({
                                                          'image': document[index]['image'],
                                                          'name': document[index]['name'],
                                                          'price': document[index]['price']

                                                        });
                                                        print(data);
                                                      },
                                                      child: Icon(
                                                          favr
                                                              ? Icons.favorite
                                                              : Icons.favorite_outline,
                                                          color: favr?Colors.red:Colors.black,size: 20
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
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: RatingColor),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  docs['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text('₹${docs['price']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13)),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// bool favr = false;
// Widget favorite({required index}){
//   return StatefulBuilder(builder:(BuildContext context, StateSetter setState){
//     return GestureDetector(
//         onTap: () {
//           favr = !favr;
//           setState(() {});
//           data.add({
//             'image': document[${widget.index}]['image'],
//           });
//           print(data);
//         },
//         child: Icon(favr?Icons.favorite:Icons.favorite_outline,
//             color: favr?Colors.red:Colors.black,size: 20));
//   } );
// }

List<Map> data = [];
