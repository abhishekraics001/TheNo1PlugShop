import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/Utility/CustomeColors.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/login/Login.dart';
import 'package:theplugshop/myorder/MyOrderPage.dart';
import 'package:theplugshop/myorder/OrderListData.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import 'package:timelines/timelines.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
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
      print("isLoginVal 22 $isLoginVal");
      setState(() {
        if (isLoginVal.endsWith("Yes")) {
          isLoginOrNot = true;
          userIDVal = (prefs.getString(userID) ?? "")
              .replaceAll("gid://shopify/Customer/", "");
          print("userIDVal 44 $userIDVal");

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

  late List<Orders>? orderListData = [];
  Future<void> getProfile() async {
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );
    var responseData = await getOrderListData(userIDVal)
        .then((value) => {
              print('getProfile PPPP Email: ${value}'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                try {
                  //Customer? customerDetails  =  value;
                  orderListData = value; //(customerDetails?.addresses)!;
                } catch (e) {
                  log(e.toString());
                }
                OverlayLoadingProgress.stop();
              }),
            })
        .catchError((error) => {
              // ignore: avoid_print
              OverlayLoadingProgress.stop(),
              print('Login Error Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: loadUIView(context),
    );
  }

  Widget loadUIView(BuildContext context) {
    if (isLoginOrNot) {
      return SafeArea(
        child: orderListView(),
      );
    } else {
      return Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage()));
              // Navigate back to first route when tapped.
            },
            child: const Text('Tab to Login'),
          ),
        ),
      );
    }
  }

  ListView orderListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orderListData?.length ?? 0,
      itemBuilder: (BuildContext context, int position) {
        return listItem(context, position);
      },
    );
  }

  Widget listItem(BuildContext context, int index) {
    return Container(
      child: Container(
        margin: new EdgeInsets.fromLTRB(5, 0, 10, 0),
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(
              left: 2, right: 2), // color: CustomeColors.bodyBgColor,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Colors.grey.shade50,
            ),
          ),
          color: Colors.white,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 140,
                color: Colors.amber,
                width: 10,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                /*  child: InkWell(
                  // on Tap function used and call back function os defined here
                    onTap: () {
                    }
                ),*/

                width: MediaQuery.of(context).size.width - 60,
                margin: EdgeInsets.only(left: 1),
                child: InkWell(
                  onTap: () {
                    // _showDetailPage(addressList[index],'Edit Address');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyOrderPage(orderListData![index])));
                  },

                  //padding: EdgeInsets.all(5),
                  //alignment: Alignment.centerLeft,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child: isDefaultAddress(index),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderPaymentStatus(
                            index, "Fulfillment Status", "Unfulfilled"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderPaymentStatus(index, "Payment Status",
                            "${orderListData![index].financialStatus}"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderPaymentStatus(index, "No of Items",
                            "${orderListData![index].lineItems?.length}"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderPaymentStatus(index, "Grand Total",
                            "£${orderListData![index].totalPrice}"),
                      )
                      /* AddressUiView(addressList[index].company ?? ""),
                    AddressUiView( "${addressList[index].address1 ?? ""}, ${addressList[index].address2 ?? ""} "),
                    AddressUiView("${addressList[index].city ?? ""}, ${addressList[index].province ?? ""} "),
                    AddressUiView("${addressList[index].country ?? ""}, ${addressList[index].provinceCode ?? ""}, ${addressList[index].zip ?? ""}"),
                    AddressUiView(addressList[index].phone ?? ""),*/
                    ],
                  ),
                ),
              ),
              /* Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 0),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onTap: () {
                            _showDetailPage(
                                addressList[index],
                                'Edit Address');
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
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            _deleteContact(context, addressList[index].id.toString());
                          },
                        ),
                      ),
                    ]),
              ),*/
            ],
          ),
        ),
      ),
    );
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

  Widget isDefaultAddress(int index) {
    if (index == 0) {
      return Container(
        //height: 40,
        alignment: Alignment.topLeft,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${orderListData?[index].name ?? ""}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Colors.blue),
              ),
              Text(
                "${orderListData?[index].createdAt ?? ""} ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: CustomeColors.blackColor),
              ),
            ]),
      );
    } else {
      return Container(
        child: Text(
          "#216472",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
              color: CustomeColors.blackColor),
        ),
      );
    }
  }

  Widget OrderPaymentStatus(int index, String lableVal, String Value) {
    return Container(
      //height: 40,
      alignment: Alignment.topLeft,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$lableVal :",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: CustomeColors.blackColor),
            ),
            Text(
              "$Value ",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: CustomeColors.blackColor),
            ),
          ]),
    );
  }
}

class OrderStatusSreps extends StatelessWidget {
  const OrderStatusSreps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.basic,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Timeline Event $index'),
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
