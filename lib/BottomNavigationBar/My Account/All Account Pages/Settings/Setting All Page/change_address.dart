import 'package:flutter/material.dart';
import 'package:fruit_market2/Shared%20Preferences%20class/login_shared_preferences.dart';

import '../../../../../Colors/color.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    //double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: myColor,
        title: const Text("Change Address"),
      ),
      body: Column(
        children: [
          SizedBox(height: sizeheight * 0.01),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //controller: addressController,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.streetAddress,
              minLines: 4,//Normal textInputField will be displayed
              maxLines: 5,// when user presses enter it will adapt to it
              autofocus: true,
              textInputAction: TextInputAction.done,
              // inputFormatters: [
              //   TextInputFormatter.withFunction((oldValue, newValue) => null)
              // ],
              decoration: InputDecoration(

                hintText: LogInSharedPreferences.getOAddress,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(borderRadius:
                const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.shade500,width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.shade500,width: 1.5),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          SizedBox(height: sizeheight *.07),
          MaterialButton(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 5,
            minWidth: 332,
            height: 42,
            color: myColor,
            onPressed: () {
            },
            child: Text("change".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),

        ],
      ),
    );
  }
}
