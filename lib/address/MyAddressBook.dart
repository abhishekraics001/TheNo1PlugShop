import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';
import 'package:theplugshop/login/Login.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import 'package:theplugshop/shopifypkg/ShopifyAPICall.dart';

import 'AddressModel.dart';
import 'AddAddressView.dart';
import '../Utility/CustomeColors.dart';

class ManageAddressBook extends StatefulWidget {
  const ManageAddressBook({Key? key}) : super(key: key);

  @override
  State<ManageAddressBook> createState() => _ManageAddressBookState();
}

class _ManageAddressBookState extends State<ManageAddressBook> {
  // Model _model = Model();
  //late List<AddressModel> _contactList;
  //late List<String> _contactList;
  //int _numberOfContacts = 10;

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

  late List<Addresses> addressList = [];
  Future<void> getProfile() async {
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    var responseData = await getProfileDetails(userIDVal)
        .then((value) => {
              print('getProfile PPPP Email: ${value}'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                try {
                  Customer? customerDetails = value;
                  addressList = (customerDetails?.addresses)!;
                  for (Addresses address in addressList!) {
                    if (address.defaultAddress!) {}
                  }
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
    // AddressModel ct1 = AddressModel('Abhishek', 'NSEZ', '9988776655', '0124665',  'abx@gmail.com', 'Default');

    /*setState(() {
      while (_numberOfContacts < 10) {
        _contactList.add(ct1);
        _numberOfContacts = _numberOfContacts + 1;
      }
    });*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Address Book'),
      ),
      body: loadUIView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDetailPage(Addresses(), 'Add Address');
        },
        tooltip: 'Add Address',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget loadUIView(BuildContext context) {
    if (isLoginOrNot) {
      return SafeArea(
        child: _getContactsListView(),
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

  ListView _getContactsListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: addressList?.length ?? 0,
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
          margin: EdgeInsets.only(left: 2, right: 2),
          // color: CustomeColors.bodyBgColor,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
                //padding: EdgeInsets.all(5),
                //alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        isDefaultAddress(index),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                            color: CustomeColors.blackColor),
                      ),
                    ),
                    AddressUiView(addressList[index].company ?? ""),
                    AddressUiView(
                        "${addressList[index].address1 ?? ""}, ${addressList[index].address2 ?? ""} "),
                    AddressUiView(
                        "${addressList[index].city ?? ""}, ${addressList[index].province ?? ""} "),
                    AddressUiView(
                        "${addressList[index].country ?? ""}, ${addressList[index].provinceCode ?? ""}, ${addressList[index].zip ?? ""}"),
                    AddressUiView(addressList[index].phone ?? ""),
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
                            color: Colors.green,
                          ),
                          onTap: () {
                            _showDetailPage(addressList[index], 'Edit Address');
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
                            _deleteContact(
                                context, addressList[index].id.toString());
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

  String isDefaultAddress(int index) {
    if (addressList[index].defaultAddress == true) {
      return "${addressList[index].firstName} ${addressList[index].lastName} (Default)";
    } else {
      return "${addressList[index].firstName} ${addressList[index].lastName}";
    }
  }

  void _deleteContact(BuildContext context, String addressID) async {
    updateAddAddress(addressID);
    // _showSnackBar(context, "Contact was deleted.");
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    //Scaffold.of(context).showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showDetailPage(Addresses contact, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddAddressView(contact, title);
    }));

    if (result == true) {
      //_updateListView();
    }
  }

  void _updateListView() {
    showAlertDialog(context, "Database error", ' e.toString()');
  }

  Future<void> updateAddAddress(addressID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userIDVal = (prefs.getString(userID) ?? "")
        .replaceAll("gid://shopify/Customer/", "");
    userAccessTockenVal = prefs.getString(userAccessTocken) ?? "";

    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    var responseData =
        await deleteAddUserAddress(userAccessTockenVal, addressID)
            .then((value) => {
                  print('getProfile PPPP Email: ${value}'),
                  ShowTostMsg(SuccessMsg),
                  setState(() {
                    String? customerDetails = value;
                    OverlayLoadingProgress.stop();
                    //_returnToHomePage(true);
                  }),
                })
            .catchError((error) => {
                  // ignore: avoid_print
                  OverlayLoadingProgress.stop(),
                  print('Login Error Exceptions 1: $error'),
                  ShowTostMsg(SomeThingWentWrong),
                });
  }
}
