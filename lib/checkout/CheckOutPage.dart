import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';
import 'package:theplugshop/address/AddAddressView.dart';
import 'package:theplugshop/login/Login.dart';
import 'package:theplugshop/payment/PaymentPage.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import 'package:theplugshop/shopifypkg/ShopifyAPICall.dart';
import '../Utility/CustomeColors.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final cartController = Get.put(CartController());
  var carCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    loadPrefData();
    super.initState();
  }

  Future<void> loadPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoginVal = prefs.getString(isLogin) ?? "No";
      debugPrint("isLoginVal 22 $isLoginVal");
      setState(() {
        if (isLoginVal.endsWith("Yes")) {
          isLoginOrNot = true;
          userIDVal = (prefs.getString(userID) ?? "")
              .replaceAll("gid://shopify/Customer/", "");
          debugPrint("userIDVal 44 $userIDVal");

          getProfile();
        } else {
          isLoginOrNot = false;
        }
      });
      log('Login Email iD => getLoginUserDetails: $userEmailIDVal');
    } catch (e) {
      log(e.toString());
    }
  }

  late List<Addresses> addressList = [];
  late Addresses shipingAddress;
  late int addressSelectedIndex = 0;
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
                try {
                  Customer? customerDetails = value;
                  addressList = (customerDetails?.addresses)!;
                  for (Addresses address in addressList!) {
                    addressSelectedIndex = addressSelectedIndex + 1;
                    if (address.defaultAddress!) {
                      shipingAddress = address;
                      break;
                    }
                  }
                } catch (e) {
                  log(e.toString());
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

  @override
  Widget build(BuildContext context) {
    carCount = cartController.cartProductListGlobal.length ?? 0;
    if (carCount > 0) {
      carCount = carCount + 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Text(
                "Your shipping Address ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16),
                //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),

            Container(
              height: 140,
              child: shipingAddressUiView(context),
            ),

            //SizedBox(height: 15),
            Container(
              //flex: 1,
              height: MediaQuery.of(context).size.height*0.59,

              child: ListView.builder(
                itemCount: carCount, //bag.length,
                itemBuilder: (ctx, final int indexx) {
                  if (indexx <= carCount - 2) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          // Expanded(

                          //child: Container(
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: Image.network(
                              "${cartController.cartProductListGlobal[indexx].image!.src}",
                              fit: BoxFit.contain,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          //),
                          SizedBox(width: 5),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${cartController.cartProductListGlobal[indexx].title}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(35, 35, 35, 1)),
                                  //style: Theme.of(context).textTheme.title,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${cartController.cartProductListGlobal[indexx].variants?[0].title}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "$paymentCurrency${cartController.cartProductListGlobal[indexx].variants?[0].price}",
                                ),
                                /*  SizedBox(height: 5),
                                Text(
                                  "${cartController.cartProductListGlobal[indexx].vendor}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1)),
                                ),
                                SizedBox(height: 15),
                                MyCounter(),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "ORDER SUMMARY",
                              style: TextStyle(
                                  color: Color.fromRGBO(35, 35, 35, 1),
                                  fontWeight: FontWeight.bold),
                              //style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Container(
                                    // padding:EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    //color: Colors.pink[300],
                                    //height: 100,
                                    child: Text(
                                      'Sub Total:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),

                                ),
                                 Container(
                                    alignment: Alignment.centerRight,
                                    //height: 100,
                                    //color: Colors.green,
                                    child: Obx(
                                      () => Text(
                                        '$paymentCurrency${cartController.totalPrice}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),

                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                    // padding:EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    //color: Colors.pink[300],
                                    //height: 100,
                                    child: Text(
                                      'Grand Total:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),

                                Container(
                                    alignment: Alignment.centerRight,
                                    //height: 100,
                                    //color: Colors.green,
                                    child: Obx(
                                      () => Text(
                                        '$paymentCurrency${cartController.totalPrice}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),

                              ],
                            ),
                            const Divider(
                              height: 25,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                //Expanded(
                                 // flex: 50,
                                Container(
                                  //height: 5,
                                  width: MediaQuery.of(context).size.width*0.50,
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    margin: EdgeInsets.all(1),
                                    alignment: Alignment.centerLeft,
                                    //color: Colors.pink[300],
                                    height: 45,
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                      decoration: InputDecoration(
                                        labelText: 'Coupon Code',
                                        hintText: 'Coupon Code',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                        border: UnderlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          //<-- SEE HERE
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Expanded(
                                 // flex: 40,
                                Container(
                      width: MediaQuery.of(context).size.width*0.40,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.all(1),
                                    margin: EdgeInsets.all(1),
                                    child: Container(
                                      child: Container(
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            side: BorderSide(
                                                color: Colors.black, width: 1),
                                          ),
                                          child: Text(
                                            "Apply Coupan",
                                            style: TextStyle(
                                                //fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),

                    );
                  }
                },
              ),
            ),



            Container(
              height: 5,
              width: MediaQuery.of(context).size.width - 10,
              margin: EdgeInsets.only(bottom: 2),
            ),



            Divider(),


            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[ Container(
                    height: 45,
                     width: MediaQuery.of(context).size.width - 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Continue to shipping",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _openPaymentPage();
                      },
                    ),
                  ),

              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget shipingAddressUiView(BuildContext context) {
    if (!isLoginVal.endsWith("Yes")) {
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
    } else {
      return Container(
        child: Container(
          //margin: new EdgeInsets.fromLTRB(5, 0, 10, 0),
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 2,
            margin: EdgeInsets.only(left: 1, right: 1),
            // color: CustomeColors.bodyBgColor,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            color: Colors.white,

            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //height: 140,
                  color: Colors.amber,
                  width: 10,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  //padding: EdgeInsets.all(5),
                  //alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width - 100,
                  //margin: EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          '${shipingAddress.firstName} ${shipingAddress.lastName}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: CustomeColors.blackColor),
                        ),
                      ),
                      AddressUiView(shipingAddress.company ?? ""),
                      AddressUiView(
                          "${shipingAddress.address1 ?? ""}, ${shipingAddress.address2 ?? ""} "),
                      AddressUiView(
                          "${shipingAddress.city ?? ""}, ${shipingAddress.province ?? ""} "),
                      AddressUiView(
                          "${shipingAddress.country ?? ""}, ${shipingAddress.provinceCode ?? ""}, ${shipingAddress.zip ?? ""}"),
                      AddressUiView(shipingAddress.phone ?? ""),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 0),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 32,
                            ),
                            onTap: () {
                              // _showDetailPage(addressList[index], 'Edit Address');
                              showShippingAddress(context);
                            },
                          ),
                        ),
                        Divider(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 0),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 32,
                            ),
                            onTap: () {
                              //_deleteContact(context, addressList[index].id.toString());
                              _addNewAddress(Addresses(), 'Add Address');
                            },
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget AddressUiView(String labValue) {
    return Container(
        // margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2),
        child: Text(
          "$labValue",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomeColors.blackColor),
        ));
  }

  void _addNewAddress(Addresses contact, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddAddressView(contact, title);
    }));
  }

  late String _webPaymentLink = "";
  Future<void> getPaymentLink() async {
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );
    await createCheckoutWithWebPaymentURL(
            shipingAddress, cartController.cartProductListGlobal)
        .then((value) => {
              debugPrint('CheckOutPage getPaymentLink response: $value'),
              _webPaymentLink = value,
              OverlayLoadingProgress.stop(),
            })
        .catchError((error) => {
              // ignore: avoid_debugPrint
              _webPaymentLink = "",
              OverlayLoadingProgress.stop(),
              debugPrint('CheckOutPage getPaymentLink Error: $error'),
              ShowTostMsg(error.toString()),
              //return "",
            });
  }

  void _openPaymentPage() async {
    if (isLoginVal.endsWith("Yes")) {
      await getPaymentLink(); // "https://theno1plugshop.myshopify.com/60653175006/checkouts/2aac0323e58b11701f350554a5365a7f";
      if (_webPaymentLink.isNotEmpty || _webPaymentLink.contains("Error")) {
        ShowTostMsg("Re-Directing to payment page");
        debugPrint(
            'CheckOutPage _openPaymentPage Re-Directing to payment page: $_webPaymentLink');
        bool result =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PaymentPage("Payment Page", _webPaymentLink);
        }));
      } else {
        debugPrint(
            'CheckOutPage _openPaymentPage Error to payment page: $_webPaymentLink');
        ShowTostMsg(SomeThingWentWrong);
      }
    } else {
      debugPrint('CheckOutPage _openPaymentPage Not Login:');
      ShowTostMsg(PlsLoginFrisr);
    }
  }

  void showShippingAddress(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Stack(
                      //alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Align(
                            //padding: const EdgeInsets.all(8.0),
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'Select Your shipping Address',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                //backgroundColor: Colors.white,
                                minimumSize: const Size(40, 40),
                                backgroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  //side: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                color: CustomeColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: CustomeColors.blackColor,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(2),
                      child: ListView.separated(
                          itemCount: addressList!.length, //.length,
                          separatorBuilder: (context, int) {
                            return const Divider(
                              color: CustomeColors.lighGray2,
                            );
                          },
                          itemBuilder: (context, indexX) {
                            return GestureDetector(
                                child: Stack(
                                  // child: Row(
                                  children: [
                                    Container(
                                      child: Radio(
                                        value:
                                            addressSelectedIndex, //Active Index
                                        groupValue: indexX,
                                        activeColor: CustomeColors.blackColor,
                                        onChanged: (value) => {},
                                      ),
                                    ),
                                    Container(
                                      // height: 25,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(
                                          left: 45, top: 10),
                                      alignment: Alignment.centerLeft,

                                      child: Text(
                                          '${addressList[indexX].address1}, ${addressList[indexX].address2}, ${addressList[indexX].city}, ${addressList[indexX].zip}, ${addressList[indexX].countryName}, (${addressList[indexX].firstName} ${addressList[indexX].lastName}, ${addressList[indexX].countryName})',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: CustomeColors.blackColor)),
                                    ),
                                  ],
                                  // ),
                                ),
                                onTap: () {
                                  setState(() {
                                    shipingAddress = addressList[indexX];
                                  });
                                  ShowTostMsg(
                                      "Your shipping Address Added for delivery");
                                  Navigator.of(context).pop();
                                });
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
