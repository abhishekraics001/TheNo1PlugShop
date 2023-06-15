import 'package:flutter/material.dart';
import './pageRoutes.dart';
import './ContactUsPage.dart';
import './AboutUsPage.dart';


//void main() => runApp(new MyAppNew());

class MyAppNew extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactUsPage(),
      routes:  {
        pageRoutes.contact: (context) => ContactUsPage(),
        //pageRoutes.about: (context) => AboutUsPage('',''),
        //pageRoutes.event: (context) => eventPage(),
        //pageRoutes.profile: (context) => profilePage(),
        //pageRoutes.notification: (context) => notificationPage(),
      },
    );
  }
}