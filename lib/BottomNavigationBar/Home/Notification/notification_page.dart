import 'package:flutter/material.dart';
import 'package:fruit_market2/Colors/color.dart';

import 'all_image_text_notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        backgroundColor: myColor,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Today
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,bottom: 7),
              child: Text("Today",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListView.separated(
                  itemCount: NotificationTextOfToday.length,
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
                                    NotificationTextOfToday[index]['image'],),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(NotificationTextOfToday[index]['subtitle1'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),

                                      SizedBox(height: 8),
                                      Text(NotificationTextOfToday[index]['subtitle2'],
                                          style: const TextStyle(color: Color(0xffB2B2B2), fontSize: 12)),
                                      SizedBox(height: 8),
                                      Text(
                                        NotificationTextOfToday[index]['subtitle3'],
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
                          margin: EdgeInsets.only(right: 9,top: 9),
                          width: size* 0.085, // 0.076
                          alignment: Alignment.topRight,
                          height: 100,
                          child: Icon(
                            Icons.more_vert_rounded,
                            size: 20,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(thickness: 1,);
                  },
            ),

            /// Yesterday
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,bottom: 12),
              child: Text("Yesterday",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListView.separated(
              itemCount: NotificationTextOfYesterday.length,
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
                                NotificationTextOfYesterday[index]['image'],),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(NotificationTextOfYesterday[index]['subtitle1'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),

                                  SizedBox(height: 8),
                                  Text(NotificationTextOfYesterday[index]['subtitle2'],
                                      style: const TextStyle(color: Color(0xffB2B2B2), fontSize: 12)),
                                  SizedBox(height: 8),
                                  Text(
                                    NotificationTextOfYesterday[index]['subtitle3'],
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
                      margin: EdgeInsets.only(right: 9,top: 10),
                      width: size* 0.085, // 0.076
                      alignment: Alignment.topRight,
                      height: 100,
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 1,);
              },
            ),

          ],
        ),
      ),
    );
  }
}
