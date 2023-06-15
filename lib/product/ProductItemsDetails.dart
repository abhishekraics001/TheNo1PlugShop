import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:theplugshop/cart/CartPage.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import 'package:theplugshop/ui/global.dart';
import 'package:theplugshop/product/CarouselImageProductsList.dart';
import 'package:theplugshop/webview/WebPage.dart';
import '../Utility/CustomeColors.dart';
import '../ProductListData/ProductsListData.dart';
import '../ProductListData/Variants.dart';
import '../Utility/UtilityClass.dart';
import 'package:flutter_share/flutter_share.dart';

class ProductItemsDetails extends StatefulWidget {
  final ProductsListData product;
  final isFromPage;
  final MainCategoryName;
  final subaCategoryName;
  final mainCategoryIndex;
  final subCategoryIndex;
  final subTextName;

  const ProductItemsDetails(
      this.isFromPage,
      this.product,
      this.MainCategoryName,
      this.subaCategoryName,
      this.mainCategoryIndex,
      this.subCategoryIndex,
      this.subTextName,
      {Key? key})
      : super(key: key);

  @override
  State<ProductItemsDetails> createState() => _ProductItemsDetailsState();
}

class _ProductItemsDetailsState extends State<ProductItemsDetails> {
  var id = 1;
  late ProductsListData productData;
  final cartController = Get.put(CartController());

  int _currentAmount = 0;
  var appBarTitle = "Details";
  var appBarTitleNavigation = "Home";
  late TextEditingController nameController = TextEditingController();

  int activeCarouselImage = 0;
  int cartQTY = 1;

  PageController pageController = PageController(
    viewportFraction: CarouselTypes == CarouselTypes.details ? 1 : 1,
  ); //PageController();

  @override
  void initState() {
    appBarTitleNavigation = "${widget.subTextName}";
    nameController = new TextEditingController(text: '$cartQTY');
    getRelatedProductListData();
    getTrendingProductListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productData = widget.product;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: const Text('Product Details'), actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Container(
              margin: EdgeInsetsDirectional.only(end: 0),
              height: 150.0,
              width: 40.0,
              child: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => const CartPage()));
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
      // body: SafeArea(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.98,
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

