import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';
import 'package:theplugshop/shopifypkg/ShopifyAPICall.dart';
import 'package:theplugshop/shopifypkg/models/src/shopify_user/address/address.dart';

import '../Utility/CustomeColors.dart';

class AddAddressView extends StatefulWidget {
  final String _appBarTitle;
  final Addresses _contact;

  const AddAddressView(this._contact, this._appBarTitle, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddAddressViewState(_contact, _appBarTitle);
  }
}

class AddAddressViewState extends State<AddAddressView> {
  bool valuefirst = false;
  final String _appBarTitle;
  Addresses address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // use controllers to bind fields to value passed in
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _cityName = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();

  var countyDropdownValue = "United Kingdom";
  var ProviDropdownValue = "British Forces";
  String firstName = "",
      lastName = "",
      compnayName = "",
      address1 = "",
      address2 = "",
      cityName = "",
      zipCode = "",
      phoeNo = "";

  AddAddressViewState(this.address, this._appBarTitle);

  @override
  void initState() {
    super.initState();

    if (_appBarTitle == "Edit Address") {
      _firstName.text = address.firstName ?? "";
      _lastName.text = address.lastName ?? "";
      _companyName.text = address.company ?? "";
      _address1.text = address.address1 ?? "";
      _address2.text = address.address2 ?? "";
      _cityName.text = address.city ?? "";
      _zipCode.text = address.zip ?? "";
      _phoneNo.text = address.phone ?? "";
      countyDropdownValue = address.countryName ?? "";
      ProviDropdownValue = address.province ?? "";
    }
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _companyName.dispose();
    _address1.dispose();
    _address2.dispose();
    _cityName.dispose();
    _zipCode.dispose();
    _phoneNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return WillPopScope(
      onWillPop: () async {
        // For when user presses Back navigation button in device navigationBar (Android)
        _returnToHomePage(false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          //iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            _appBarTitle,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _firstName,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        enabled: (_appBarTitle ==
                            'Add Address'), // name is the key. can't change it. must delete and re-create.

                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle!, "First Name", address.firstName ?? ""),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _lastName,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        enabled: (_appBarTitle ==
                            'Add Address'), // name is the key. can't change it. must delete and re-create.

                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "Last Name", address.lastName ?? ""),
                      ),
                    ),

                    // Email
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _companyName,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "Company", address.company ?? ""),
                      ),
                    ),
                    // Address
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _address1,
                        autocorrect: false,
                        //maxLines: 3,
                        textInputAction: TextInputAction.next,
                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "Address 1", address.address1 ?? ""),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _address2,
                        autocorrect: false,
                        //maxLines: 3,
                        textInputAction: TextInputAction.next,
                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "Address 2", address.address2 ?? ""),
                      ),
                    ),

                    // Notes
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _cityName,
                        autocorrect: false,
                        //maxLines: 3,
                        textInputAction: TextInputAction.next,
                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "City", address.city ?? ""),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Country',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        child: ButtonTheme(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          child: DropdownButton<String>(
                            hint: const Text("Country"),
                            isExpanded: true,
                            value: countyDropdownValue,
                            elevation: 16,
                            dropdownColor: Colors.white,
                            underline: DropdownButtonHideUnderline(
                              child: Container(),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                countyDropdownValue = newValue!;
                              });
                            },
                            items: <String>['United Kingdom']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Province',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        child: ButtonTheme(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          child: DropdownButton<String>(
                            hint: const Text("Province"),
                            isExpanded: true,
                            value: ProviDropdownValue,
                            elevation: 16,
                            dropdownColor: Colors.white,
                            underline: DropdownButtonHideUnderline(
                              child: Container(),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                ProviDropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'British Forces',
                              'England',
                              'Northern Ireland',
                              'Scotland',
                              'Wales'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _zipCode,
                        autocorrect: false,
                        //maxLines: 3,
                        textInputAction: TextInputAction.next,
                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "Postal/Zip Code", address.zip ?? ""),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _phoneNo,
                        autocorrect: false,
                        //maxLines: 3,
                        textInputAction: TextInputAction.next,
                        style: textStyle,
                        decoration: _inputDecoration(
                            textStyle, "Phone", address.phone ?? ""),
                      ),
                    ),

                    Padding(
                      padding:
                          EdgeInsets.only(bottom: 15.0, left: 6.0, right: 6.0),
                      /* child: InkWell(
                          onTap: () {
                            setState(() {
                              print('checkBoxValue: $checkBoxValue');
                              checkBoxValue = !checkBoxValue;
                            });
                          }, */
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              checkColor: CustomeColors.blackColor,
                              activeColor: CustomeColors.kPrimaryColor,
                              value: valuefirst,
                              onChanged: (bool? value) {
                                setState(() {
                                  //isChecked = !isChecked;
                                  if (valuefirst) {
                                    valuefirst = false;
                                  } else {
                                    valuefirst = true;
                                  }
                                  log('isChecked : $valuefirst');
                                });
                                /* value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                                log('isChecked : $isChecked');
                              });
                            }, */
                              }),
                          Text(
                            ' Set as default address',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ], //<Widget>[]
                      ),
                    ),
                    //),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, bottom: 40),
                      child: _buildLoginButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
              backgroundColor:
                  MaterialStateProperty.all(CustomeColors.blackColor),
            ),
            /* elevation: 5.0,
            color: CustomeColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ), */
            onPressed: () {
              //loginAPICall();
              _saveorUpdateContact();
            },
            child: Text(
              "Add Address",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  InputDecoration _inputDecoration(
      TextStyle textStyle, String hintText, String text) {
    return InputDecoration(
        labelText: hintText,
        labelStyle: textStyle,
        hintText: hintText,
        errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)));
  }

  Future<void> addAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userIDVal = (prefs.getString(userID) ?? "")
        .replaceAll("gid://shopify/Customer/", "");
    userAccessTockenVal = prefs.getString(userAccessTocken) ?? "";

    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    var responseData = await addUserAddress(
            address1,
            address2,
            compnayName,
            cityName,
            countyDropdownValue,
            firstName,
            lastName,
            phoeNo,
            ProviDropdownValue,
            zipCode,
            userAccessTockenVal)
        .then((value) => {
              print('getProfile PPPP Email: ${value}'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                Address? customerDetails = value;
                OverlayLoadingProgress.stop();
                _returnToHomePage(true);
              }),
            })
        .catchError((error) => {
              // ignore: avoid_print
              OverlayLoadingProgress.stop(),
              print('Login Error Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
            });
  }

  Future<void> updateAddAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userIDVal = (prefs.getString(userID) ?? "")
        .replaceAll("gid://shopify/Customer/", "");
    userAccessTockenVal = prefs.getString(userAccessTocken) ?? "";

    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    var responseData = await updateAddUserAddress(
            address1,
            address2,
            compnayName,
            cityName,
            countyDropdownValue,
            firstName,
            lastName,
            phoeNo,
            ProviDropdownValue,
            zipCode,
            userAccessTockenVal,
            address.id.toString())
        .then((value) => {
              print('getProfile PPPP Email: ${value}'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                String? customerDetails = value;
                OverlayLoadingProgress.stop();
                _returnToHomePage(true);
              }),
            })
        .catchError((error) => {
              // ignore: avoid_print
              OverlayLoadingProgress.stop(),
              print('Login Error Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
            });
  }

  void _saveorUpdateContact() async {
    firstName = _firstName.text ?? "";
    lastName = _lastName.text ?? "";
    compnayName = _companyName.text ?? "";
    address1 = _address1.text ?? "";
    address2 = _address2.text ?? "";
    cityName = _cityName.text ?? "";
    zipCode = _zipCode.text ?? "";
    phoeNo = _phoneNo.text ?? "";

    if (firstName.isEmpty) {
      ShowTostMsg(ValidFirstName);
      return;
    } else if (lastName.isEmpty) {
      ShowTostMsg(ValidLastName);
      return;
    } else if (compnayName.isEmpty) {
      ShowTostMsg(validCompanyName);
      return;
    } else if (address1.isEmpty) {
      ShowTostMsg(validAdd1);
      return;
    } else if (address2.isEmpty) {
      ShowTostMsg(validAdd2);
      return;
    } else if (cityName.isEmpty) {
      ShowTostMsg(validCity);
      return;
    } else if (zipCode.isEmpty) {
      ShowTostMsg(validZip);
      return;
    } else if (phoeNo.isEmpty) {
      ShowTostMsg(validPhoneNo);
      return;
    } else {
      if (_appBarTitle != "Add Address") {
        try {
          //await _model.updateContact(_contact);
          //_returnToHomePage(true);
          updateAddAddress();
        } catch (e) {
          print(e);
          showAlertDialog(context, 'Status', 'Error updating contact.');
        }
      } else {
        try {
          //await _model.insertContact(_contact);
          //_returnToHomePage(true);
          addAddress();
        } catch (e) {
          print(e);
          showAlertDialog(context, 'Status', 'Error adding contact.');
        }
      }
    }
  }

  void _returnToHomePage(bool refreshListDisplay) {
    Navigator.of(context).pop(refreshListDisplay);
  }
}

void showAlertDialog(BuildContext context, String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(context: context, builder: (_) => alertDialog);
}
