import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import '../login/Login.dart';
import '../Utility/CustomeColors.dart';

class MyProfilePage extends StatefulWidget {
  static const String routeName = '/MyProfilePage';
  final String isFromPage;

  //const MyProfilePage({super.key});
  const MyProfilePage(this.isFromPage, {Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.isFromPage != 'FromDashBoardPage'
            ? AppBar(
                title: const Text('My Account'),
              )
            : null, //AppBar( title: const Text('My Account'), ),
        body: loadUIView(context));
  }

  Widget loadUIView(BuildContext context) {
    // debugPrint("isLoginVal  isLoginOrNot: $isLoginOrNot");

    //isLoginOrNot = true;
    if (isLoginOrNot) {
      return Container(
        margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height - 80,
        child: ProfileDetails(context),
      );
    } else {
      return Container(
        child: Center(
          child: Container(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                side: BorderSide(color: Colors.black, width: 1),
              ),
              child: Text(
                "Tab to Login",
                style: TextStyle(
                    //fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage()));
              },
            ),
          ),
        ),
      );
    }
  }

  bool isLoginOrNotX = false;
  String? companyName = '',
      address1 = "",
      address2 = "",
      provission = "",
      country = "",
      zipCode = "",
      phoneNO = "";

  Widget ProfileDetails(BuildContext context) {
    return Container(
      height: 600,
      child: Container(
        // margin: new EdgeInsets.fromLTRB(5, 0, 10, 0),
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 2,
          // margin: EdgeInsets.only(left: 2, right: 2),
          // color: CustomeColors.bodyBgColor,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.white,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //padding: EdgeInsets.all(5),
                //alignment: Alignment.centerLeft,
                // width: 260,
                //margin: EdgeInsets.only(left: 5),
                margin:
                    EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 48, // Image radius
                        backgroundImage: AssetImage(
                            'assets/images/user_profile_avtar.png') //NetworkImage('imageUrl'),
                        ),

                    Divider(height: 5),
                    Text(
                      "$userEmailIDVal",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    ),
                    Divider(height: 3),
                    Text(
                      "$userDisplayNameVal",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    ),
                    Divider(height: 20),
                    DynamicUiView("Company", "$companyName"),
                    //Divider(height: 5),
                    DynamicUiView("Address 1", "$address1"),
                    // Divider(height: 5),
                    DynamicUiView("Address 2", "$address2"),
                    // Divider(height: 5),
                    DynamicUiView("Province", "$provission"),
                    // Divider(height: 5),
                    DynamicUiView("Country", "$country"),
                    //Divider(height: 5),
                    DynamicUiView("Zip Code", "$zipCode"),
                    // Divider(height: 5),
                    DynamicUiView("Mobile", "$phoneNO"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    loadPrefData();
    super.initState();
  }

  Future<void> getProfile() async {
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    var responseData = await getProfileDetails(userIDVal)
        .then((value) => {
              debugPrint('getProfile PPPP Email: ${value}'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                Customer? customerDetails = value;
                List<Addresses>? addressList = customerDetails?.addresses;
                if (addressList != null && addressList.isNotEmpty) {
                  for (Addresses address in addressList) {
                    try {
                      if (address.defaultAddress!) {
                        userEmailIDVal = customerDetails?.email ?? "";

                        userFirstNameVal = address?.firstName ?? "";
                        userLastNameVal = address?.lastName ?? "";
                        userDisplayNameVal =
                            "$userFirstNameVal $userLastNameVal";
                        userPhoneNoVal = address?.phone ?? "";

                        companyName = address?.company ?? "";
                        address1 = address?.address1 ?? "";
                        address2 = address?.address1 ?? "";
                        provission = address?.province ?? "";
                        country = address?.country ?? "";
                        zipCode = address?.zip ?? "";
                        phoneNO = address?.phone ?? "";
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                  }
                }
                OverlayLoadingProgress.stop();
              }),
            })
        .catchError((error) => {
              // ignore: avoid_debugPrint
              OverlayLoadingProgress.stop(),
              debugPrint('Login Error Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
            });
  }

  Future<void> loadPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      isLoginVal = prefs.getString(isLogin) ?? "No";
      debugPrint("isLoginVal 22 $isLoginVal");
      log("isLoginVal 333 $isLoginVal");

      setState(() {
        if (isLoginVal.endsWith("Yes")) {
          isLoginOrNot = true;
          isLoginOrNotX = true;
          debugPrint(
              "isLoginVal 44 $isLoginVal   isLoginOrNot $isLoginOrNot  isLoginOrNotX $isLoginOrNotX");

          userEmailIDVal = prefs.getString(userEmailID) ?? "";
          userIDVal = (prefs.getString(userID) ?? "")
              .replaceAll("gid://shopify/Customer/", "");
          debugPrint(
              "isLoginVal 44 $isLoginVal   isLoginOrNot $isLoginOrNot  userIDVal $userIDVal");
          userEmailIDVal = prefs.getString(userEmailID) ?? "";
          userDisplayNameVal = prefs.getString(userDisplayName) ?? "";
          userFirstNameVal = prefs.getString(userFirstName) ?? "";
          userLastNameVal = prefs.getString(userLastName) ?? "";
          userPhoneNoVal = prefs.getString(userPhoneNo) ?? "";

          getProfile();
        } else {
          isLoginOrNot = false;
          isLoginOrNotX = false;
        }
      });
      log('Login Email iD => getLoginUserDetails: $userEmailIDVal');
    } catch (e) {
      log(e.toString());
    }
  }
}

class DynamicUiView extends StatelessWidget {
  final String LabelName;
  final String LabelValue;
  const DynamicUiView(
    this.LabelName,
    this.LabelValue, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 70,
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              '${this.LabelName}:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomeColors.blackColor,
              ),
            ),
          ),
          Text(
            '${this.LabelValue}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CustomeColors.lighGray2,
            ),
          ),
        ],
      ),
    );
  }
}