                  /*
              CarouselProductsList(
                productsList: productData.images,
                type: CarouselTypes.details,
              ),
               */
                  Container(
                    height: MediaQuery.of(context).size.width, // *  0.70,
                    width: MediaQuery.of(context).size.width, //*0.98,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: PageView.builder(
                            //controller: PageController(viewportFraction:CarouselTypes ==  CarouselTypes.details ? 1 : 1,),
                            controller: pageController,
                            onPageChanged: (index) {
                              setState(() {
                                activeCarouselImage = index;
                                //pageController.jumpToPage(5);
                              });
                            },
                            itemCount: productData.images!.length,
                            itemBuilder: (ctx, indexxx) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: CarouselTypes == CarouselTypes.details
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                margin:
                                    CarouselTypes == CarouselTypes.details &&
                                            activeCarouselImage != indexxx
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 9.0,
                                            vertical: 15,
                                          )
                                        : const EdgeInsets.symmetric(
                                            horizontal: 9,
                                            vertical: 0,
                                          ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    '${productData.images![indexxx].src}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            productData.images!.length,
                            (i) {
                              return Container(
                                width: 5,
                                height: 5,
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: i == activeCarouselImage
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      //height: 30,
                      width: 80,
                      margin: EdgeInsets.only(top: 10, bottom: 0),
                      //color: Colors.deepOrange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Share: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      //color: Colors.black,
                                      color: CustomeColors.blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)
                                  //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                  ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  shareData("${productData.title}",
                                      "${productData.images?[activeCarouselImage].src}");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.share_rounded,
                                    size: 25.0,
                                    color: CustomeColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /*
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  shareData("${productData.title}",
                                      "${productData.images?[activeCarouselImage].src}");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.facebook,
                                    size: 18.0,
                                    color: CustomeColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  shareData("${productData.title}",
                                      "${productData.images?[0].src}");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.email_outlined,
                                    size: 18.0,
                                    color: CustomeColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  shareData("${productData.title}",
                                      "${productData.images?[0].src}");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.twelve_mp,
                                    size: 18.0,
                                    color: CustomeColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ), */
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 2),
                    // child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 3,
                          margin: EdgeInsets.all(5),
                        ),

                        Container(
                          // margin: EdgeInsets.only(top: 2, bottom: 2),
                          child: Column(children: [
                            Row(
                              children: [
                                Text(
                                  "${productData.vendor}",
                                  style: const TextStyle(
                                    fontSize: productListVandorNameFontSize,
                                    color: CustomeColors
                                        .productListVandorNameColorCode,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),

                        Container(
                          height: 4,
                        ),

                        Text(
                          "${productData.title}",
                          style: const TextStyle(
                              //fontWeight: FontWeight.bold,
                              color:
                                  CustomeColors.productListProductNameColorCode,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                              fontSize: productListProductNameFontSize,
                              fontStyle: FontStyle.normal),
                        ),

                        //Text("${products[id].price}"),
                        Container(
                          height: 4,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.center,
                            //width: MediaQuery.of(context).size.width * 0.48,
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                getComparePrice(
                                    productData.variants![selectedOptionIndex]),
                                Text(
                                  '  \ $paymentCurrency${productData.variants![selectedOptionIndex].price}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: CustomeColors
                                        .productListActualPriceColorCode,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Spacer(),
                        Container(
                          height: 7,
                        ),

                        Container(
                          height: 85,
                          padding: EdgeInsets.all(1),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${productData.options?[0].name ?? ""}",
                                  style: TextStyle(
                                    fontSize: productListVandorNameFontSize,
                                    color: CustomeColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      right: 1, left: 1, top: 5),
                                  child: SizedBox(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          showVProductVariantModalForDetails(
                                              context, productData.variants!);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(140, 40),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          //   shape: BoxShape.rectangle(
                                          //borderRadius: BorderRadius.circular(15.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${productData.variants![selectedOptionIndex].title}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                color: CustomeColors.blackColor,
                                                fontSize: 14,
                                              )
                                              //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                              ),
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: const Icon(
                                              Icons.arrow_drop_down,
                                              size: 24.0,
                                              color: CustomeColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        variantsOptionsSecond(context, productData.variants!),

                        /*
                          Container(
                            height: 85,
                            padding: EdgeInsets.all(1),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    ' \ ${productData.options?[0].name ?? ""}',
                                    style: TextStyle(
                                      fontSize: productListVandorNameFontSize,
                                      color: CustomeColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        right: 1, left: 1, top: 5),
                                    child: SizedBox(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width *
                                          0.90,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            showVProductVariantModalForDetails(
                                                context, productData.variants!);
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(140, 40),
                                          backgroundColor: Colors.white,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            //   shape: BoxShape.rectangle(
                                            //borderRadius: BorderRadius.circular(15.0),
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                            side:
                                            BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${productData.variants![selectedOptionIndex].title}',
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color:
                                                  CustomeColors.blackColor,
                                                  fontSize: 14,
                                                )
                                              //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: const Icon(
                                                Icons.arrow_drop_down,
                                                size: 24.0,
                                                color: CustomeColors.blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],


                            ),
                          ),
                          */

                        Container(
                          //height: 40,
                          margin: const EdgeInsets.only(
                              left: 0, right: 0, top: 5, bottom: 5),
                          //color: Colors.deepOrange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  ShowTostMsg("wishlist coming soon...");
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        size: 18.0,
                                        color: CustomeColors.blackColor,
                                      ),
                                    ),
                                    const Text('Add to wishlist',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          //color: Colors.black,
                                          color: CustomeColors.blackColor,
                                          fontSize: 12,
                                        )
                                        //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                        ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WebPage("RF", "Refund Policy")),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: const Icon(
                                        Icons.navigation_outlined,
                                        size: 18.0,
                                        color: CustomeColors.blackColor,
                                      ),
                                    ),
                                    const Text('Delivery & Return',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          //color: Colors.black,
                                          color: CustomeColors.blackColor,
                                          fontSize: 12,
                                        )
                                        //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                        ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ShowTostMsg("Enquiry Page coming soon...");
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: const Icon(
                                        Icons.email_outlined,
                                        size: 18.0,
                                        color: CustomeColors.blackColor,
                                      ),
                                    ),
                                    const Text('Enquiry',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          //color: Colors.black,
                                          color: CustomeColors.blackColor,
                                          fontSize: 12,
                                        )
                                        //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                        ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 5,
                        ),

                        Container(
                          height: 60,
                          padding: EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                              right: 1, left: 1, top: 0, bottom: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    //BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: const Color(0xC5797575),
                                        width: 0.30,
                                        style: BorderStyle.solid),
                                  ),
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  child: Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 35,
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                //Navigator.of(context).pop();
                                                if (cartQTY > 1) {
                                                  setState(() {
                                                    cartQTY = int.parse(
                                                            nameController
                                                                .value.text) -
                                                        1;
                                                    nameController.text =
                                                        "$cartQTY";
                                                  });
                                                }
                                              },
                                              child: const Text(
                                                '-',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 42,
                                            //height: 35,
                                            //padding: EdgeInsets.all(0),
                                            child: TextField(
                                              controller: nameController,
                                              cursorColor: Colors.black,
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 5,
                                                    bottom: 0,
                                                    top: 0,
                                                    right: 5),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 35,
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                //Navigator.of(context).pop();
                                                setState(() {
                                                  cartQTY = int.parse(
                                                          nameController
                                                              .value.text) +
                                                      1;
                                                  //nameController.text = "$cartQTY";
                                                  nameController.text =
                                                      "$cartQTY";
                                                });
                                              },
                                              child: const Text(
                                                '+',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  )),
                              Container(
                                width: 2,
                                height: 2,
                              ),
                              Container(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          ProductsListData currentProduct =
                                              productData;
                                          currentProduct.variants?[0] =
                                              productData.variants![
                                                  selectedOptionIndex];
                                          currentProduct.cartQty = cartQTY;
                                          currentProduct
                                              .cartImage = currentProduct
                                                  .images![selectedOptionIndex]
                                                  ?.src ??
                                              "";
                                          cartController
                                              .addToCart(currentProduct);
                                          ShowTostMsg(
                                              "Items Added in your cart");
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(140, 40),
                                        backgroundColor: Colors.black,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          //   shape: BoxShape.rectangle(
                                          //borderRadius: BorderRadius.circular(15.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Add To Cart'.toUpperCase(),
                                              style: const TextStyle(
                                                color: CustomeColors.WhiteColoe,
                                                fontSize: 14,
                                              )
                                              //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                                              ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Html(data: '${productData.bodyHtml}'),
                      ],
                    ),
                    //  ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: const Text(
                'RELATED PRODUCTS',
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: CustomeColors.productListProductNameColorCode,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
                textAlign: TextAlign.center,
                maxLines: 1,
                //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
              ),
            ),
            Container(
              height: 300,
              child: relatedProductListView(),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 5),
              child: Text(
                'Best Seller'.toUpperCase(),
                style: const TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: CustomeColors.productListProductNameColorCode,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
                textAlign: TextAlign.center,
                maxLines: 1,
                //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold,color: Colors.black,),
              ),
            ),
            Container(
              height: 300,
              child: trandingCollectionsGridView(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> shareData(String productName, String imgaeURL) async {
    await FlutterShare.share(
        title: 'TheNo1 Plug Shop',
        text: '$productName',
        linkUrl: '$imgaeURL',
        chooserTitle: 'Example Chooser Title');
  }

  Widget variantsOptionsSecond(context, List<Variants>? variants) {
    var vaz = productData.options?.length;
    if (vaz! > 1) {
      return Container(
        height: 85,
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "${productData.options?[1].name ?? ""}",
                style: TextStyle(
                  fontSize: productListVandorNameFontSize,
                  color: CustomeColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(right: 1, left: 1, top: 5),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showVProductVariantModalForDetailsOp2(
                            context, productData.variants!);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(140, 40),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        //   shape: BoxShape.rectangle(
                        //borderRadius: BorderRadius.circular(15.0),
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${productData.options![selectedOptionIndex2]}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: CustomeColors.blackColor,
                              fontSize: 14,
                            )
                            //style: Theme.of(context).textTheme.button.copyWith( color: Colors.white, ),
                            ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            size: 24.0,
                            color: CustomeColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(height: 0);
    }
  }

  int selectedOptionIndex = 0;
  int selectedOptionIndex1 = 0;
  int selectedOptionIndex2 = 0;

  int getSelectedOptionIndexVal() {
    var opLenght = productData.options?.length;
    if (opLenght! > 1) {
      var variantsx = productData.variants;
      var variantsxlen = productData.variants?.length ?? 0;
      for (int i = 0; i < variantsxlen; i++) {
        var selItems1 = productData.options?[selectedOptionIndex1];
        var selItems2 = productData.options?[selectedOptionIndex2];
        if (variantsx![i].option1 == selItems1 ||
            variantsx![i].option2 == selItems2) {
          return i;
        }
      }
      return 1;
    } else {
      return selectedOptionIndex1;
    }
  }

  void showVProductVariantModalForDetails(context, List<Variants>? variants) {
    var ops1 = productData.options?[0].values;
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
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
                          child: const Align(
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
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(2),
                      child: ListView.separated(
                          itemCount: ops1?.length ?? 0, //.length,
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
                                            selectedOptionIndex1, //Active Index
                                        groupValue: indexX,
                                        activeColor: CustomeColors.blackColor,
                                        onChanged: (value) => {
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

                                      child: Text(ops1![indexX],
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
                                        margin: EdgeInsets.only(right: 0),
                                        child: SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedOptionIndex1 = indexX;

                                                selectedOptionIndex =
                                                    getSelectedOptionIndexVal();
                                                pageController.jumpToPage(
                                                    selectedOptionIndex);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              //minimumSize: Size(100, 50),
                                              minimumSize: Size(75, 25),
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: const BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            child: const Text('Select',
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
                                    setState(() {
                                      selectedOptionIndex1 = indexX;
                                      selectedOptionIndex =
                                          getSelectedOptionIndexVal();
                                      pageController
                                          .jumpToPage(selectedOptionIndex);
                                    });
                                  });
                                  Navigator.of(context).pop();
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

  void showVProductVariantModalForDetailsOp2(
      context, List<Variants>? variants2) {
    var opns2 = productData.options?[1].values;
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
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
                          child: const Align(
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
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(2),
                      child: ListView.separated(
                          itemCount: opns2?.length ?? 0, //.length,
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
                                            selectedOptionIndex2, //Active Index
                                        groupValue: indexX,
                                        activeColor: CustomeColors.blackColor,
                                        onChanged: (value) => {
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

                                      child: Text(opns2![indexX],
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
                                        margin: EdgeInsets.only(right: 0),
                                        child: SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedOptionIndex2 = indexX;
                                                selectedOptionIndex =
                                                    getSelectedOptionIndexVal();
                                                pageController.jumpToPage(
                                                    selectedOptionIndex);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              //minimumSize: Size(100, 50),
                                              minimumSize: Size(75, 25),
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: const BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            child: const Text('Select',
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
                                    setState(() {
                                      selectedOptionIndex2 = indexX;
                                      selectedOptionIndex =
                                          getSelectedOptionIndexVal();
                                      pageController
                                          .jumpToPage(selectedOptionIndex);
                                    });
                                  });
                                  Navigator.of(context).pop();
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

  List<ProductsListData> recomndedProductList = [ProductsListData()];
  Future<void> getRelatedProductListData() async {
    var responseData = await getTrendingProductList("6")
        .then((value) => {
              debugPrint('Lentxxx PPPP Email: ${value?.length}'),
              // ShowTostMsg(SuccessMsg),
              setState(() {
                recomndedProductList = value!.cast<ProductsListData>();
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

  List<ProductsListData> trendingProductList = [ProductsListData()];
  Future<void> getTrendingProductListData() async {
    var responseData = await getTrendingProductList('6')
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

  ListView relatedProductListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recomndedProductList.length,
        itemBuilder: (ctx, index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProductItemsDetails(
                        "HomePage",
                        recomndedProductList[index],
                        "Trending Products",
                        "${recomndedProductList[index].title}",
                        "",
                        "",
                        "Home  |  Trending Products  |  ${recomndedProductList[index].title}")));
              },
              child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.60,
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
                                              '${recomndedProductList[index].image?.src}'),
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
                                            '${recomndedProductList[index].vendor}',

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
                                            '${recomndedProductList[index].title}',
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
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                getComparePrice(
                                                    recomndedProductList[index]
                                                        .variants![0]),
                                                Text(
                                                  '  \$${recomndedProductList[index].variants![0].price}',
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
                                                        /*
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
                                                      */
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            const Size(40, 35),
                                                        maximumSize:
                                                            const Size(40, 35),
                                                        backgroundColor:
                                                            CustomeColors
                                                                .blackColor2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          side: const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                      ),
                                                      /*  child: Icon(
                                                        Icons.add_shopping_cart,
                                                        size: 25,
                                                        color: CustomeColors.WhiteColoe,
                                                      ), */
                                                      child: Text("Add",
                                                          style: TextStyle(
                                                              //color: Colors.black,
                                                              color:
                                                                  Colors.white,
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
        });
  }

  ListView trandingCollectionsGridView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingProductList.length,
        itemBuilder: (ctx, index) {
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
                height: 250,
                width: MediaQuery.of(context).size.width * 0.60,
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
                                              '${trendingProductList[index].image?.src}'),
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
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                getComparePrice(
                                                    trendingProductList[index]
                                                        .variants![0]),
                                                Text(
                                                  '  \$${trendingProductList[index].variants![0].price}',
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
                                                        /*
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
                                                      */
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            const Size(40, 35),
                                                        maximumSize:
                                                            const Size(40, 35),
                                                        backgroundColor:
                                                            CustomeColors
                                                                .blackColor2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
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
                                                              color:
                                                                  Colors.white,
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
        });
  }

  /*
  GridView trandingCollectionsGridView() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: trendingProductList.length,
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
                                                '  \$${trendingProductList[index].variants![0].price}',
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
                                                width: 55,
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
                                                      /*
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
                                                      */
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      minimumSize: const Size(40, 35),
                                                      maximumSize: const Size(40, 35),
                                                      backgroundColor: CustomeColors.blackColor2,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(5.0),
                                                        side: const BorderSide(
                                                            color: Colors.transparent),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.add_shopping_cart,
                                                      size: 25,
                                                      color: CustomeColors.WhiteColoe,
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
}
