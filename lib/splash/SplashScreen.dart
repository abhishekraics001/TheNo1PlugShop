import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'dart:async';
import '../tabs/DashBoardPage.dart';
import '../Utility/SharePrefHelper.dart';
import '../shopifypkg/ShopifyAPICall.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLoginUserDetails();
    getShopDetailDataX();
  }

  void getLoginUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoginVal = prefs.getString(isLogin) ?? "No";
      debugPrint("isLoginVal $isLoginVal");
      log("isLoginVal $isLoginVal");

      if (isLoginVal.endsWith("Yes")) {
        isLoginOrNot = true;
        userEmailIDVal = prefs.getString(userEmailID) ?? "";
        userIDVal = prefs.getString(userID) ?? "";
        userEmailIDVal = prefs.getString(userEmailID) ?? "";
        userDisplayNameVal = prefs.getString(userDisplayName) ?? "";
        userFirstNameVal = prefs.getString(userFirstName) ?? "";
        userLastNameVal = prefs.getString(userLastName) ?? "";
        userPhoneNoVal = prefs.getString(userPhoneNo) ?? "";
        //address = prefs.getString(userEmailID)!;
        log('Login Email iD => getLoginUserDetails: $userEmailIDVal');

        userAccessTockenVal = await createUserAccessTocken();
        debugPrint('Shop userAcc: $userAccessTockenVal');
        if (userAccessTockenVal.isNotEmpty) {
          prefs.setString(userAccessTocken, userAccessTockenVal);
        }
        userAccessTockenVal = prefs.getString(userAccessTocken) ?? "";
        debugPrint('Shop userAccessTockenVal: $userAccessTockenVal');
      } else {
        isLoginOrNot = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void getShopDetailDataX() async {
//    executeGraphQLAPI();

    //Future<List<Product>> getAllProductsFromCollectionById(String id)

    var responseDataX = await fetchProductFromStoreyCollectionID()
        .then((value) => {
              debugPrint('Shop response: $value'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                String x = value;
                loadNavigateToHomepgae();
              }),
            })
        .catchError((error) => {
              // ignore: avoid_print
              OverlayLoadingProgress.stop(),
              debugPrint('Shop response Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
              loadNavigateToHomepgae(),
            });

    var responseData = await getShopDetails()
        .then((value) => {
              debugPrint('Shop response: $value'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                String x = value;
                loadNavigateToHomepgae();
              }),
            })
        .catchError((error) => {
              // ignore: avoid_print
              OverlayLoadingProgress.stop(),
              debugPrint('Shop response Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
              loadNavigateToHomepgae(),
            });
  }

  void loadNavigateToHomepgae() {
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => new DashBoardPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_image_new.png'),
                fit: BoxFit.fill),
          ),
        ));
  }

  void executeGraphQLAPI() {
    //readProductData();
    //AddToCartGraphQL();
    //XXXP();
  }
}
