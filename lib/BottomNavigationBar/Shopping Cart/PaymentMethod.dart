import 'package:flutter/material.dart';
import 'package:fruit_market2/BottomNavigationBar/Shopping%20Cart/shopping_cart.dart';
import 'package:fruit_market2/Colors/color.dart';

import 'AddYourCard.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    double sizehight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded,size: 18),
                    onPressed: () {
                    Navigator.pop(context);
                    },

                  ),
                  Text("Total Bill : Rs 0.00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                ],
              ),

              /// Stepper
              status(),
              SizedBox(height: sizehight * 0.010),
              /// Divider(1)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Divider(thickness: 1)),
              
              /// Credit/Debit Cards || ADD NEW CARD
              SizedBox(height: sizehight * 0.006),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Credit/Debit Cards",style: TextStyle(
                   fontWeight: FontWeight.w800,
                  )),
                  SizedBox(width: sizewidth * 0.25),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => AddYourCard()));
                      },
                      child: Text("ADD NEW CARD",style: TextStyle(
                        fontSize: 12,
                        color: myColor,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                  ),
                ],
              ),

              SizedBox(height: sizehight * 0.03),
              Row(
                children: [
                  Image.asset("assets/Wallet&Card/credit-cards.png",height: 35),
                  Text("   ************4356\n   Manish Chutake",style: TextStyle(
                    color: Colors.grey
                  )),
                ],
              ),

              /// Divider(2)
              Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Divider(thickness: 1)),

              SizedBox(height: sizehight * 0.02),
              Text("Save and Pay via cards",style: TextStyle(color: Colors.grey,fontSize: 12)),

              // VISA MASTERCARD
              Row(
                children: [
                  Image.asset("assets/Wallet&Card/mastercard.png",height: 29),
                  SizedBox(width: 10),
                  Image.asset("assets/Wallet&Card/maestro.png",height: 60),
                  SizedBox(width: 10),
                  Image.asset("assets/Wallet&Card/visa.png",height: 42),
                ],
              ),

              SizedBox(height: sizehight * 0.004),
              Text("Wallet Method",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),

              SizedBox(height: sizehight * 0.03),
              /// Wallet Method
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/Wallet&Card/phonepay.png",height: 30),
                      SizedBox(width: sizehight * 0.02),
                      Text("Phone Pay",style: TextStyle(
                       fontSize: 16,
                      )),
                    ],
                  ),
                  // Divider(3)
                  Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Divider(thickness: 1)),
                  SizedBox(height: sizehight * 0.02),
                  Row(
                    children: [
                      Image.asset("assets/Wallet&Card/googlepay.png",height: 25),
                      SizedBox(width: sizehight * 0.02),
                      Text("Google Pay",style: TextStyle(
                        fontSize: 16,
                      )),
                    ],
                  ),
                  // Divider(4)
                  Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Divider(thickness: 1)),
                  SizedBox(height: sizehight * 0.02),
                  Row(
                    children: [
                      Image.asset("assets/Wallet&Card/paypal.png",height: 30),
                      SizedBox(width: sizehight * 0.02),
                      Text("Pay pal",style: TextStyle(
                        fontSize: 16,
                      )),
                    ],
                  ),
                ],
              ),

              // PAY NOW
              SizedBox(height: sizehight * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  elevation: 5,
                  minWidth: 332,
                  height: 42,
                  color: myColor,
                  onPressed: () {},
                  child: Text(
                    "pay now".toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stepper status() {
    return Stepper(
      margin: EdgeInsets.only(left: 70),
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Organic Fruit Shop',
            style: TextStyle(fontWeight: FontWeight.w600),),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('2 Items : Delivery Time  30 Min')),
        ),
        const Step(
          title: Text('Home Address'),
          content: Text('D Block  Ram Nagar ,Near Sai Petrol Pump Ring Road Nagpur-440001.'),
        ),
      ],
    );
  }
}
