import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
//import 'package:ui_tut/constants.dart';
import 'package:theplugshop/Utility/CustomeColors.dart';
import 'package:theplugshop/login/ForgotPassword.dart';
import 'package:theplugshop/login/Login.dart';

import '../Utility/UtilityClass.dart';
import '../shopifypkg/ShopifyAPICall.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  late String firstName, lastName, email, password;

  Widget _buildLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            'assets/images/plug_copy_new.png',
            fit: BoxFit.contain,
            // height: 32,
          ),
        )
      ],
    );
  }

  Widget _buildFirstNameRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            firstName = value;
          });
        },
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: CustomeColors.blackColor,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: CustomeColors.lighGray2,
            fontSize: 18,
            //fontWeight: FontWeight.bold,
          ),
          border: UnderlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: CustomeColors.mainColor,
            ), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide: BorderSide(width: 1, color: CustomeColors.blackColor),
          ),
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: CustomeColors.blackColor,
          ),
          labelText: 'First Name',
          hintText: "First Name",
          hintStyle: TextStyle(fontSize: 16.0, color: CustomeColors.lighGray2),
        ),
      ),
    );
  }

  Widget _buildLastRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            lastName = value;
          });
        },
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: CustomeColors.blackColor,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: CustomeColors.lighGray2,
            fontSize: 18,
            //fontWeight: FontWeight.bold,
          ),
          border: UnderlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: CustomeColors.mainColor,
            ), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide: BorderSide(width: 1, color: CustomeColors.blackColor),
          ),
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: CustomeColors.blackColor,
          ),
          labelText: 'Last Name',
          hintText: "Last Name",
          hintStyle: TextStyle(fontSize: 16.0, color: CustomeColors.lighGray2),
        ),
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: CustomeColors.blackColor,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: CustomeColors.lighGray2,
            fontSize: 18,
            //fontWeight: FontWeight.bold,
          ),
          border: UnderlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: CustomeColors.mainColor,
            ), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide: BorderSide(width: 1, color: CustomeColors.blackColor),
          ),
          prefixIcon: Icon(
            Icons.email_outlined,
            color: CustomeColors.blackColor,
          ),
          labelText: 'E-mail',
          hintText: "E-Mail",
          hintStyle: TextStyle(fontSize: 16.0, color: CustomeColors.lighGray2),
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: CustomeColors.blackColor,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: CustomeColors.lighGray2,
            fontSize: 18,
            //fontWeight: FontWeight.bold,
          ),
          border: UnderlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: CustomeColors.mainColor,
            ), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide: BorderSide(width: 1, color: CustomeColors.blackColor),
          ),
          prefixIcon: Icon(
            Icons.key,
            color: CustomeColors.blackColor,
          ),
          labelText: 'Password',
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 16.0, color: CustomeColors.lighGray2),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //FlatButton(
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => new ForgotPassword()));
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomeColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 45, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          //child: RaisedButton(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            /* elevation: 5.0,
            color: CustomeColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ), */
            onPressed: () {
              signupAPICall();
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomeColors.mainColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  // width: 200,
                  // height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 0,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 30,
                      child: Text(""),
                    ),
                  ],
                ),
                _buildFirstNameRow(),
                _buildLastRow(),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                _buildSignUpBtn(),
                //_buildOrRow(),
                //_buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),

          //child: FlatButton(
          child: Container(
            height: 45, //1.4 * (MediaQuery.of(context).size.height / 20),
            width: 5 * (MediaQuery.of(context).size.width / 10),
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => new LoginPage()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      color: CustomeColors.mainColor,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomeColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomeColors.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20),
                        bottomRight: const Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  //height: 1400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      _buildLogo(),
                      _buildContainer(),
                      // _buildSignUpBtn(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signupAPICall() async {
    try {
      if (firstName.isEmpty || firstName.length < 1) {
        ShowTostMsg(ValidFirstName);
        return;
      } else if (lastName.isEmpty || lastName.length < 1) {
        ShowTostMsg(ValidLastName);
        return;
      } else if (email.isEmpty || email.length < 6 || !isValidEmail(email)) {
        ShowTostMsg(validEmailAddress);
        return;
      } else if (password.isEmpty || password.length < 5) {
        ShowTostMsg(validPassword);
        return;
      } else {
        OverlayLoadingProgress.start(
          context,
          gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
        );

        var responseData =
            await signupUser(firstName, lastName, email, password)
                .then((value) => {
                      OverlayLoadingProgress.stop(),
                      print('User Email: ${value.email}'),

                      saveUserData(isLogin, 'Yes'),

                      // gVal = value.id, //gid: //shopify/Customer/
                      saveUserData(userID,
                          value.id?.replaceAll("gid://shopify/Customer/", "")),
                      saveUserData(userEmailID, value.email),
                      saveUserData(userDisplayName, value.displayName),
                      saveUserData(userFirstName, value.firstName),
                      saveUserData(userLastName, value.lastName),
                      saveUserData(userPhoneNo, value.phone),
                      isLoginOrNot = true,
                      isLoginVal = 'Yes',
                      userIDVal = value.id ?? "",
                      userEmailIDVal = value.email ?? "",
                      userDisplayNameVal = value.displayName ?? "",
                      userFirstNameVal = value.firstName ?? "",
                      userLastNameVal = value.lastName ?? "",
                      userPhoneNoVal = value.phone ?? "",
                      address = value.address,
                      ShowTostMsg(SuccessMsg),

                      Navigator.of(context).pop(),
                    })
                .catchError((error) => {
                      // ignore: avoid_print
                      OverlayLoadingProgress.stop(),
                      print('Login Error Exceptions 1: $error'),
                      ShowTostMsg(SomeThingWentWrong),
                    });
      }
    } catch (error) {
      OverlayLoadingProgress.stop();
      log('Login Error 2: ${error.toString()}');
    }
  }
}
