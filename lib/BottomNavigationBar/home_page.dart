// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Colors/color.dart';
import '../TabBar/dry_fruits_Page.dart';
import '../TabBar/fruits_page.dart';
import '../TabBar/vagetables_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: sizeheight*.18,
                        width: double.infinity,
                        color: myColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "Fruit Market",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: sizeheight * .01, width: sizewidth*.13),
                              Column(
                                children: const [
                                  Icon(Icons.notifications_rounded,
                                      size: 27, color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: sizeheight*0.15, left: sizewidth*0.03, right: sizewidth*0.03),
                        height: sizeheight*.06,
                        width: sizewidth *1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 20.0),
                            ]),
                        child: TextField(
                          onTap: () {},
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search_rounded,
                                size: 25, color: Colors.grey),
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: sizeheight * .02),
                  PreferredSize(
                    preferredSize: const Size.fromHeight(500),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffCC7D00),
                      ),
                      indicatorPadding: const EdgeInsets.all(10),
                      isScrollable: true,

                      //indicatorColor: Colors.black,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[700],
                      unselectedLabelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey[800]),
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      labelPadding: EdgeInsets.symmetric(horizontal: 30),
                      tabs: const [
                        Tab(child: Text('Vegetables')),
                        Tab(child: Text('Fruits')),
                        Tab(child: Text('Dry Fruits')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeheight *.65,
                    width: sizewidth *1,
                    child: const TabBarView(
                      children: [
                        VegeTablesPage(),
                        FruitsPage(),
                        DryFruitsPage(),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
