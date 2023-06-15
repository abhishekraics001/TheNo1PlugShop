import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import 'package:theplugshop/search/SearchPage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utility/CustomeColors.dart';
import '../ProductListData/ProductsListData.dart';
import '../ProductListData/Variants.dart';
import '../product/SubCollectionPage.dart';
import '../Utility/UtilityClass.dart';
import '../product/ProductItemsDetails.dart';
import '../product/ProductList.dart';
import 'package:localstorage/localstorage.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cartController = Get.put(CartController());

  late PageController _imageSliderpageController;
  int imageSliderCurrentActivePos = 0;

  List<ProductsListData> trendingProductList = [ProductsListData()];

  @override
  void initState() {
    super.initState();
    _imageSliderpageController = PageController(viewportFraction: 0.8);

    isCustomization = true;
    isClikOnAddToCartButton = false;
    isClikOnAddToCartButtonIndex = -1;

    getTrendingProductListData();

    //_getLocalStorageData();
  }

  Future<void> getTrendingProductListData() async {
    var responseData = await getTrendingProductList('10')
        .then((value) => {
              debugPrint('Lentxxx PPPP Email: ${value?.length}'),
              // ShowTostMsg(SuccessMsg),
              setState(() {
                trendingProductList = value!.cast<ProductsListData>();
                OverlayLoadingProgress.stop();
              }),
            })
        .catchError((error) => {
              // ignore: avoid_debugPrint
              OverlayLoadingProgress.stop(),
              debugPrint('Login Error Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                  decoration:
                      const BoxDecoration(color: CustomeColors.kPrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(5), child: searchBox())),
            ),
            Container(
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 5, top: 2, bottom: 2, right: 2),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: collectionListData.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SubCollectionPage(
                                      'HomePageMainCollection',
                                      '${collectionListData[index].cId}',
                                      collectionListData[index].cTitle,
                                      '$index')));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(
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
                                  collectionListData[index]
                                      .cTitle
                                      .toUpperCase(),
                                  style: const TextStyle(
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
            )),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 2500,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return SizedBox(
                            height: 265,
                            child: Column(children: [
                              buildCarouselSlider(),
                              buildRowImageSliderIndeicator(),
                            ]),
                          );
                        } else if (index == 1) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                buildListHeader("Best Collection"),
                                bestCollectionGridView(),
                              ],
                            ),
                          );
                        } else if (index == 2) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Stack(
                                    children: [
                                      buildListHeader("Trending Product"),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    ProductList(
                                                        'homePageTrendingProduct',
                                                        'collectionIndexX',
                                                        '$index',
                                                        'collectionNamex',
                                                        'cSubCollectionListItems[index].scTitle',
                                                        'collectionCodeTagX',
                                                        'cSubCollectionListItems[index].scCode', '', '', '')));
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              margin: const EdgeInsets.only(
                                                  top: 5, right: 5),
                                              width: 80,
                                              height: 50,
                                              child: Row(
                                                children: const [
                                                  Text(
                                                    "View All",
                                                  ),
                                                  Icon(Icons.navigate_next),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                trandingCollectionsGridView(),
                              ],
                            ),
                          );
                        } else if (index == 3) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                buildListHeader("Find us on Social Media"),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  height: 65,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: socialmeadia.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          child: Column(children: [
                                            socialMediaSlider(index),
                                          ]),
                                        );
                                      }),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            child: Column(
                              children: const <Widget>[
                                Text(
                                  "N/A",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.amber),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align buildListHeader(String str) {
    return Align(
      //alignment: Alignment.centerLeft,
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          str,
          style: const TextStyle(
              fontSize: 16,
              color: CustomeColors.bodyTextColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Align buildListHeaderCenter(String str) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 25,
        color: CustomeColors.lighGray,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Text(
          str,
          style: const TextStyle(
              fontSize: 14,
              color: CustomeColors.kPrimaryColor,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  TextField searchBox() {
    return TextField(
      onChanged: (value) {
        debugPrint("search onChanged: $value");
      },
      onSubmitted: (value) {
        //debugPrint("search onSubmitted:  $value");
        // new SearchPage(title: 'ListView with Search');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                SearchPage(title: 'ListView with Search')));
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

  Widget categorySlider(int index) {
    return Container(
      //margin: EdgeInsets.all(2),
      //padding: EdgeInsets.all(6),
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      child: Card(
          //elevation: 5,
          color: Colors.white,
          //shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(10),
          //    ),
          child: SizedBox(
            width: 72,
            height: 72,
            //child: Center(child: Text('YoYo', style: TextStyle(fontSize: 50)) ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 72,
                    height: 72,
                    padding: const EdgeInsets.all(5),
                    //margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle, //BoxShape.circle,
                      border:
                          Border.all(color: CustomeColors.iconColor, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                          image: AssetImage(
                              "assets/images/${collectionListData[index].cImageName}"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  BoxDecoration myBoxBorderDecoration() {
    return BoxDecoration(
      color: CustomeColors.bodyBgColor,
      border: Border.all(
        color: CustomeColors.kPrimaryColor,
        width: 1.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    );
  }

  Row buildRowImageSliderIndeicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagesCousal.map((url) {
        int index = imagesCousal.indexOf(url);
        return Container(
          width: 5.0,
          height: 5.0,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: imageSliderCurrentActivePos == index
                ? const Color.fromRGBO(0, 0, 0, 0.9)
                : const Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: imagesCousal.length,
      options: CarouselOptions(
          viewportFraction: 1,
          height: 250,
          autoPlay: true,
          aspectRatio: 1,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              imageSliderCurrentActivePos = index;
            });
          }),
      itemBuilder: (BuildContext context, int pagePosition, _) {
        bool active = pagePosition == imageSliderCurrentActivePos;
        return imageCrousalSlider(imagesCousal, pagePosition, active);
      },
    );
  }

  AnimatedContainer imageCrousalSlider(images, pagePosition, active) {
    double margin = active ? 10 : 10;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      //height:  MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          //image: Image.network(images[pagePosition], fit: BoxFit.cover)
          image: DecorationImage(
        //image: NetworkImage(imagesCousal[pagePosition]),
        image: AssetImage('assets/images/${imagesCousal[pagePosition]}'),
        fit: BoxFit.fill,
      )),
    );
  }

  GridView bestCollectionGridView() {
    return GridView.builder(
      itemCount: bestCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProductList(
                      'homePageBestCollections',
                      '$index',
                      bestCollectionCategoryList[index],
                      '',
                      '',
                      '',
                      '',
                      bestCollectionCategoryList[index],
                    '',
                    ''
                  )));
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 1,
            child: Container(
                //color: Colors.transparent,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${bestCollectionCategoryListImage[index]}'), //AssetImage("assets/images/cat_icon_white_bg_200.png"),
                    //fit: BoxFit.fitWidth,
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  //child: buildListHeaderCenter(bestCollectionCategoryList[index]),
                )),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  GridView wholeShalesCollection() {
    return GridView.builder(
      itemCount: 1,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
              //color: Colors.transparent,
              decoration: const BoxDecoration(
                //color: Colors.transparent,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/cat_icon_white_bg_200.png"),
                  //fit: BoxFit.fitWidth,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: buildListHeaderCenter('Hello')),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 2.8 / 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }

  bool isCustomization = true;
  bool isClikOnAddToCartButton = false;
  int isClikOnAddToCartButtonIndex = -1;

  GridView trandingCollectionsGridView() {
    return GridView.builder(
      itemCount: trendingProductList
          .length, //6, //trandingCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, final int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProductItemsDetails(
                      "HomePage",
                      trendingProductList[index],
                      "Trending Products",
                      "${trendingProductList[index].title}",
                      "",
                      "",
                      "Home  |  Trending Products  |  ${trendingProductList[index].title}")));
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
                                            '${trendingProductList[index].image!.src}'),
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
                                          '${trendingProductList[index].vendor}',

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
                                          '${trendingProductList[index].title}',
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
                                                  trendingProductList[index]
                                                      .variants![0]),
                                              Text(
                                                '  \ $paymentCurrency${trendingProductList[index].variants![0].price}',
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
                                                            trendingProductList[
                                                                    index]
                                                                .variants!,
                                                            trendingProductList[
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
                                                    /* child: Icon(
                                                        Icons.add_shopping_cart,
                                                        size: 25,
                                                      color: CustomeColors.WhiteColoe,
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

  /*
  GridView trandingCollectionsGridView() {
    return GridView.builder(
      itemCount: trendingProductList
          .length, //6, //trandingCollectionCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, final int index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductItemsDetails("HomePage", trendingProductList[index], "Trending Products" , "${trendingProductList[index].title}", "", "", "Home  |  Trending Products  |  ${trendingProductList[index].title}")));
            },
            child: SizedBox(
              height: 290,
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
                                        image: AssetImage( "assets/images/cat_icon_white_bg_200.png"),
                                        //image: NetworkImage( '${trendingProductList[index].image!.src ?? "assets/images/cat_icon_white_bg_200.png"}'),
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
                                          '${trendingProductList[index].vendor}',

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
                                          '${trendingProductList[index].title}',
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
                                                  trendingProductList[index]
                                                      .variants![0]),
                                              Text(
                                                '  \ $paymentCurrency${trendingProductList[index].variants![0].price}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: productListAtualPriceFontSize,
                                                  color: CustomeColors.productListActualPriceColorCode,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                EdgeInsets.only(left: 10),
                                                //margin:  EdgeInsets.only(
                                                // right: 1, left: 1, top: 8),
                                                padding: EdgeInsets.only(left: 0, right: 0),
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
                                                            trendingProductList[
                                                            index]
                                                                .variants!,
                                                            trendingProductList[
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
                                                    style: ElevatedButton.styleFrom(
                                                      minimumSize: const Size(40, 35),
                                                      maximumSize: const Size(40, 35),
                                                      backgroundColor: (isClikOnAddToCartButton &&
                                                          isClikOnAddToCartButtonIndex ==
                                                              index)
                                                          ? CustomeColors.blackColor2
                                                          : CustomeColors.blackColor2,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(5.0),
                                                        side: const BorderSide(
                                                            color: Colors.transparent),
                                                      ),
                                                    ),
                                                    /* child: Icon(
                                                        Icons.add_shopping_cart,
                                                        size: 25,
                                                      color: CustomeColors.WhiteColoe,
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
          childAspectRatio: 0.65 / 1),
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
    );
  }
  */

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

  Future<void> launchUrlStart({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Widget socialMediaSlider(int index) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          launchUrlStart(url: 'https://www.facebook.com/theno1plug/');
        } else if (index == 1) {
          launchUrlStart(url: 'https://www.instagram.com/theno1plug.kly/');
        } else {
          launchUrlStart(url: 'https://theno1plug.co.uk/pages/contact');
        }
      },
      child: Container(
        //constraints: BoxConstraints(minHeight: 120, minWidth: 120, maxHeight: 120, maxWidth: 120),
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(5),
        width: 110,
        decoration: myBoxBorderDecoration(),
        alignment: Alignment.centerLeft,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                //padding: EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${socialmeadiaImage[index]}'),
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                socialmeadia[index],
                style: const TextStyle(
                  color: CustomeColors.bodyTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              )
            ]),
      ),
    );
  }
}





/*
class DropDownListExample extends StatefulWidget {
  const DropDownListExample({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  /// This is list of city which will pass to the drop down.
  final List<SelectedListItem> _listOfCities = [
    SelectedListItem(
      name: "kTokyo",
      value: "TYO",
      isSelected: false,
    ),
    SelectedListItem(
      name: "kNewYork",
      value: "NY",
      isSelected: false,
    ),
    SelectedListItem(
      name: "kLondon",
      value: "LDN",
      isSelected: false,
    ),
    SelectedListItem(name: "kParis"),
    SelectedListItem(name: "kMadrid"),
    SelectedListItem(name: "kDubai"),
    SelectedListItem(name: "kRome"),
  ];


  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  /// This is register text field controllers.
  final TextEditingController _fullNameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _phoneNumberTextEditingController = TextEditingController();
  final TextEditingController _cityTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _phoneNumberTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("appBarTitle")),
      body: SafeArea(
        child: _mainBody(),
      ),
    );
  }

  /// This is Main Body widget.
  Widget _mainBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),

          AppTextField(
            textEditingController: _cityTextEditingController,
            title: "kCity",
            hint: "kChooseYourCity",
            isCitySelected: true,
            cities: _listOfCities,
          ),

          const SizedBox(
            height: 15.0,
          ),
          DropdownFormField<Map<String, dynamic>>(
           // onEmptyActionPressed: () async {},
            decoration: InputDecoration(
               // border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.add),

                //labelText: "Access"
            ),

            onSaved: (dynamic str) {},
            onChanged: (dynamic str) {},
            validator: (dynamic str) {},
            displayItemFn: (dynamic item) => Text(
              (item ?? {})['name'] ?? '',
              style: TextStyle(fontSize: 16),
            ),
            findFn: (dynamic str) async => _roles,
            selectedFn: (dynamic item1, dynamic item2) {
              if (item1 != null && item2 != null) {
                return item1['name'] == item2['name'];
              }
              return false;
            },
            filterFn: (dynamic item, str) =>
            item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
            dropdownItemFn: (dynamic item, int position, bool focused,
                bool selected, Function() onTap) =>
                ListTile(
                  title: Text(item['name']),
                  subtitle: Text(
                    item['desc'] ?? '',
                  ),
                  tileColor:
                  focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                  onTap: onTap,
                ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          _AppElevatedButton(),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController = TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
       /* bottomSheetTitle: const Text(
          "kCities",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ), */
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }
          showSnackBar(list.toString());
        },
        //enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
            FocusScope.of(context).unfocus();
            onTextFieldTap();
          }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

/// This is common class for 'REGISTER' elevated button.
class _AppElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "kREGISTER",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(70, 76, 222, 1),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  }
 */

