import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:theplugshop/ProductListData/ProductsListData.dart';
import 'package:theplugshop/ProductListData/Variants.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/cart/CartPage.dart';
import 'package:theplugshop/product/ProductItemsDetails.dart';

import '../Utility/CustomeColors.dart';
import '../retrofit/httpRequest.dart';

class ProductList extends StatefulWidget {
  final String isFromEvent;
  final String mainCollectionItemClickIndex;
  final String subCollectionItemClickIndex;

  final String mainCollectionOrCategoryName;
  final String subCollectionOrSubCategoryName;

  final String collectionCodeTagX;
  final String subCollectionCodeTagX;

  final String strProductType;
  final String strProductVandorBrand;
  final String strProductTag;

  const ProductList(
      this.isFromEvent,
      this.mainCollectionItemClickIndex,
      this.subCollectionItemClickIndex,
      this.mainCollectionOrCategoryName,
      this.subCollectionOrSubCategoryName,
      this.collectionCodeTagX,
      this.subCollectionCodeTagX,

      this.strProductType,
      this.strProductVandorBrand,
      this.strProductTag,
      {Key? key})
      : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isCustomization = true;
  bool isClikOnAddToCartButton = false;
  int isClikOnAddToCartButtonIndex = -1;
  List<ProductsListData> productListDataActual = [];
  List<ProductsListData> productListData = [];
  final cartController = Get.put(CartController());

  var appBarTitle = "Product Details";
  var appBarTitleNavigation = "Home";
  @override
  void initState() {
    if (widget.isFromEvent.endsWith('homePageTrendingProduct')) {
      appBarTitle = "Trending Products";
      appBarTitleNavigation = appBarTitleNavigation + " | Trending Product";
    } else if (widget.isFromEvent.endsWith('homePageBestCollections')) {
      // appBarTitle = "Best Collections | ${widget.subCollectionItemClickIndex}";
      appBarTitle = "${widget.subCollectionItemClickIndex}";
      appBarTitleNavigation = appBarTitleNavigation +
          "  |  Best Collections  |  ${widget.subCollectionItemClickIndex}";
    } else {
      appBarTitle =
          "Product List"; //"${widget.mainCollectionOrCategoryName} | ${widget.subCollectionOrSubCategoryName}";
      appBarTitleNavigation = appBarTitleNavigation +
          "  |  ${widget.mainCollectionOrCategoryName}  |  ${widget.subCollectionOrSubCategoryName}";
    }

    isCustomization = true;
    isClikOnAddToCartButton = false;
    isClikOnAddToCartButtonIndex = -1;
    getProductListData();

    super.initState();
  }

  void filterSearchResults(String query) {
    print(
        'filterSearchResults 00 : $query   productListDataActual size ${productListDataActual.length}');

    List<ProductsListData> dummySearchListTemp =
        List<ProductsListData>.from(productListDataActual);

    List<ProductsListData> dummySearchList = [];
    dummySearchListTemp.forEach((element) {
      dummySearchList.add(element);
    });

    print(
        'filterSearchResults: 11  ${dummySearchList.length}   productListDataActual size ${productListDataActual.length}');

    if (query.isNotEmpty) {
      List<ProductsListData> dummyListData = <ProductsListData>[];
      for (var item in dummySearchList) {
        if (item.title!.contains(query) ||
            item.handle!.contains(query) ||
            item.vendor!.contains(query) ||
            item.tags!.contains(query)) {
          dummyListData.add(item);
        }
      }
      setState(() {
        productListData.clear();
        productListData.addAll(dummyListData);
        print(
            'filterSearchResults: 22  $query  productListData size: ${productListData.length}   productListDataActual product size: ${productListDataActual.length}');
      });
      //return;
    } else {
      setState(() {
        productListData.clear();
        final List<ProductsListData> dummySearchList = [
          ...productListDataActual
        ];
        productListData.addAll(dummySearchList);
        print(
            'filterSearchResults: 33  $query  productListData size: ${productListData.length}  productListDataActual product size: ${productListDataActual.length}');
      });
    }

    //List<ProductsListData> productListDataActualTemp =  List<ProductsListData>.from(productListDataActual);

    /*
    print(
        'filterSearchResults 00 : $query  productListData size ${productListData.length}  productListDataActual size ${productListDataActual.length}');
    productListData.clear();
    if (query.isEmpty) {
      setState(() {
        productListData.clear();
      });
      return;
    }

    print(
        'filterSearchResults 11 : $query   productListData size ${productListData.length}    productListDataActual size ${productListDataActual.length}');
    setState(() {
    for (var userDetail in productListDataActualTemp) {
      if (userDetail.title!.contains(query) || userDetail.vendor!.contains(query))
        productListData.add(userDetail);
    }
    });
    */

    print(
        'filterSearchResults 22 : $query    productListData size ${productListData.length}    productListDataActual size ${productListDataActual.length}');
  }

