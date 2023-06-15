import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../home/HomePage.dart';
import '../cart/CartPage.dart';
import 'RewarsPage.dart';
//import './MyOrderPage.dart';
import '../account/MyProfilePage.dart';
import '../createDrawerHeader.dart';
import '../Utility/CustomeColors.dart';
import '../createDrawerBodyItem.dart';
import 'MoreTab.dart';
import '../myorder/MyOrderPage.dart';
import '../product/SubCollectionPage.dart';
import '../Utility/UtilityClass.dart';

import 'package:theplugshop/shopifypkg/models/src/product/product.dart';

import 'WishList.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final cartController = Get.put(CartController());
  //final CartController cartController = Get.find();
  int activePageIndex = 0;

  var pages = [
    const HomePage(),
    const WishList(),
    const MyProfilePage("FromDashBoardPage"),
    const RewarsPage(),
    const MoreTab(),
  ];

  List<Product>? products = [];
  bool _isLoading = true;

  @override
  void initState() {
    //_fetchProducts();
    //_fetchProducts2();

    //Future<Album> futureAlbu = fetchAlbum();
    //Future<void> futureAlbu2 = fetchAlbum2();

    //Future<void> fProducts = fetchProducts2();
    //Future<void> fProducts2 = fetchProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: pages[activePageIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: Drawer(
        width: 250,
        child: leftDrawarMenuCategoryItems(context), //buildListView(context),
      ),
    );
  }



  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        backgroundColor: CustomeColors.kPrimaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/plug_copy_new.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            //Container(padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
                margin: EdgeInsetsDirectional.only(end: 0),
                height: 150.0,
                width: 40.0,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => const CartPage()));
                    //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePageTest()));
                  },
                  child: new Stack(
                    children: <Widget>[
                      const IconButton(
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: CustomeColors.iconColor,
                        ),
                        onPressed: null,
                      ),
                      /*activePageIndex == 0
                          ? new Container()
                          : */new Positioned(
                              child: new Align(
                                  alignment: Alignment.topRight,
                                  child: new Stack(
                                    children: <Widget>[
                                      const Icon(Icons.brightness_1,
                                          size: 20.0,
                                          color:
                                              CustomeColors.cartTrolyBgColors),
                                      new Positioned(
                                          top: 3.0,
                                          right: 4.0,
                                          child: new Center(
                                            child: Obx(() =>  new Text(
                                              cartController.cartProductListGlobal.length.toString() ?? '',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w500),
                                            ),),
                                          )),
                                    ],
                                  )),
                            ),
                    ],
                  ),
                )),
          )
        ]);
  }

  ListView leftDrawarMenuCategoryItems(BuildContext context) {
    //return ListView.builder(
    return ListView.separated(
      itemCount: collectionListData.length,
      separatorBuilder: (context, int) {
        return Divider(
          color: Colors.black,
          height: 0.2,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubCollectionPage(
                        'HomePageLeftMenuCollection',
                        '${collectionListData[index].cId}',
                        '${collectionListData[index].cTitle}',
                        '${index}')),
              );
            },
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                //border: Border.all(color: CustomeColors.iconColor, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,

                    offset: Offset(2, 6), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                    //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                    image: AssetImage(
                        "assets/images/${collectionListData[index].cLeftMenuImageName}"),
                    fit: BoxFit.fill),
              ),
            ),
            title: Text(
              '${collectionListData[index].cTitle}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        createDrawerHeader(),
        createDrawerBodyItem(
          icon: Icons.home,
          text: 'Home',
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        createDrawerBodyItem(
          icon: Icons.account_circle,
          text: 'Profile',
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        createDrawerBodyItem(
          icon: Icons.event_note,
          text: 'Order History',
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        createDrawerBodyItem(
          icon: Icons.add_location_rounded,
          text: 'Manage Address',
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        Divider(),
        ListTile(
          title: const Text('About Us'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('My Account'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyProfilePage('FromDashBoardPage')),
            );
          },
        ),
        ListTile(
          title: const Text('Term & Condition'),
          onTap: () {
              //Navigator.of(context).pop(); Navigator.push( context,MaterialPageRoute(builder: (context) => MyOrderPage()),);
          },
        ),
        ListTile(
          title: const Text('Privacy Policy'),
          onTap: () {
            Navigator.of(context).pop();
            //Navigator.push( context, MaterialPageRoute(builder: (context) => MyOrderPage()), );
          },
        ),
        ListTile(
          title: const Text('Refund Policy'),
          onTap: () {
            Navigator.of(context).pop();
            //Navigator.push( context,  MaterialPageRoute(builder: (context) => MyOrderPage()), );
          },
        ),
        ListTile(
          title: const Text('Health Warning'),
          onTap: () {
            Navigator.of(context).pop();
           // Navigator.push( context,  MaterialPageRoute(builder: (context) => MyOrderPage()),  );
          },
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: activePageIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      selectedLabelStyle: TextStyle(fontSize: 14),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      onTap: (value) {
        // Respond to item press.
        setState(() => activePageIndex = value);
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home', //text: 'Home',
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
          label: 'Wishlist',
          icon: Icon(Icons.favorite_border_outlined),
          activeIcon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: Icon(Icons.account_circle),
          activeIcon: Icon(Icons.info),
        ),
        BottomNavigationBarItem(
          label: 'Rewars',
          icon: Icon(Icons.star_border_outlined),
          activeIcon: Icon(Icons.star_rate_sharp),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.more_horiz_outlined),
          activeIcon: Icon(Icons.more),
        ),
      ],
    );
  }
}
