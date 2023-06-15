import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:theplugshop/ProductListData/ProductsListData.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/checkout/CheckOutPage.dart';
import 'package:theplugshop/home/HomePage.dart';
import 'package:theplugshop/ui/screens/cart.dart';
import '../Utility/CustomeColors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.put(CartController());
  var carCount = 0;

  @override
  Widget build(BuildContext context) {
    carCount = cartController.cartProductListGlobal.length ?? 0;
    if (carCount > 0) {
      carCount = carCount; // + 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Your cart items",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 15),

            //cartUiView(carCount: carCount, cartController: cartController),
            _buildLoginButton(carCount, cartController),
          ],
        ),
      ),
    );
  }




  Widget _buildLoginButton(int carCount, CartController cartController) {
    if (carCount > 0) {
      return Expanded(
        child: cartUIView(carCount2: carCount, cartController2: cartController),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - 200,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_shopping_cart_rounded,
                color: CustomeColors.lighGray2,
                size: 92,
              ),
              Text(
                "You havn't added any items in your cart",
                style: TextStyle(
                    color: Color.fromRGBO(35, 35, 35, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Divider(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    "Tab to continue shopping",
                    style: TextStyle(
                        //fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    /* Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context) {
                       return HomePage();
                     }));*/
                  },
                ),
              ),
            ]),
      );
    }
  }
}


class cartUIView extends StatefulWidget {

  const cartUIView({
    Key? key,
    required this.carCount2,
    required this.cartController2,
  }) : super(key: key);

  final int carCount2;
  final CartController cartController2;

  @override
  State<cartUIView> createState() => _cartUIViewState();
}

class _cartUIViewState extends State<cartUIView> {

  final cartController = Get.put(CartController());
  var carCount = 0;

  @override
  Widget build(BuildContext context) {

    carCount = cartController.cartProductListGlobal.length ?? 0;
    if (carCount > 0) {
      carCount = carCount; // + 1;
    }


    return Expanded(
      child: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount:  carCount, //bag.length,
            itemBuilder: (ctx, final int indexx) {
              if (indexx <= carCount - 1) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            // "${cartController.cartProductListGlobal[indexx].image!.src}",
                            "${cartController.cartProductListGlobal[indexx].cartImage}",
                            fit: BoxFit.contain,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${cartController.cartProductListGlobal[indexx].title}",
                              style: TextStyle(
                                  color: Color.fromRGBO(35, 35, 35, 1)),
                              //style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${cartController.cartProductListGlobal[indexx].variants?[0].title}",
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            ),
                            Text(
                              "$paymentCurrency${cartController.cartProductListGlobal[indexx].variants?[0].price}",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${cartController.cartProductListGlobal[indexx].vendor}",
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            ),
                            SizedBox(height: 5),

                            // MyCounter(cartController,indexx),




                            Container(
                              height: 50,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
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
                                                    ShowTostMsg(
                                                        "Cart Items update(less) successfully.");
                                                    setState(() {
                                                      cartController
                                                          .removeMoreQtyFromCart(
                                                          indexx, 1);
                                                    });
                                                    //carCount = 0;
                                                    //Navigator.of(context).pop();
                                                    /*
                                                    if(cartQTY >1) {
                                                      setState(() {
                                                        cartQTY = int.parse(nameController.value.text) - 1;
                                                        nameController.text = "$cartQTY";
                                                      }
                                                      );
                                                    }
                                                    */
                                                  },
                                                  child: const Text(
                                                    '-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 42,
                                                //height: 35,
                                                //padding: EdgeInsets.all(0),
                                                child:  Obx(
                                                      () =>
                                                      TextField(
                                                        // controller: nameController,

                                                        cursorColor: Colors.black,
                                                        keyboardType:
                                                        TextInputType.number,
                                                        controller: TextEditingController()..text = '${cartController.cartProductListGlobal[indexx].cartQty!}',
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight.normal,
                                                            color: Colors.black),
                                                        decoration: const InputDecoration(
                                                          border: InputBorder.none,
                                                          focusedBorder:
                                                          InputBorder.none,
                                                          enabledBorder:
                                                          InputBorder.none,
                                                          errorBorder: InputBorder.none,
                                                          disabledBorder:
                                                          InputBorder.none,
                                                          contentPadding:
                                                          EdgeInsets.only(
                                                              left: 5,
                                                              bottom: 0,
                                                              top: -10,
                                                              right: 5),
                                                        ),
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 40,
                                                child: TextButton(
                                                  onPressed: () {
                                                    ShowTostMsg("Cart Items update(more) successfully.");
                                                    //Navigator.of(context).pop();

                                                    //var cartQTY = cartController.cartProductListGlobal[indexx].cartQty! + 1;
                                                    setState(() {
                                                      cartController
                                                          .addMoreQtyFromCart(
                                                          indexx, 1);
                                                    });
                                                    /*
                                                    setState(() {
                                                      cartQTY = int.parse(nameController.value.text) + 1;
                                                      //nameController.text = "$cartQTY";
                                                      nameController.text  = "$cartQTY";
                                                    });
*/

                                                  },
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),

                                            ]),
                                      )),