  Future<void> getProductListData() async {
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    print(
        'CategoryName: ${widget.mainCollectionOrCategoryName}  subCategoryName: ${widget.subCollectionOrSubCategoryName}');

    if (widget.isFromEvent.endsWith('homePageTrendingProduct')) {
      var respd = await getTrendingProductList('50')
          .then((value) => {
                print('Lentxxx PPPP Email: ${value?.length}'),
                //ShowTostMsg(SuccessMsg),
                setState(() {
                  productListData = value!.cast<ProductsListData>();
                  productListDataActual = value!.cast<ProductsListData>();
                  OverlayLoadingProgress.stop();
                }),
              })
          .catchError((error) => {
                // ignore: avoid_print
                OverlayLoadingProgress.stop(),
                print('Login Error Exceptions 1: $error'),
                ShowTostMsg(SomeThingWentWrong),
              });
    }else if (widget.isFromEvent.endsWith('homePageBestCollections')) {
      var respd = await getProductListItems(
          '${widget.strProductType}',
          '${widget.strProductVandorBrand}',
          '${widget.strProductTag}')
          .then((value) => {
        print('Lentxxx PPPP Email: ${value?.length}'),
        //ShowTostMsg(SuccessMsg),
        setState(() {
          productListData = value!.cast<ProductsListData>();
          productListDataActual = value!.cast<ProductsListData>();
          OverlayLoadingProgress.stop();
        }),
      })
          .catchError((error) => {
        // ignore: avoid_print
        OverlayLoadingProgress.stop(),
        print('Login Error Exceptions 1: $error'),
        ShowTostMsg(SomeThingWentWrong),
      });
    } else {
      var responseData = await getProductListItems(
              '${widget.strProductType}',
              '${widget.strProductVandorBrand}',
              '${widget.strProductTag}')
          .then((value) => {
                print('Lentxxx PPPP Email: ${value?.length}'),
                // ShowTostMsg(SuccessMsg),
                setState(() {
                  productListData = value!.cast<ProductsListData>();
                  productListDataActual = value!.cast<ProductsListData>();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle), actions: <Widget>[
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
                          : */
                    new Positioned(
                      child: new Align(
                          alignment: Alignment.topRight,
                          child: new Stack(
                            children: <Widget>[
                              const Icon(Icons.brightness_1,
                                  size: 20.0,
                                  color: CustomeColors.cartTrolyBgColors),
                              new Positioned(
                                  top: 3.0,
                                  right: 4.0,
                                  child: new Center(
                                    child: Obx(
                                      () => new Text(
                                        cartController
                                                .cartProductListGlobal.length
                                                .toString() ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              )),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
                height: 60,
                decoration:
                    const BoxDecoration(color: CustomeColors.kPrimaryColor),
                child: Padding(
                    padding: const EdgeInsets.all(5), child: searchBox())),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.98,
              ////height: 40,
              decoration: const BoxDecoration(
                  color: CustomeColors.subNavigationBarColorCoder),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$appBarTitleNavigation',
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
            child: trandingCollectionsGridView(),
          ),
        ]),
      ),
    );
  }

  TextField searchBox() {
    return TextField(
      onChanged: (value) {
        print("search onChanged: $value");
        filterSearchResults(value);
      },
      onSubmitted: (value) {
        print("search onSubmitted:  $value");
        filterSearchResults(value);
      },
      style: const TextStyle(fontSize: 16, color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        hintText: "Search",
        hintStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 3, color: CustomeColors.kPrimaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        fillColor: CustomeColors.searchBoxBgColors,
        filled: true,
      ),
    );
  }

  GridView trandingCollectionsGridView() {
    return GridView.builder(
      itemCount:
          productListData.length, //6, //trandingCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, final int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProductItemsDetails(
                      "ProductList",
                      productListData[index],
                      widget.mainCollectionOrCategoryName,
                      widget.subCollectionOrSubCategoryName,
                      widget.mainCollectionItemClickIndex,
                      widget.subCollectionItemClickIndex,
                      "$appBarTitleNavigation  |  ${productListData[index].title}")));
            },
            child: SizedBox(
              height: 200,
              child: Card(
                color: CustomeColors.bodyBgColor,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.width *
                                  0.48, //120,
                              width: MediaQuery.of(context).size.width *
                                  0.48, //120,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        //image: AssetImage( "assets/images/cat_icon_white_bg_200.png"),
                                        image: NetworkImage(
                                            '${productListData[index].image!.src}'),
                                        fit: BoxFit.fill,
                                        alignment: Alignment.topCenter,
                                        opacity: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              //height: 120,
                              //width: 140,
                              child: Stack(children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: const EdgeInsets.only(
                                      bottom: 2, top: 4, right: 0, left: 0),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${productListData[index].vendor}',

                                          style: const TextStyle(
                                              //fontWeight: FontWeight.w200,
                                              fontSize:
                                                  productListVandorNameFontSize,
                                              color: CustomeColors
                                                  .productListVandorNameColorCode //Color.fromARGB(  255, 243, 219, 7),
                                              ),
                                          textAlign: TextAlign.center,

                                          //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${productListData[index].title}',
                                          style: const TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              color: CustomeColors
                                                  .productListProductNameColorCode,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  productListProductNameFontSize,
                                              fontStyle: FontStyle.normal),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.48,
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              getComparePrice(
                                                  productListData[index]
                                                      .variants![0]),
                                              Text(
                                                '  \ $paymentCurrency${productListData[index].variants![0].price}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      productListAtualPriceFontSize,
                                                  color: CustomeColors
                                                      .productListActualPriceColorCode,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                //margin:  EdgeInsets.only(
                                                // right: 1, left: 1, top: 8),
                                                padding: EdgeInsets.only(
                                                    left: 0, right: 0),
                                                width: 60,
                                                height: 35,
                                                child: SizedBox(
                                                  height: 35,
                                                  width:
                                                      35, //MediaQuery.of(context) .size.width * 0.29,
                                                  /* child:  IconButton(
                                               icon: const Icon(Icons.add_shopping_cart),
                                               tooltip: 'Increase volume by 10',
                                               onPressed: () {
                                                 setState(() {
                                                   //_volume += 10;
                                                 });
                                               },
                                             ), */

                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        showModal(
                                                            context,
                                                            productListData[
                                                                    index]
                                                                .variants!,
                                                            productListData[
                                                                index]);

                                                        if (isCustomization) {
                                                          if (isClikOnAddToCartButtonIndex ==
                                                              index) {
                                                            isClikOnAddToCartButtonIndex =
                                                                index;
                                                            isClikOnAddToCartButton =
                                                                true;
                                                          } else {
                                                            isClikOnAddToCartButtonIndex =
                                                                index;
                                                            isClikOnAddToCartButton =
                                                                true;
                                                          }
                                                        } else {
                                                          isClikOnAddToCartButtonIndex =
                                                              index;
                                                          isClikOnAddToCartButton =
                                                              true;
                                                        }
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(40, 35),
                                                      maximumSize:
                                                          const Size(40, 35),
                                                      backgroundColor:
                                                          (isClikOnAddToCartButton &&
                                                                  isClikOnAddToCartButtonIndex ==
                                                                      index)
                                                              ? CustomeColors
                                                                  .blackColor2
                                                              : CustomeColors
                                                                  .blackColor2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        side: const BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                    ),
                                                    /*   child: Icon(
                                                      Icons.add_shopping_cart,
                                                      size: 25,
                                                      color: CustomeColors
                                                          .WhiteColoe,
                                                    ), */

                                                    child: Text("Add",
                                                        style: TextStyle(
                                                            //color: Colors.black,
                                                            color: (isClikOnAddToCartButton &&
                                                                    isClikOnAddToCartButtonIndex ==
                                                                        index)
                                                                ? Colors.white
                                                                : Colors.white,
                                                            fontSize: 12)
                                                        //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                                        ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

/*
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right: 1, left: 1, top: 8),
                                        child: SizedBox(
                                          height: 35,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                showModal(
                                                    context,
                                                    trendingProductList[index]
                                                        .variants!,
                                                    trendingProductList[index]);

                                                if (isCustomization) {
                                                  if (isClikOnAddToCartButtonIndex ==
                                                      index) {
                                                    isClikOnAddToCartButtonIndex =
                                                        index;
                                                    isClikOnAddToCartButton =
                                                        true;
                                                  } else {
                                                    isClikOnAddToCartButtonIndex =
                                                        index;
                                                    isClikOnAddToCartButton =
                                                        true;
                                                  }
                                                } else {
                                                  isClikOnAddToCartButtonIndex =
                                                      index;
                                                  isClikOnAddToCartButton =
                                                      true;
                                                }
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              //backgroundColor: Colors.white,
                                              minimumSize: const Size(140, 40),
                                              backgroundColor:
                                                  (isClikOnAddToCartButton &&
                                                          isClikOnAddToCartButtonIndex ==
                                                              index)
                                                      ? Colors.black
                                                      : Colors.white,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: const BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            child: Text("ADD TO CART",
                                                style: TextStyle(
                                                    //color: Colors.black,
                                                    color: (isClikOnAddToCartButton &&
                                                            isClikOnAddToCartButtonIndex ==
                                                                index)
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12)
                                                //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                                ),
                                          ),
                                        ),
                                      ),
*/
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 0.64 / 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  int selectedOptionIndex = -1;

  void showModal(
      context, List<Variants>? variants, ProductsListData currentProduct) {
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
                    height: 50,
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
                              'Options',
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
                  Expanded(
                    //height: 500,
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(2),
                      child: ListView.separated(
                          itemCount: variants!.length, //.length,
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
                                    /* Container(
                                      child: Radio(
                                        value:
                                            selectedOptionIndex, //Active Index
                                        groupValue: indexX,
                                        activeColor: CustomeColors.blackColor,
                                        onChanged: (value) => {
                                          //selectedOptionIndex = value;
                                          debugPrint(
                                              'Radio button change : $value')
                                        },
                                      ),
                                    ), */
                                    Container(
                                      // height: 25,
                                      padding: const EdgeInsets.all(5),
                                      // margin: const EdgeInsets.only( left: 45, top: 10),
                                      margin: const EdgeInsets.only(
                                          left: 5, top: 10),
                                      alignment: Alignment.centerLeft,

                                      child: Text('${variants[indexX].title}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: CustomeColors.blackColor)),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 10,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        margin: const EdgeInsets.only(right: 0),
                                        child: SizedBox(
                                          height: 30,
                                          width: 70,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              //_addItem("${variants[indexX].title}");
                                              //_getLocalStorageData();
                                              //_addItem("${variants[indexX].title}");
                                              currentProduct.variants![0] =
                                                  variants[indexX];
                                              currentProduct.cartImage =
                                                  currentProduct.images![indexX]
                                                          ?.src ??
                                                      "";

                                              //setState(() {
                                              //cartController.cartProductListGlobal.add(currentProduct);
                                              cartController
                                                  .addToCart(currentProduct);
                                              //});

                                              ShowTostMsg(
                                                  "Items Added in your cart");
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              //minimumSize: Size(100, 50),
                                              minimumSize: const Size(65, 25),
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: const BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            child: Text('Add',
                                                style: TextStyle(
                                                    //color: Colors.black,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  // ),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedOptionIndex = indexX;
                                  });
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

  /*
  GridView trandingCollectionsGridView() {
    return GridView.builder(
      itemCount:
          productListData.length, //6, //trandingCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, final int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductItemsDetails(productListData[index])));
            },
            child: SizedBox(
              height: 250,
              child: Card(
                color: CustomeColors.bodyBgColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 120,
                              width: 140,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        //image: AssetImage( "assets/images/cat_icon_white_bg_200.png"),
                                        image: NetworkImage(
                                            '${productListData[index].image!.src}'),
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              //height: 120,
                              //width: 140,
                              child: Stack(children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: const EdgeInsets.only(
                                      bottom: 2, top: 4, right: 0, left: 0),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${productListData[index].vendor}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 243, 219, 7),
                                          ),
                                          textAlign: TextAlign.center,

                                          //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${productListData[index].title}',
                                          style: const TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.48,
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              getComparePrice(
                                                  productListData[index].variants![0]),
                                              Text(
                                                '  \$${productListData[index].variants![0].price}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right: 1, left: 1, top: 8),
                                        child: SizedBox(
                                          height: 35,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                showModal(
                                                    context,
                                                    productListData[index]
                                                        .variants!);

                                                if (isCustomization) {
                                                  if (isClikOnAddToCartButtonIndex ==
                                                      index) {
                                                    isClikOnAddToCartButtonIndex =
                                                        index;
                                                    isClikOnAddToCartButton =
                                                        true;
                                                  } else {
                                                    isClikOnAddToCartButtonIndex =
                                                        index;
                                                    isClikOnAddToCartButton =
                                                        true;
                                                  }
                                                } else {
                                                  isClikOnAddToCartButtonIndex =
                                                      index;
                                                  isClikOnAddToCartButton =
                                                      true;
                                                }
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              //backgroundColor: Colors.white,
                                              minimumSize: const Size(140, 40),
                                              backgroundColor:
                                                  (isClikOnAddToCartButton &&
                                                          isClikOnAddToCartButtonIndex ==
                                                              index)
                                                      ? Colors.black
                                                      : Colors.white,

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: const BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            child: Text("ADD TO CART",
                                                style: TextStyle(
                                                    //color: Colors.black,
                                                    color: (isClikOnAddToCartButton &&
                                                            isClikOnAddToCartButtonIndex ==
                                                                index)
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 12)
                                                //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 0.75 / 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  Align buildListHeaderCenter(String str) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 25,
        color: CustomeColors.lighGray,
        padding: EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Text(
          '$str',
          style: const TextStyle(
              fontSize: 14,
              color: CustomeColors.kPrimaryColor,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  int selectedOptionIndex = -1;

  void showModal(context, List<Variants>? variants) {
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
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      //alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Align(
                            //padding: const EdgeInsets.all(8.0),
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'Variant Options',
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
                              child: Icon(
                                Icons.close,
                                color: CustomeColors.blackColor,
                              ),
                              style: ElevatedButton.styleFrom(
                                //backgroundColor: Colors.white,
                                minimumSize: Size(40, 40),
                                backgroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  //side: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /* Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.29,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Add To Cart',
                                  style: TextStyle(
                                      //color: Colors.black,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                //minimumSize: Size(100, 50),
                                minimumSize: Size(100, 40),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ), */
                      ],
                    ),
                  ),
                  new Divider(
                    height: 1,
                    color: CustomeColors.blackColor,
                  ),
                  Expanded(
                    //height: 500,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(2),
                      child: ListView.separated(
                          itemCount: variants!.length, //.length,
                          separatorBuilder: (context, int) {
                            return Divider(
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
                                            selectedOptionIndex, //Active Index
                                        groupValue: indexX,
                                        activeColor: CustomeColors.blackColor,
                                        onChanged: (value) => {
                                          //selectedOptionIndex = value;
                                          print('Radio button change : $value')
                                        },
                                      ),
                                    ),
                                    Container(
                                      // height: 25,
                                      padding: EdgeInsets.all(5),
                                      margin:
                                          EdgeInsets.only(left: 45, top: 10),
                                      alignment: Alignment.centerLeft,

                                      child: Text('${variants[indexX].title}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: CustomeColors.blackColor)),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 10,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(right: 0),
                                        child: SizedBox(
                                          height: 30,
                                          width: 70,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Add',
                                                style: TextStyle(
                                                    //color: Colors.black,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            style: ElevatedButton.styleFrom(
                                              //minimumSize: Size(100, 50),
                                              minimumSize: Size(65, 25),
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  // ),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedOptionIndex = indexX;
                                  });
                                });
                          }),
                    ),
                  )

                  /*  ListView.separated(
                      itemCount: _items.length,
                      separatorBuilder: (context, int) {
                        return Divider();
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Text(_items[index]),
                            onTap: () {
                              setState(() {
                                _selected = _items[index];
                              });
                              Navigator.of(context).pop();
                            });
                      }), */
                ],
              ),
            ),
          );
        });
  }

   */

  /* Widget getLockStatus(int index) {
    final xPrice = {productListData[index].variants![0].compareAtPrice};
    if (!xPrice.isEmpty || xPrice.isNotEmpty) {
      return Text(
        '\$ ${productListData[index].variants![0].compareAtPrice}',
        style: TextStyle(decoration: TextDecoration.lineThrough),
        textAlign: TextAlign.center,
      );

      /*  return const Icon(
        Icons.lock_outline,
        size: 200,
        color: Color(0xff6ae792),
      ); */
    } else {
      return Text('');
    }
  }
  */
}

