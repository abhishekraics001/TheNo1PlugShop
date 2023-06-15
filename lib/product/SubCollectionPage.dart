import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/product/ProductList.dart';

import '../cart/CartPage.dart';
import '../Utility/CustomeColors.dart';
import '../ItemsListPage.dart';

class SubCollectionPage extends StatefulWidget {
  //const SubCollectionPage({Key? key}) : super(key: key);
  final String colletionPageType;
  final String collectionID;
  final String collectionName;
  final String collectionIndex;

  const SubCollectionPage(this.colletionPageType, this.collectionID,
      this.collectionName, this.collectionIndex,
      {Key? key})
      : super(key: key);

  @override
  State<SubCollectionPage> createState() => _SubCollectionPageState();
}

class _SubCollectionPageState extends State<SubCollectionPage> {
  int pageIndex = 0;
  final cartController = Get.put(CartController());

  /*
  List<String> categoryList = [
    "Disposable",
    "E-Liquids",
    "Pod Kits",
    "Vape Kits",
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
    "cat_disposable_pods.png",
    "cat_eliquids.png",
    "cat_podkits.png",
    "cat_vape_kit.png",
    "cat_nic_salts.png",
    "cat_short_file.png",
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
  */

  /*List<String> subCollectionList = [
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

*/

/*
  List<String> subCollectionList = [
    "Geek Bar",
    "IVG Bar",
    "Juice Head",
    "Lost Temple",
    "Magic Bar",
    "Nasty Juice",
    "R And M",
    "Reymon",
    "SKE Crystal Bar",
    "SKE Crystal",
    "Super Stix Bar",
    "Ultim Te Bar",
    "Vape Bars",
    "Aroma King",
    "ELF Bar",
    "Elux",
    "Fantasi Bar",
    "Frunk Bar",
    "10ml e-liquids",
    "50ml e-liquids",
    "100ml e-liquids",
    "200ml e-liquids",
    "500ml e-liquids",
    "Nic Salts",
    "Nic Shots",
    "Batteries",
    "Chargers",
    "Cotton",
    "Drip Tips",
    "iPhone Chargers",
    "Micro USB Chargers",
    "Replacement Glass",
    "Type C Chargers",
    "Wires",
    "Aspire",
    "Eleaf",
    "Freemax",
    "Geek Vape",
    "Horizontech",
    "Innokin",
    "Lost Mary",
    "Lost Vape",
    "Obs",
    "Oxva",
    "Uwell",
    "Vaporesso",
    "Voopoo"
  ];
  List<String> subCollectionImageList = [
    "disposable_geek_bar.png",
    "disposable_ivg_bar.png",
    "disposable_juice_head.png",
    "disposable_lost_temple.png",
    "disposable_magic_bar.png",
    "disposable_nasty_juice.png",
    "disposable_r_and_m.png",
    "disposable_reymont.png",
    "disposable_ske_crystal_bar.png",
    "disposable_sky_crystal.png",
    "disposable_super_stix_bar.png",
    "disposable_ultim_te_bar.png",
    "disposable_vape_bars.png",
    "disposable_aroma_king.png",
    "disposable_elf_bar.png",
    "disposable_elux.png",
    "disposable_fantasi_bar.png",
    "disposable_frunk_bar.png",
    "10ml_e_liquids.png",
    "50ml_e_liquids.png",
    "100ml_e_liquids.png",
    "200ml_e_liquids.png",
    "500ml_e_liquids.png",
    "nic_salts.png",
    "nic_shots.png",
    "Batteries.png",
    "Chargers.png",
    "Cotton.png",
    "Drip_Tips.png",
    "iPhone_Chargers.png",
    "Micro_USB_Chargers.png",
    "Replacement_Glass.png",
    "Type_C_Chargers.png",
    "Wires.png",
    "aspire.png",
    "eleaf.png",
    "freemax.png",
    "geek_vape.png",
    "horizontech.png",
    "innokin.png",
    "lost_mary.png",
    "lost_vape.png",
    "obs.png",
    "oxva.png",
    "uwell.png",
    "vaporesso.png",
    "voopoo.png"
  ];
*/

