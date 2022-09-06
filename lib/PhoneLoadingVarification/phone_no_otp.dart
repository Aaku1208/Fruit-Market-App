import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_market2/PhoneLoadingVarification/name_address.dart';
import 'package:pinput/pinput.dart';

import '../Colors/color.dart';


enum LoginScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}
class PhoneNoAndOTP extends StatefulWidget {
  const PhoneNoAndOTP({Key? key}) : super(key: key);

  @override
  _PhoneNoAndOTPState createState() => _PhoneNoAndOTPState();
}

class _PhoneNoAndOTPState extends State<PhoneNoAndOTP> {

  TextEditingController  phoneController = TextEditingController();
  TextEditingController  otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _otpformKey = GlobalKey<FormState>();

  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;

  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";

  void SignOutME() async{
    await _auth.signOut();
  }
  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
  {

    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if(authCred.user != null)
      {

        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const NameAddressPage()));
        Fluttertoast.showToast(
            msg: "Verification Successfully please enter your details", timeInSecForIosWeb: 2);

      }
    } on FirebaseAuthException catch (e) {

      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(duration: Duration(seconds: 4),
            content: Text('Invalid OTP Please enter valid OTP',
              style: TextStyle(color: Colors.white,fontSize: 15),
            ),
            backgroundColor: Colors.redAccent,
          ));
    }
  }

  /// Phone
  showMobilePhoneWidget(context){
    double size = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: size * 0.10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: phoneController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: 10,
              autofocus: true,
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
                  borderRadius: BorderRadius.all(Radius.circular(13)),
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
            SizedBox(height: size * 0.03),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              elevation: 5,
              minWidth: 325,
              height: 44,
              color: myColor,
              onPressed: () async{
                if (_formKey.currentState!.validate()) {
                  await _auth.verifyPhoneNumber(

                      phoneNumber: "+91${phoneController.text}",
                      verificationCompleted: (phoneAuthCredential) async{


                      },
                      verificationFailed: (verificationFailed){
                        print(verificationFailed);
                      },

                      codeSent: (verificationID, resendingToken) async{
                        setState(() {

                          currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                          this.verificationID = verificationID;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationID) async{
                      }
                  );
                }
              },
              child: Text(
                "Send OTP".toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// OTP
  showOtpFormWidget(context){
    double size = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: size *0.10),
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
          SizedBox(height: size * 0.01),
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
          SizedBox(height: size *0.04),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _otpformKey,
                child: Pinput(
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
              ),
              SizedBox(height: size * 0.04),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                elevation: 5,
                minWidth: 325,
                height: 44,
                color: myColor,
                onPressed: () async{
                  if (_otpformKey.currentState!.validate()) {
                    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
                    signInWithPhoneAuthCred(phoneAuthCredential);
                  }
                },
                child: Text(
                  "verify".toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


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
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),
    );
  }
}






