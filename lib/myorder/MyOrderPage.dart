import 'package:flutter/material.dart';
import 'package:theplugshop/Utility/CustomeColors.dart';
import 'package:theplugshop/myorder/OrderListData.dart';

class MyOrderPage extends StatelessWidget {
  static const String routeName = '/MyOrderPage';
  final  Orders orderListData;
  const MyOrderPage(this.orderListData, {Key? key}) : super(key: key);

  //const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order details'),
      ),
      body: Container(
        height: 1500,

    child:  SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 1000,

        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
               // width: MediaQuery.of(context).size.width - 45,
                child:  OredrItemsdetailsView(context),
              ),




              Container(
                //color: Colors.red,
                height: 180,
                margin: EdgeInsets.only(left: 10, top: 5, right: 5),
              child: Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(2),
                child: AddressViewLabel("Items Details"),
              ),

              Divider(
                height: 3,
              ),

              Container(

                child:  Column(

                      children: <Widget>[
                        Row(
                            children: const <Widget>[
                             // Expanded(child: Text('', style: TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,))),
                              Expanded(child: Text('PRODUCT', style:  TextStyle(height: 3.0, fontSize: 14, fontWeight: FontWeight.bold,),  textAlign: TextAlign.center)),
                              //Expanded(child: Text('SKU', style:  TextStyle(height: 3.0, fontSize: 12, fontWeight: FontWeight.bold,))),
                              Expanded(child: Text('PRICE', style: TextStyle(height: 3.0, fontSize: 14, fontWeight: FontWeight.bold,),  textAlign: TextAlign.center)),
                              Expanded(child: Text('QUANTITY', style: TextStyle(height: 3.0, fontSize: 14, fontWeight: FontWeight.bold,),  textAlign: TextAlign.center)),
                              Expanded(child: Text('TOTAL', style: TextStyle(height: 3.0, fontSize: 14, fontWeight: FontWeight.bold,),  textAlign: TextAlign.center)),
                            ]
                        ),
                        const Divider(
                          height: 3,
                        ),

                        SizedBox(
                  height: 100,
                          //color: Colors.grey,
                          child: ListView.builder(

                            itemCount: orderListData.lineItems?.length ?? 0, //data == null ? 0 : data.length,
                            itemBuilder: (BuildContext context, final int index) {
                              /*return InkWell(
                                onTap: () {
                                  //Navigator.push(  context, MaterialPageRoute( builder: (context) => APIDetailView(data[index])),);
                                },*/

                                return ListTile(
                                  //return new ListTile(
                                    onTap: null,                                        title: Row(
                                        children: <Widget>[
                                          Expanded(child: Text(" ${orderListData.lineItems?[index].name ?? "" }" , style:  TextStyle( fontSize: 10, fontWeight: FontWeight.normal, decoration: TextDecoration.underline,  decorationColor: Colors.blueAccent,), textAlign: TextAlign.start, ) ),
                                         // Expanded(child: Text("${orderListData.lineItems?[index].sku ?? "" }" , style:  TextStyle( fontSize: 10, fontWeight: FontWeight.normal,))),
                                          Expanded(child: Text("${orderListData.lineItems?[index].price ?? "" }" , style:  TextStyle( fontSize: 10, fontWeight: FontWeight.normal,),  textAlign: TextAlign.center)),
                                          Expanded(child: Text("${orderListData.lineItems?[index].quantity ?? "" }" , style:  TextStyle( fontSize: 10, fontWeight: FontWeight.normal,),  textAlign: TextAlign.center)),
                                          Expanded(child: Text("${orderListData.lineItems?[index].price ?? "" }" , style:  TextStyle( fontSize: 10, fontWeight: FontWeight.normal,),  textAlign: TextAlign.center)),
                                        ]
                                    )
                                );

                            //  );
                            }, //itemBuilder

                          ),
                        ),
                      //  ),
                      ]
                  )
              ),
              ],
              ),
              ),

             SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                  height: 200,
                  child: shippingAddressView(context),
              ),


              Container(
                width: MediaQuery.of(context).size.width - 10,
                height: 200,
                child: billingAddressViewAddressView(context),
              )


              //listItem(context),
              //listItem(context),
        ],
        ),
      ),
    ),



      ),
    );
  }


  //late Orders myOrderDetauils;
  Widget OredrItemsdetailsView(BuildContext context) {
    return Expanded(
      child: Container(
        margin: new EdgeInsets.fromLTRB(5, 0, 10, 0),
        //padding: EdgeInsets.all(5),
       // height: 700,
        child: Container(
        /*child: Card(
          elevation: 2,
         // margin: EdgeInsets.only(left: 5, right: 5), // color: CustomeColors.bodyBgColor,
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),  side: BorderSide(
            color: Colors.grey.shade50,
          ),),
          color: Colors.white,
*/


          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 25,
                //margin: EdgeInsets.all(2),
                //padding: EdgeInsets.all(2),
                child: InkWell(
                  onTap: () {
                    // _showDetailPage(addressList[index],'Edit Address');
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderPage(orderListData![index])));
                  },
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Container(
                      height:  160,



                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child:  OrderIDView(),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderItmsDetailsView("Fulfillment Status", "Unfulfilled"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderItmsDetailsView("Payment Status", "${orderListData.financialStatus}"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderItmsDetailsView("No of Items", "${orderListData.lineItems?.length}"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: OrderItmsDetailsView("Grand Total", "£${orderListData.totalPrice}"),
                      )
                    ],
                  ),
                    ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget OrderIDView() {
      return Container(
        //height: 40,
        alignment: Alignment.topLeft,
        child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${orderListData.name ?? ""}',  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Colors.blue),),

              Text("${orderListData.createdAt ?? ""} ",  style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: CustomeColors.blackColor),),
            ]),
      );

  }



  Widget OrderItmsDetailsView( String lableVal, String Value) {
    return Container(
      //height: 40,
      alignment: Alignment.topLeft,
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("$lableVal :",  style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: CustomeColors.blackColor),),

            Text("$Value ",  style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                color: CustomeColors.blackColor),),
          ]),

    );
  }




  Widget shippingAddressView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(left: 2, right: 2),
        clipBehavior: Clip.antiAlias,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.white,

        child:    Container(
              //width: MediaQuery.of(context).size.width - 100,
              margin: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    padding: EdgeInsets.all(2),
                    child: AddressViewLabel("Shipping Address"),
                  ),

                  Divider(
                    height: 3,
                  ),

                  Container(
                    padding: EdgeInsets.all(5),
                    child: AddressViewNameLabel("${orderListData.shippingAddress?.name}"),
                  ),

                  AddressUiView2(orderListData.shippingAddress?.company ?? ""),
                  AddressUiView2( "${orderListData.shippingAddress?.address1 ?? ""}, ${orderListData.shippingAddress?.address2 ?? ""} "),
                  AddressUiView2("${orderListData.shippingAddress?.city ?? ""}, ${orderListData.shippingAddress?.province ?? ""} "),
                  AddressUiView2("${orderListData.shippingAddress?.country ?? ""}, ${orderListData.shippingAddress?.provinceCode ?? ""}, ${orderListData.shippingAddress?.zip ?? ""}"),
                  AddressUiView2(orderListData.shippingAddress?.phone ?? ""),
                ],
              ),
            ),
      ),
    );
  }



  Widget billingAddressViewAddressView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(left: 2, right: 2),
        clipBehavior: Clip.antiAlias,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.white,

        child:    Container(
          //width: MediaQuery.of(context).size.width - 100,
          margin: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding: EdgeInsets.all(2),
                child: AddressViewLabel("Billing Address"),
              ),

              Divider(
                height: 3,
              ),

              Container(
                padding: EdgeInsets.all(5),
                child: AddressViewNameLabel("${orderListData.billingAddress?.name}"),
              ),
              AddressUiView2(orderListData.billingAddress?.company ?? ""),
              AddressUiView2( "${orderListData.billingAddress?.address1 ?? ""}, ${orderListData.billingAddress?.address2 ?? ""} "),
              AddressUiView2("${orderListData.billingAddress?.city ?? ""}, ${orderListData.billingAddress?.province ?? ""} "),
              AddressUiView2("${orderListData.billingAddress?.country ?? ""}, ${orderListData.billingAddress?.provinceCode ?? ""}, ${orderListData.billingAddress?.zip ?? ""}"),
              AddressUiView2(orderListData.billingAddress?.phone ?? ""),
            ],
          ),
        ),
      ),
    );
  }




  Text AddressViewLabel(String strVal) {
    return Text(strVal.toUpperCase() ,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      //fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: CustomeColors.blackColor,
                    ),
                  );
  }

  Text AddressViewNameLabel(String strVal) {
    return Text(
      strVal ,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
        color: CustomeColors.blackColor,
      ),
    );
  }

  Widget AddressUiView2(String labValue) {
    return Container(
        padding: EdgeInsets.all(2),
        //alignment: Alignment.topLeft,
        child: Text(
          "$labValue",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomeColors.blackColor, ),
        ));
  }



}