  late String colletionPageType;
  late String collectionID;
  late String collectionNamex;
  late String collectionIndexX;
  late String collectionCodeTagX;
  late List<SubCollectionListItems> cSubCollectionListItems = [];
  var appBarTitleNavigation = "Home";
  @override
  void initState() {

    setState(() {
      int pageIndex = 0;
      if (widget.colletionPageType.endsWith('HomePageMainCollection') ||
          widget.colletionPageType.endsWith('HomePageLeftMenuCollection')) {
        pageIndex = int.parse(widget.collectionIndex);
      }
      collectionIndexX = '${pageIndex}';
      collectionNamex = '${widget.collectionName}';
      collectionCodeTagX = collectionListData[pageIndex].cCode;
      cSubCollectionListItems =
          collectionListData[pageIndex].cSubCollectionListItems;
      appBarTitleNavigation = "Home  |  $collectionNamex";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomeColors.lighGray3,
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
                  /*
                  Container(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: collectionListData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                              onTap: () {
                                setState(() {
                                  colletionPageType = 'SubPageMainCollection';
                                  collectionID =
                                      '${collectionListData[index].cId}';
                                  collectionIndexX = '${index}';
                                  collectionNamex =
                                      '${collectionListData[index].cTitle}';
                                  cSubCollectionListItems =
                                      collectionListData[index]
                                          .cSubCollectionListItems;
                                });
                                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>new ProductList()));
                              },
                              child: Container(
                                child: Column(children: [
                                  categorySlider(index),
                                ]),
                              ));
                        }),
                  ),
                */

                  Container(
                    margin:
                        EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 2),
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: collectionListData.length,
                      itemBuilder: (ctx, index) {
                        return new GestureDetector(
                          onTap: () {
                            setState(() {
                              colletionPageType = 'SubPageMainCollection';
                              collectionID = '${collectionListData[index].cId}';
                              collectionIndexX = '${index}';
                              collectionNamex =
                                  '${collectionListData[index].cTitle}';
                              cSubCollectionListItems =
                                  collectionListData[index]
                                      .cSubCollectionListItems;
                              collectionCodeTagX =
                                  '${collectionListData[index].cCode}';
                              appBarTitleNavigation = "Home  |  $collectionNamex";
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              height: 45,
                              child: Chip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 4,
                                backgroundColor: CustomeColors.kPrimaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                label: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: Text(
                                    "${collectionListData[index].cTitle}"
                                        .toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width *
                    0.98,
                ////height: 40,
                decoration:const BoxDecoration(color: CustomeColors.subNavigationBarColorCoder),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child:  Text('$appBarTitleNavigation',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: CustomeColors.bodyTextColor,
                        fontSize: 14,
                        wordSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      color: CustomeColors.bodyBgColor,
                      //margin: EdgeInsets.all(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Container(
                          padding: EdgeInsets.all(10),
                          //margin: EdgeInsets.all(2),
                          //color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                child: Text(
                                  '$collectionNamex'.toUpperCase(),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,

                                  style: TextStyle(
                                      color: CustomeColors.bodyTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: subCollectionBrandName(),
                              ),
                            ],
                          )),
                    ),
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
        fillColor: CustomeColors.searchBoxBgColors,
        filled: true,
      ),
    );
  }

  Widget categorySlider(int index) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(6),
        height: 140,
        width: 105,
        alignment: Alignment.bottomCenter,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: CustomeColors.iconColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                      image: AssetImage(
                          "assets/images/${collectionListData[index].cImageName}"),
                      fit: BoxFit.fill),
                ),
              ),
              Text(
                collectionListData[index].cTitle.toUpperCase(),
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
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(6),
        height: 90,
        //width: 105,
        // alignment: Alignment.bottomCenter,
        child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: CustomeColors.lighGray, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                      image: AssetImage(
                          "assets/images/${cSubCollectionListItems[index].scImageName}"),
                      fit: BoxFit.contain),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    cSubCollectionListItems[index].scTitle.toUpperCase(),
                    maxLines: 1,
                    style: TextStyle(
                        color: CustomeColors.bodyTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
            ]));
  }

  GridView subCollectionBrandName() {
    return GridView.builder(
      itemCount:
          cSubCollectionListItems.length, //subCollectionImageList.length,
      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ProductList(
                    'subCollectionItemsClick',
                    collectionIndexX,
                    '${index}',
                    collectionNamex,
                    cSubCollectionListItems[index].scTitle,
                    collectionCodeTagX,
                    cSubCollectionListItems[index].scCode,

                  cSubCollectionListItems[index].sProductType,
                  cSubCollectionListItems[index].sVandor,
                  cSubCollectionListItems[index].sTags,
                )));
          },
          child: Container(
            //color: Colors.black,
            child: Container(
              // height: MediaQuery.of(context).size.width * 0.32 + 220,
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border:
                          Border.all(color: CustomeColors.lighGray, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/${cSubCollectionListItems[index].scImageName}"),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Container(
                    //height: 25,
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      cSubCollectionListItems[index].scTitle.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                          color: CustomeColors.bodyTextColor,
                          fontSize: subColletionFontSize,
                          fontWeight: FontWeight.bold, ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 1),
      //3 / 1),
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  /* GridView trandingCollectionsGridView2() {
    return GridView.builder(
      itemCount: subCollectionImageList.length,
      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 5,
          color: CustomeColors.bodyBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            // height: MediaQuery.of(context).size.width * 0.32 + 220,
            child: Column(
              children: [
                Container(
                  //padding: EdgeInsets.all(5),
                  //margin: EdgeInsets.all(1),
                  width: MediaQuery.of(context).size.width * 0.31,
                  height: MediaQuery.of(context).size.width * 0.31 - 25,

                  decoration: BoxDecoration(
                    //color: Colors.orangeAccent,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${subCollectionImageList[index]}"),
                      fit: BoxFit.cover,

                      // alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Container(
                    //height: 25,
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      subCollectionList[index],
                      maxLines: 1,
                      style: TextStyle(
                          color: CustomeColors.bodyTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 1),
      //3 / 1),
      padding: EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  */

}
