import 'package:flutter/material.dart';
import 'cart/CartPage.dart';
import 'Utility/CustomeColors.dart';

class ItemsListPage extends StatefulWidget {
  const ItemsListPage({Key? key}) : super(key: key);

  @override
  State<ItemsListPage> createState() => _ItemsListPageState();
}

class _ItemsListPageState extends State<ItemsListPage> {
  int pageIndex = 0;
  List<String> categoryList = [
    "E-Liquids",
    "Disposable",
    "Vape Kits",
    "Pod Kits",
    "Coils",
    "Pods",
    "Tanks",
    "Mods",
    "Accessories",
    "Other Products",
    "Wholesale",
    "Suggest A Product"
  ];
  List<String> categoryListImage = [
    "cat_icon_white_bg_96.png",
    "cat_icon_disposable.png",
    "cat_icon_wap_kit.png",
    "cat_icon_pod_kit.png",
    "cat_icon_coils.png",
    "cat_icon_pods.png",
    "cat_icon_tanks.png",
    "cat_icon_mod.png",
    "cat_icon_battery.png",
    "cat_icon_battery.png",
    "cat_icon_battery.png",
    "cat_icon_battery.png"
  ];

  List<String> subCollectionList = [
    "NIC SALTS",
    "NICOTINE SHOT",
    "10ML E-LIQUIDS",
    "REPLACEMENT COILS",
    "Coils",
  ];

  List<String> subCollectionImageList = [
    "amazon_1.png",
    "amazon_2.png",
    "amazon_3.png",
    "amazon_4.png",
    "amazon_2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                  decoration:
                      new BoxDecoration(color: CustomeColors.kPrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(5), child: searchBox())),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new ItemsListPage()));
                              },
                              child: Container(
                                child: Column(children: [
                                  categorySlider(index),
                                ]),
                              ));
                        }),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: 1500,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: subCollectionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ItemsListPage()));
                              },
                              child: Container(
                                child: Column(children: [
                                  subItemsList(index),
                                ]),
                              ));
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
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
                        builder: (BuildContext context) => new CartPage()));
                    //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePageTest()));
                  },
                  child: new Stack(
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart_outlined,
                          color: CustomeColors.iconColor,
                        ),
                        onPressed: null,
                      ),
                      pageIndex == 0
                          ? new Container()
                          : new Positioned(
                              child: new Align(
                                  alignment: Alignment.topRight,
                                  child: new Stack(
                                    children: <Widget>[
                                      new Icon(Icons.brightness_1,
                                          size: 20.0,
                                          color:
                                              CustomeColors.cartTrolyBgColors),
                                      new Positioned(
                                          top: 3.0,
                                          right: 4.0,
                                          child: new Center(
                                            child: new Text(
                                              pageIndex.toString(),
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
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

  TextField searchBox() {
    return TextField(
      onChanged: (value) {
        print("search onChanged: $value");
      },
      onSubmitted: (value) {
        print("search onSubmitted:  $value");
      },
      style: TextStyle(fontSize: 16, color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
        prefixIcon: Icon(Icons.search, color: Colors.white),
        border: new OutlineInputBorder(
            borderSide:
                new BorderSide(width: 3, color: CustomeColors.kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        fillColor: Colors.black,
        filled: true,
      ),
    );
  }

  Widget categorySlider(int index) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(6),
        height: 110,
        width: 80,
        alignment: Alignment.bottomCenter,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: CustomeColors.iconColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                      image: AssetImage(
                          "assets/images/${categoryListImage[index]}"),
                      fit: BoxFit.fill),
                ),
              ),
              Text(
                categoryList[index],
                maxLines: 1,
                style: TextStyle(
                    color: CustomeColors.bodyTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ]));
  }

  BoxDecoration myBoxBorderDecoration() {
    return BoxDecoration(
      color: CustomeColors.bodyBgColor,
      border: Border.all(
        color: CustomeColors.kPrimaryColor,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Widget subItemsList(int index) {
    return Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2),
        height: 70,
        //width: 105,
        // alignment: Alignment.bottomCenter,
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: CustomeColors.lighGray, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                      image: AssetImage(
                          "assets/images/${subCollectionImageList[index]}"),
                      fit: BoxFit.contain),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 1),
                  child: Text(
                    subCollectionList[index],
                    maxLines: 1,
                    style: TextStyle(
                        color: CustomeColors.bodyTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ))
            ]));
  }
}
