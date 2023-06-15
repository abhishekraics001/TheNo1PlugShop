// @dart=2.9

import 'package:flutter/material.dart';
import 'package:theplugshop/home/HomePage.dart';
import 'package:theplugshop/shopifypkg/flutter_simple_shopify.dart';


import 'Utility/CustomTheme.dart';
import 'splash/SplashScreen.dart';

void main() {
  ShopifyConfig.setConfig(
      '18b08ca37dc1de9fe56a50d734b0b56e', // Storefront API access token.
      'theno1plugshop.myshopify.com', // Store url.
      '2022-10' // The Shopify Storefront API version.
      );

  /* ShopifyConfig.setConfig('9a6f9561ad910bd37b7ec9df8dbaa866',
      'cleansimpleeats.myshopify.com', '2020-10');*/
   runApp(const MyApp());

  // runApp(DropDownListExample());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: CustomTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
     // home: DropDownListExample(),
    );
  }
}
