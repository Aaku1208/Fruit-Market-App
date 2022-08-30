import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_market2/Colors/color.dart';
import 'package:fruit_market2/PhoneLoadingVarification/name_address.dart';
import 'package:pinput/pinput.dart';

import 'loading_screen.dart';

class PhoneNoAndOTP extends StatefulWidget {
  const PhoneNoAndOTP({Key? key}) : super(key: key);

  @override
  _PhoneNoAndOTPState createState() => _PhoneNoAndOTPState();
}

class _PhoneNoAndOTPState extends State<PhoneNoAndOTP> {
  /// Form Key
  final _formKey = GlobalKey<FormState>();

  /// Editing Controller
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  final defaultPinTheme = PinTheme(
    //OtpVerifyPage
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(top: 70),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: phoneController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 10,
                autofocus: true,
                //autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{10,}$');
                  if (value!.isEmpty) {
                    return ("Please Enter Your Mobile No");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Please Valid Mobile(Min. 10 Character)");
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneController.text = value!;
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.grey.shade500),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade500, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Colors.grey.shade500, width: 1.5),
                  ),
                  prefixIcon: Container(
                    height: 59,
                    width: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        color: Colors.grey.shade500,
                        width: 1.4,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "+ 91",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                  ),
                  hintText: 'Enter Your Mobile Number',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              Visibility(
                visible: otpVisibility,
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Enter The 6 digit code that was",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'send to your Mobile Number +91 ${phoneController.text}',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          controller: otpController,
                          pinAnimationType: PinAnimationType.rotation,
                          validator: (value) {
                            RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
                            if (value!.isEmpty) {
                              return ("Please enter 6 digit code");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please enter valid code");
                            }
                            return null;
                          },
                          onSubmitted: (value) {
                            otpController.text = value;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size * .1),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                elevation: 5,
                minWidth: 325,
                height: 44,
                color: myColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (otpVisibility) {
                      verifyOTP();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NameAddressPage()));
                    } else {
                      loginWithPhone();
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoadingScreen()));
                    }
                  }
                },
                child: Text(
                  "verify".toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginWithPhone()  {
     auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

      await auth.signInWithCredential(credential).then(
            (value) {
          setState(() {
            user = FirebaseAuth.instance.currentUser;
          });
        },
      ).whenComplete(
      () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully \nPlease Enter Name and Address",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}



