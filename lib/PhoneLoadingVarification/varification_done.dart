import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerificationDonePage extends StatefulWidget {
  const VerificationDonePage({Key? key}) : super(key: key);

  @override
  State<VerificationDonePage> createState() => _VerificationDonePageState();
}
class _VerificationDonePageState extends State<VerificationDonePage> {

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 1),(){
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => ()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size *.1),
          SizedBox(width: size *.6),
          Container(
            child: Lottie.asset('assets/image/63092-done-animation.json'),
          ),
          const Text("Verification Code Send on",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: size *.01),
          const Text("your Registered Mobile Number",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