/*


class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var isCustomization = true;
  var isClikOnAddToCartButton = false;
  var isClikOnAddToCartButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: SingleChildScrollView(
        child: trandingCollectionsGridView(),
      ),
    );
  }

  GridView trandingCollectionsGridView() {
    return GridView.builder(
      itemCount: 10, //trandingCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, final int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new ProductItemsDetails()));
            },
            child: Container(
              child: Card(
                color: CustomeColors.bodyBgColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 130,
                              width: 130,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/cat_icon_white_bg_200.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),

                            Spacer(),
                            // ignore: unnecessary_new
                            new Positioned(
                              // ignore: unnecessary_new
                              child: new Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: const EdgeInsets.only(bottom: 1),
                                  // padding: EdgeInsets.all(5),
                                  //height: 80,

                                  child: Column(children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "NiC Drip",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 243, 219, 7),
                                        ),
                                        textAlign: TextAlign.center,

                                        //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                                      ),
                                    ),

                                    Container(
                                      height: 2,
                                    ),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "E-Eliqude 500 Ml 22",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,

                                        //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                                      ),
                                    ),

                                    Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Text('\$220',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                            Text(
                                              "  \$200",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )),

                                    //Spacer(),

                                    ElevatedButton(
                                      child: const Text("ADD TO CART",
                                          style: TextStyle(
                                            color: Colors.black,
                                          )
                                          //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                          ),
                                      onPressed: () {
                                        setState(() {
                                          if (isCustomization) {
                                            if (isClikOnAddToCartButtonIndex ==
                                                index) {
                                              isClikOnAddToCartButtonIndex =
                                                  index;
                                              isClikOnAddToCartButton = true;
                                            } else {
                                              isClikOnAddToCartButtonIndex =
                                                  index;
                                              isClikOnAddToCartButton = true;
                                            }
                                          }else{
                                            isClikOnAddToCartButtonIndex =
                                                  index;
                                              isClikOnAddToCartButton = true;
                                          }
                                        });
                                      },
                                      //color: Colors.black,
                                      //shape: RoundedRectangleBorder(
                                      //  borderRadius: BorderRadius.circular(15.0),
                                      // ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 0.75 / 1),
      //3 / 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  GridView trandingCollectionsGridView1() {
    return GridView.builder(
      itemCount: 10, //trandingCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: CustomeColors.bodyBgColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /* Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_outline_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ), */
                Expanded(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /* Spacer(),
                      Container(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5, //products[id].tags.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Chip(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                label: Text(
                                  "Cat Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  // style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Spacer(), */

                      Container(
                        height: 100,
                        width: 130,
                        decoration: const BoxDecoration(
                          // color: Colors.transparent,

                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/cat_icon_white_bg_200.png"),
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),

                      new Positioned(
                        child: new Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 80,
                            child: Column(children: <Widget>[
                              Text(
                                "E-Eliqude 500 Ml 22",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
                              ),
                              Text("INR 200"),
                              Spacer(),
                              TextButton(
                                child: Text("ADD TO BAG",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )
                                    //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                    ),
                                onPressed: () {},
                                //color: Colors.black,
                                //shape: RoundedRectangleBorder(
                                //  borderRadius: BorderRadius.circular(15.0),
                                // ),
                              ),
                            ]),
                          ),
                        ),
                      ),

                      // Spacer(),

                      /*    Text(
                        "Color:",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        //style: Theme.of(context).textTheme.headline.copyWith( color: Colors.black,),
                      ),
                      Container(
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5, //products[id].colors.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              width: 75,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.red, // products[id].colors[i],
                                  border: Border.all(
                                      color: Colors.white, width: 5.0)),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Size:",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        // style: Theme.of(context).textTheme.headline.copyWith(color: Colors.black,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7.5),
                        height: 35,
                        //child: SizeSelector(id: id),
                      ), */
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          height: double.infinity,
                          /* child: TextButton(
                            child: Text("ADD TO BAG",
                                style: TextStyle(
                                  color: Colors.black,
                                )
                                //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                ),
                            onPressed: () {},
                            //color: Colors.black,
                            //shape: RoundedRectangleBorder(
                            //  borderRadius: BorderRadius.circular(15.0),
                            // ),
                          ), */
                        ),
                      ),
                      /*   Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ), */
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        /* child: Container(
              //color: Colors.transparent,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage("assets/images/cat_icon_white_bg_200.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),

              child: new Positioned(
                child: new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: [
                        Expanded(
                          child: buildListHeaderCenter("Product Name"),
                          flex: 1,
                        ),
                        Expanded(
                          child: buildListHeaderCenter("Product Name 2"),
                          flex: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: buildListHeaderCenter("Product Name 3"),
                        )
                      ],
                    )),
              ),
            ));
      */
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 0.75 / 1),
      //3 / 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  Align buildListHeaderCenter(String str) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 25,
        color: CustomeColors.lighGray,
        padding: EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Text(
          '$str',
          style: const TextStyle(
              fontSize: 14,
              color: CustomeColors.kPrimaryColor,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

*/
