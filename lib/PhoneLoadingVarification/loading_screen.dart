import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 1),(){
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const VerificationDonePage()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: size *.3),
            SizedBox(width: size *.6),
            Container(
              //margin: const EdgeInsets.all(100),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              width: 150,
              child: const LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                colors: [Color(0xff69A03A)],
                strokeWidth: 1,
                // backgroundColor: Colors.black,
              ),
            ),
            SizedBox(height: size *.1),
            const Text("Verifying Your Mobile Number",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )
    );
  }
}
