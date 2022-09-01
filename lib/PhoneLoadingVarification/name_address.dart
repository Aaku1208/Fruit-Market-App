import 'package:flutter/material.dart';

import '../Colors/color.dart';
import '../Pages/welcome_page.dart';

class NameAddressPage extends StatefulWidget {
  const NameAddressPage({Key? key}) : super(key: key);

  @override
  State<NameAddressPage> createState() => _NameAddressPageState();
}

class _NameAddressPageState extends State<NameAddressPage> {
  /// Form Key
  final _formKey = GlobalKey<FormState>();

  /// Editing Controller
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size * .07),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  /// FirstName
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Firstname",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: firstNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.name,
                          autofocus: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("First Name cannot be Empty");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstNameController.text = value!;
                          },
                          //textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1.5),
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// SecondName
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Lastname",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: secondNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.name,
                          autofocus: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Last Name cannot be Empty");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            secondNameController.text = value!;
                          },
                          //textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1.5),
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Email Address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          validator: (value) => validateEmail(value),
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          //textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade500, width: 1.5),
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addressController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.streetAddress,
                      minLines: 4,
                      //Normal textInputField will be displayed
                      maxLines: 5,
                      // when user presses enter it will adapt to it
                      autofocus: true,
                      validator: (value) {
                        RegExp regex = RegExp(
                            '[0-9\\\/# ,a-zA-Z]+[ ,]+[0-9\\\/#, a-zA-Z]{1,}');
                        if (value!.isEmpty) {
                          return ("Address cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter a valid Address");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressController.text = value!;
                      },
                      //textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey.shade500),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 1.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 1.5),
                        ),
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size * .07),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              elevation: 5,
              minWidth: 332,
              height: 42,
              color: myColor,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const WelcomePage()));
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
    );
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Email cannot be Empty';
  }
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}
