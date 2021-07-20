import 'package:flutter/material.dart';
import 'package:sk_mini/Controller/passwordController.dart';
import 'package:sk_mini/View/homeScreen.dart';
import 'package:sk_mini/View/signUpScreen.dart';
import 'package:sk_mini/Widgets/gradientButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String password;
  late String email;

  //if signin or forgot password
  Future<Widget> isSignOrForgot() async {
    bool isSignin = await PasswordController.isSignin();

    if (isSignin) {
      return GestureDetector(
        onTap: () {
          //go to register page
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => SignUpScreen()));
        },
        child: Text(
          "Forgot password",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          //go to register page
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => SignUpScreen()));
        },
        child: Text(
          "New here, Sign UP",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Container(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Text(
                              "LOGIN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            radius: 50,
                            backgroundColor: Colors.cyan,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "Email Address",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2.0, color: Colors.green),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2.0, color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2.0, color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    validator: (text) {
                                      if (text != null &&
                                          text.isNotEmpty &&
                                          RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                              .hasMatch(text)) {
                                        email = text;
                                      } else {
                                        return 'Enter Valid Email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2.0, color: Colors.green),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2.0, color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 2.0, color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    validator: (text) {
                                      if (text != null &&
                                          text.isNotEmpty &&
                                          text.length >= 4) {
                                        password = text;
                                      } else {
                                        return 'Enter Valid Password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GradientButton(
                            onpressed: () async {
                              if (_formKey.currentState!.validate()) {
                                //login creds were valid
                                bool status =
                                    await PasswordController.checkPassword(
                                        password: password, email: email);

                                if (status) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => HomeScreen()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Please enter valid credentials")));
                                }
                              }
                            },
                            buttonName: "Login",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
