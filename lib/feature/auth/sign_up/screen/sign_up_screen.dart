import 'package:breathy/feature/home/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: context.percentHeight * 100,
            top: 0,
            child: Image.asset(
              "assets/images/auth-bg-cropped.jpg",
              fit: BoxFit.fitHeight,
              height: context.percentHeight * 100,
              alignment: Alignment.centerLeft,
            ),
          ),
          Positioned(
              top: 150, child: "B R E A T H Y".text.xl5.bold.white.make()),
          Positioned(
            top: 280,
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: context.percentWidth * 75,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextField(
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      20.heightBox,
                      const TextField(
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Email Address",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      20.heightBox,
                      const TextField(
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ],
                  ).px(24),
                ),
                24.heightBox,

                // Sign Up Button

                GestureDetector(
                  onTap: (() => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      )),
                  child: Container(
                    height: 48,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: "Sign Up".text.xl.bold.makeCentered(),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 600,
            child: SizedBox(
              width: context.percentWidth * 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 2,
                    width: context.percentWidth * 35,
                    color: Colors.white,
                  ),
                  "Or".text.xl.white.make(),
                  Container(
                    height: 2,
                    width: context.percentWidth * 35,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 650,
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => HomeScreen())),
              child: Container(
                height: 48,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.google),
                    10.widthBox,
                    "Sign Up with Google".text.xl.bold.make()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
