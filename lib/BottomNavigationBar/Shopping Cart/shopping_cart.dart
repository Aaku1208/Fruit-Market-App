import 'package:flutter/material.dart';
import 'package:fruit_market2/BottomNavigationBar/Favorite/favorite_page.dart';

import '../../Colors/color.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {

  @override
  void initState() {
    super.initState();
    cart;
  }

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

      body: cart.isEmpty ?
      Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [ Image.asset("assets/image/cartremove.png",height: 180,width: 160), Text("Your cart is empty!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)]),

      ) :SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.location_on_rounded),
              ),
              title: const Text("2030 Alina society near D-mart"),
              subtitle: const Text("Gujarat, Maharashtra"),
              children: [
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        BottomSheet();
                      },
                        child: Text("Change Address",style: TextStyle(color: AddChangeColor))),
                  ),
                ),
              ],
            ),
            /// Vegetables
            Container(
              height: 3,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),

            /// ListView.separated Vegetables
            Column(
              children: [
                ListView.separated(
                  itemCount: cart.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        /// Image
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
                                    cart[index]['image'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Text(""),
                            ),
                          ),
                        ),

                        /// Name Price all....
                        Expanded(
                          child: Container(
                            height: 122,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),

                                // Name
                                Text(
                                    cart[index]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),

                                SizedBox(height: 10),

                                // Rs. Save
                                Text("Rs 40 Saved",
                                    style: TextStyle(
                                        color: myColor, fontSize: 11)),

                                SizedBox(height: 5),

                                // --Rs remove----
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Rs 190",
                                            style: const TextStyle(fontSize: 12,
                                              decoration: TextDecoration.lineThrough,
                                            )),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            /// -
                                            GestureDetector(
                                              onTap: () {

                                              },
                                              child: Container(
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
                                            ),
                                            SizedBox(width: 10),
                                            Row(
                                              children: [
                                                Text("2")
                                              ],
                                            ),
                                            SizedBox(width: 10),
                                            /// +
                                            GestureDetector(
                                              onTap: () {

                                              },
                                              child: Container(
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5),

                                // Price
                                Text(
                                    cart[index]['price'],
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700)),

                                SizedBox(height: 0),
                              ],
                            ),
                          ),
                        ),

                        /// Delete
                        GestureDetector(
                          onTap: () {
                            cart.removeAt(index);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(duration: Duration(seconds: 3),
                            //       content: Text('Data Add to Cart Please Check',
                            //         style: TextStyle(color: Colors.white,fontSize: 15),
                            //       ),
                            //       backgroundColor: Colors.black,
                            //     ));
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 9),
                            //width: sizewidth * 0.085, // 0.076
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        //color: Colors.grey.shade300,
        color: myColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Total - Rs 0.00",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 11),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    elevation: 5,
                    minWidth: 25,
                    height: 38,
                    color: Colors.grey.shade200,
                    onPressed: () {},
                    child: Text(
                      "Place Order",
                      //style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void BottomSheet() {
    showModalBottomSheet(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            child: Column(
              children: [
                Container(
                  //width: 50,
                  height: 50,
                  //color: Colors.deepPurple,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 10),
                      ]),
                  child: Row(
                    children: [
                      //SizedBox(width: 10),
                      IconButton(onPressed: () {
                        Navigator.of(context).pop();
                      },
                          icon: Icon(Icons.close_rounded,size: 28,)),
                      SizedBox(width: 5),
                      Text("Select Delivery Address",style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                ListTile(
                  trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("HOME"),
                  ),
                  title: Text("Johan Shah",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  subtitle: Text("2030, Alina society near D-mart"),
                  leading: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Icon(Icons.radio_button_checked_rounded,color: myColor),
                  ),
                ),
                ListTile(
                  trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("HOME"),
                  ),
                  title: Text("Johan Shah",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  subtitle: Text("2030, Alina society near D-mart"),
                  leading: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Icon(Icons.radio_button_checked_rounded,color: myColor),
                  ),
                ),
                Divider(thickness: 1),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Use pincode to check delivery info",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                        TextFormField(
                          //controller: phoneController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofocus: true,
                          validator: (value) {
                            return null;
                          },
                          onSaved: (value) {
                            //phoneController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.grey.shade500),
                            // ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            hintText: 'Enter pincode',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        elevation: 5,
                        minWidth: 20,
                        height: 40,
                        color: myColor,
                        onPressed: () {},
                        child: Text(
                          "Submit".toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}

