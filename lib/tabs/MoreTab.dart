import 'package:flutter/material.dart';
//import 'package:flutter_simple_shopify/flutter_simple_shopify.dart';

import '../AboutUsPage.dart';
import '../home/HomePage.dart';
import '../cart/CartPage.dart';
import 'RewarsPage.dart';
import '../Page4.dart';
//import './MyOrderPage.dart';
import '../account/MyProfilePage.dart';
import '../MyAppNew.dart';
import '../createDrawerHeader.dart';
//import '../CustomTheme.dart';
import '../Utility/CustomeColors.dart';
import '../createDrawerBodyItem.dart';
import '../webview/WebPage.dart';
import '../myorder/OrderHistory.dart';
import '../address/MyAddressBook.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: buildListView(context),
        //child: Text("Page Number 3rd  Page", style: TextStyle(color: Colors.green[900], fontSize: 45, fontWeight: FontWeight.w500,),),
      ),
    );*/
    return new Scaffold(
        //appBar: AppBar(title: Text("Contacts"),),
        //drawer: navigationDrawer(),
        body: buildListView(
            context) //Center(child: Text("This is contacts page"))
        );
  }

  void GetChout() {
    // ShopifyCheckout shopifyCheckout = ShopifyCheckout.instance;
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        /*  createDrawerBodyItem(
          icon: Icons.home,
          text: 'Home',
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),*/
        createDrawerBodyItem(
          icon: Icons.account_circle,
          text: 'Profile',
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyProfilePage('FromMoreTabPage')),
            );
          },
        ),
        createDrawerBodyItem(
          icon: Icons.event_note,
          text: 'Order History',
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistory()),
            );
          },
        ),
        createDrawerBodyItem(
          icon: Icons.add_location_rounded,
          text: 'Manage Address',
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageAddressBook()),
            );
          },
        ),
        Divider(),
        ListTile(
          title: const Text('About Us'),
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AboutUsPage("AU", "About Us")),
            );
          },
        ),
        ListTile(
          title: const Text('Contact Us'),
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AboutUsPage("CS", "Contact Us")),
            );
          },
        ),
        ListTile(
          title: const Text('Term & Condition'),
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebPage("TC", "Term and Condition")),
            );
          },
        ),
        ListTile(
          title: const Text('Privacy Policy'),
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebPage("PP", "Privacy Policy")),
            );
          },
        ),
        ListTile(
          title: const Text('Refund Policy'),
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebPage("RF", "Refund Policy")),
            );
          },
        ),
        ListTile(
          title: const Text('Health Warning'),
          onTap: () {
            //Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebPage("HW", "Health Warning")));
          },
        ),
      ],
    );
  }
}