                                  Container(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 45,
                                        width: 70,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ShowTostMsg( "Items successfully removed from your cart.");
                                            setState(() {
                                              cartController.removeFromCart(
                                                  indexx);

                                              carCount = cartController.cartProductListGlobal.length ?? 0;
                                              if (carCount > 0) {
                                                carCount = carCount; // + 1;
                                              }
                                            });
                                            /*
                                            setState(() {
                                              ProductsListData currentProduct =
                                                  productData;
                                              currentProduct.variants?[0] =
                                              productData.variants![
                                              selectedOptionIndex];
                                              currentProduct.cartQty = cartQTY;
                                              currentProduct.cartImage =  currentProduct.images![selectedOptionIndex]?.src ?? "";
                                              cartController.addToCart(currentProduct);


                                              ShowTostMsg(
                                                  "Items Added in your cart");
                                            });

                                             */


                                          },

                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(60, 40),
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              //   shape: BoxShape.rectangle(
                                              //borderRadius: BorderRadius.circular(15.0),
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              //side: BorderSide(color: Colors.grey),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_forever,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              //Text("Remove")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ORDER SUMMARY",
                          style: TextStyle(
                              color: Color.fromRGBO(35, 35, 35, 1),
                              fontWeight: FontWeight.bold),
                          //style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                // padding:EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                //color: Colors.pink[300],
                                //height: 100,
                                child: Text(
                                  'Sub Total:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                //height: 100,
                                //color: Colors.green,
                                child: Obx(
                                      () => Text(
                                    '$paymentCurrency${cartController.totalPrice}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 25,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 50,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.all(1),
                                alignment: Alignment.centerLeft,
                                //color: Colors.pink[300],
                                height: 50,
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                  decoration: InputDecoration(
                                    labelText: 'Coupon Code',
                                    hintText: 'Coupon Code',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    border: UnderlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 40,
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.all(1),
                                child: Expanded(
                                  child: Container(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        side: BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text(
                                        "Apply Coupan",
                                        style: TextStyle(
                                          //fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),

        Divider(),

        Row(
          children: <Widget>[
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "TOTAL",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Obx(
                            () => Text(
                          '$paymentCurrency${cartController.totalPrice}',
                          style: TextStyle(
                            //color: CustomeColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ])),
            //Expanded(
            Container(
              height: 45,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new CheckOutPage()));
                },
              ),
            ),
            // ),
          ],
        ),
      ]),
    );
  }
}


/*
class cartUiView extends StatelessWidget {
  const cartUiView({
    Key? key,
    required this.carCount,
    required this.cartController,
  }) : super(key: key);

  final int carCount;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount:  carCount, //bag.length,
            itemBuilder: (ctx, final int indexx) {
              if (indexx <= carCount - 1) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Image.network(
                           // "${cartController.cartProductListGlobal[indexx].image!.src}",
                            "${cartController.cartProductListGlobal[indexx].cartImage}",
                            fit: BoxFit.contain,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${cartController.cartProductListGlobal[indexx].title}",
                              style: TextStyle(
                                  color: Color.fromRGBO(35, 35, 35, 1)),
                              //style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${cartController.cartProductListGlobal[indexx].variants?[0].title}",
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            ),
                            Text(
                              "$paymentCurrency${cartController.cartProductListGlobal[indexx].variants?[0].price}",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${cartController.cartProductListGlobal[indexx].vendor}",
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1)),
                            ),
                            SizedBox(height: 5),

                            // MyCounter(cartController,indexx),




                            Container(
                              height: 50,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
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
                                                    ShowTostMsg(
                                                        "Cart Items update(less) successfully.");
                                                    cartController.removeMoreQtyFromCart(indexx, 1);
                                                    //carCount = 0;
                                                    //Navigator.of(context).pop();
                                                    /*
                                                    if(cartQTY >1) {
                                                      setState(() {
                                                        cartQTY = int.parse(nameController.value.text) - 1;
                                                        nameController.text = "$cartQTY";
                                                      }
                                                      );
                                                    }
                                                    */
                                                  },
                                                  child: const Text(
                                                    '-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 42,
                                                //height: 35,
                                                //padding: EdgeInsets.all(0),
                                                  child:  Obx(
                                                      () =>
                                                TextField(
                                                 // controller: nameController,

                                                  cursorColor: Colors.black,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  controller: TextEditingController()..text = '${cartController.cartProductListGlobal[indexx].cartQty!}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      color: Colors.black),
                                                  decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                    InputBorder.none,
                                                    enabledBorder:
                                                    InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    disabledBorder:
                                                    InputBorder.none,
                                                    contentPadding:
                                                    EdgeInsets.only(
                                                        left: 5,
                                                        bottom: 0,
                                                        top: -10,
                                                        right: 5),
                                                  ),
                                                ),
                                              ),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 40,
                                                child: TextButton(
                                                  onPressed: () {
                                                    ShowTostMsg("Cart Items update(more) successfully.");
                                                    //Navigator.of(context).pop();

                                                   //var cartQTY = cartController.cartProductListGlobal[indexx].cartQty! + 1;
                                                    cartController.addMoreQtyFromCart(indexx, 1);
                                                    /*
                                                    setState(() {
                                                      cartQTY = int.parse(nameController.value.text) + 1;
                                                      //nameController.text = "$cartQTY";
                                                      nameController.text  = "$cartQTY";
                                                    });
*/

                                                  },
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),

                                            ]),
                                      )),





                                  Container(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 45,
                                        width: 70,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ShowTostMsg( "Items successfully removed from cart.");
                                            setState(() {
                                              cartController.removeFromCart(
                                                  indexx);
                                            });


                                          },

                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(60, 40),
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              //   shape: BoxShape.rectangle(
                                              //borderRadius: BorderRadius.circular(15.0),
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              //side: BorderSide(color: Colors.grey),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_forever,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              //Text("Remove")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ORDER SUMMARY",
                          style: TextStyle(
                              color: Color.fromRGBO(35, 35, 35, 1),
                              fontWeight: FontWeight.bold),
                          //style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                // padding:EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                //color: Colors.pink[300],
                                //height: 100,
                                child: Text(
                                  'Sub Total:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                //height: 100,
                                //color: Colors.green,
                                child: Obx(
                                  () => Text(
                                    '$paymentCurrency${cartController.totalPrice}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 25,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 50,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.all(1),
                                alignment: Alignment.centerLeft,
                                //color: Colors.pink[300],
                                height: 50,
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                  decoration: InputDecoration(
                                    labelText: 'Coupon Code',
                                    hintText: 'Coupon Code',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    border: UnderlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 40,
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.all(1),
                                child: Expanded(
                                  child: Container(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        side: BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text(
                                        "Apply Coupan",
                                        style: TextStyle(
                                            //fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),

        Divider(),

        Row(
          children: <Widget>[
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text(
                    "TOTAL",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '$paymentCurrency${cartController.totalPrice}',
                      style: TextStyle(
                        //color: CustomeColors.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ])),
            //Expanded(
               Container(
                height: 45,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new CheckOutPage()));
                  },
                ),
              ),
           // ),
          ],
        ),
      ]),
    );
  }
}
*/


/*
class MyCounter extends StatefulWidget {
  // final int carCount;
  final CartController cartController;
  final int cartIndex;

  const MyCounter({
    Key? key,
    required this.cartController,
    required this.cartIndex,
  }) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}
*/

class _MyCounterState extends State<MyCounter> {
  int currentAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(1),
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1, color: Colors.grey)),
      child: IntrinsicWidth(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  currentAmount -= 1;
                });
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                width: 100.0,
                //height: 30,
                child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "$currentAmount",

                      fillColor: Colors.transparent,
                      //filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    )),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  currentAmount += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
