import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:theplugshop/ProductListData/ProductsListData.dart';
import 'package:theplugshop/Utility/SharePrefHelper.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';
import 'package:theplugshop/shopifypkg/flutter_simple_shopify.dart';
import 'package:theplugshop/shopifypkg/models/src/order/discount_allocations/discount_allocations.dart';
import 'package:theplugshop/shopifypkg/models/src/product/price_v_2/price_v_2.dart';
import 'package:theplugshop/shopifypkg/models/src/shopify_user/address/address.dart';
import 'models/src/shop/payment_settings/payment_settings.dart';
import 'models/src/shop/primary_domain/primary_domain.dart';
import 'models/src/shop/privacy_policy/privacy_policy.dart';
import 'models/src/shop/refund_policy/refund_policy.dart';
import 'models/src/shop/terms_of_service/terms_of_service.dart';

Future<void> fetchProducts2() async {
  try {
    final shopifyStore = ShopifyStore.instance;
    final bestSellingProducts = await shopifyStore.getNProducts(6,
        sortKey: SortKeyProduct.BEST_SELLING);
    /*if (mounted) {
      setState(() {
        products = bestSellingProducts;
        _isLoading = false;
      });
    }
    */
    debugPrint('_fetchProducts shopDetails storeName: ${bestSellingProducts}');
  } catch (e) {
    debugPrint(e.toString());
  }
}


Future<String> fetchProductFromStoreyCollectionID() async {
  try {
    final shopifyStore = ShopifyStore.instance;
    final Future<List<Product>> bestSellingProducts = shopifyStore.getAllProductsFromCollectionById("378458734814"); //await shopifyStore.getNProducts(6,sortKey: SortKeyProduct.BEST_SELLING);
    /*if (mounted) {
      setState(() {
        products = bestSellingProducts;
        _isLoading = false;
      });
    }
    */
    debugPrint('_fetchProducts shopDetails storeName: ${bestSellingProducts}');
    return "Sucess";
  } catch (e) {
    debugPrint(e.toString());
    return "Error";

  }
}

Future<void> fetchProducts() async {
  try {
    /*
    final shopifyStore = ShopifyStore.instance;

    //For get Shop Details
    Shop shopDetails = await shopifyStore.getShop();
    //if (mounted) {
    String? storeName = shopDetails.name;
    debugPrint('_fetchProducts shopDetails storeName: ${storeName}');
    //}

    //For get Collection List
    List<Collection> collectionsList = await shopifyStore.getAllCollections();
    //if (mounted) {
    int plenght = collectionsList.length;
    debugPrint('_fetchProducts collectionsList  lenght: ${plenght}');
    for (int i = 0; i < collectionsList.length; i++) {
      debugPrint(
          '_fetchProducts collectionsList  Name: ${collectionsList[i].title}');
    }
    // }

    //For gte N Product
    try {
      //  List<Product>? productList = await shopifyStore.getAllProducts();
      List<Product>? productList = await shopifyStore.getNProducts(100);
      //if (mounted) {
      int? plenght = -10;
      plenght = productList?.length;
      debugPrint('_fetchProducts productList product lenght: ${plenght}');
      //}
    } catch (ex) {
      debugPrint('_fetchProducts Exception productList produc');
    }

*/

    /*
      ShopifyAuth shopifyAuth = ShopifyAuth.instance;
      Future<ShopifyUser> createUserWithEmailAndPassword({@required String email, @required String password})
      Future<void> signOutCurrentUser()
      Future<void> sendPasswordResetEmail({@required String email})
      Future<ShopifyUser> signInWithEmailAndPassword({@required String email, @required String password})
      Future<ShopifyUser> currentUser()
    */

    debugPrint('_fetchProducts before:');
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    //For Usres SignIn
    ShopifyUser users = await shopifyAuth.signInWithEmailAndPassword(
        email: 'mappsdeveloper1991@gmail.com', password: 'Raics001');
    //if (mounted) {
    debugPrint(
        '_fetchProducts ShopifyAuth users Name: ${users.id} , Name: ${users.displayName}');
    //}

    //For users Signup
    ShopifyUser signup = await shopifyAuth.createUserWithEmailAndPassword(
        firstName: 'Abhishek New',
        lastName: 'Rai',
        email: 'mappsdeveloper9999@gmail.com',
        password: 'Raics001');
    //if (mounted) {
    debugPrint(
        '_fetchProducts ShopifyAuth signup Name: ${signup.id} , Name: ${signup.displayName}');
    //}

  } catch (e) {
    debugPrint('_fetchProducts Exception 1: ${e.toString()}');
  }

  debugPrint('_fetchProducts before:');
}

Future<ShopifyUser> validateLooginAPI(
    String userEmailID, String userPassword) async {
  try {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    ShopifyUser users = await shopifyAuth.signInWithEmailAndPassword(
        email: userEmailID, password: userPassword);
    debugPrint(
        'ShopifyAPICall validateLooginAPI: id: ${users.id} , Name: ${users.displayName}');
    return users;
  } catch (e) {
    debugPrint('ShopifyAPICall validateLooginAPI Exception 1: ${e.toString()}');
    throw Exception('Error');
  }
}

Future<ShopifyUser> signupUser(
    String firstName, String lastName, String emailID, String password) async {
  try {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    ShopifyUser users = await shopifyAuth.createUserWithEmailAndPassword(
        firstName: firstName,
        lastName: lastName,
        email: emailID,
        password: password);
    debugPrint(
        'ShopifyAPICall signupUser: id: ${users.id} , Name: ${users.displayName}');
    return users;
  } catch (e) {
    debugPrint('ShopifyAPICall signupUser 1: ${e.toString()}');
    throw Exception('Error');
  }
}

Future<String> createUserAccessTocken() async {
  try {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    String? userAccesstocken = await shopifyAuth.currentCustomerAccessToken;
    debugPrint(
        'ShopifyAPICall createUserAccessTocken userAccesstocken: ${userAccesstocken} ');
    return userAccesstocken ?? "";
  } catch (e) {
    debugPrint('ShopifyAPICall createUserAccessTocken Exception 1: ${e.toString()}');
    throw Exception('Error');
  }
}

String shopStatus = '';
String? shopDescription;
String? shopMoneyFormat;
String? shopName;
PaymentSettings? shopPaymentSettings;
PrimaryDomain? shopPrimaryDomain;
PrivacyPolicy? shopPrivacyPolicy;
RefundPolicy? shopRefundPolicy;
List<String>? shopShipsToCountries;
TermsOfService? shopTermsOfService;

Future<String> getShopDetails() async {
  try {
    ShopifyStore shopifyStore = ShopifyStore.instance;
    await shopifyStore
        .getShop()
        .then((value) => {
              shopStatus = 'Success',
              shopName = value.name,
              shopDescription = value.description,
              shopMoneyFormat = value.moneyFormat,
              debugPrint('ShopifyAPICall getShopDetails shopName ==== ${shopName}'),
              debugPrint(
                  'ShopifyAPICall getShopDetails  shopDescription==== ${shopDescription}'),
              debugPrint(
                  'ShopifyAPICall getShopDetails shopMoneyFormat==== ${shopMoneyFormat}'),
              shopPaymentSettings = value.paymentSettings as PaymentSettings?,
              shopPrimaryDomain = value.primaryDomain as PrimaryDomain?,
              shopShipsToCountries = value.shipsToCountries,
              shopPrivacyPolicy = value.privacyPolicy as PrivacyPolicy?,
              shopRefundPolicy = value.refundPolicy as RefundPolicy?,
              shopTermsOfService = value.termsOfService as TermsOfService?,
            })
        .catchError((error) => {
              shopStatus = 'Error',
              debugPrint('getShopDetails getShopDetails Error Exceptions 1: $error'),
            });
    return 'Success';
  } catch (e) {
    debugPrint('getShopDetails getShopDetails Exception 1: ${e.toString()}');
    shopStatus = 'error';
    throw Exception('Exception');
  }
}

Future<Address> addUserAddress(
    String address1,
    String address2,
    String company,
    String city,
    String country,
    String firstName,
    String lastName,
    String phone,
    String province,
    String zip,
    String customerAccessToken) async {
  try {
    ShopifyCustomer shopifyCustomer = ShopifyCustomer.instance;
    Address addedAddress = await shopifyCustomer.customerAddressCreate(
        address1: address1,
        address2: address2,
        company: company,
        city: city,
        country: country,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        province: province,
        zip: zip,
        customerAccessToken: customerAccessToken);
    debugPrint('ShopifyAPICall addUserAddress: ${addedAddress} ');
    return addedAddress;
  } catch (e) {
    debugPrint('ShopifyAPICall addUserAddress Exception 1: ${e.toString()}');
    throw Exception('Error');
  }
}

Future<String> updateAddUserAddress(
    String address1,
    String address2,
    String company,
    String city,
    String country,
    String firstName,
    String lastName,
    String phone,
    String province,
    String zip,
    String customerAccessToken,
    String addressId) async {
  try {
    ShopifyCustomer shopifyCustomer = ShopifyCustomer.instance;
    var addedAddress = await shopifyCustomer.customerAddressUpdate(
        address1: address1,
        address2: address2,
        company: company,
        city: city,
        country: country,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        province: province,
        zip: zip,
        customerAccessToken: customerAccessToken,
        id: addressId);
    debugPrint('ShopifyAPICall updateAddUserAddress:');
    return "success";
  } catch (e) {
    debugPrint('ShopifyAPICall addUserAddress Exception 1: ${e.toString()}');
    throw Exception('Error');
  }
}

Future<String> deleteAddUserAddress(
    String customerAccessToken, String addressId) async {
  try {
    ShopifyCustomer shopifyCustomer = ShopifyCustomer.instance;
    var addedAddress = await shopifyCustomer.customerAddressDelete(
        customerAccessToken: customerAccessToken, addressId: "8028022014174");
    debugPrint('ShopifyAPICall updateAddUserAddress:');
    return "success";
  } catch (e) {
    debugPrint('ShopifyAPICall addUserAddress Exception 1: ${e.toString()}');
    throw Exception('Error');
  }
}

Future<List<Order>?> getMyOrderList(String cusAccToken) async {
  try {
    ShopifyCheckout shopifyCheckout = ShopifyCheckout.instance;
    List<Order>? oredrListX = await shopifyCheckout.getAllOrders(cusAccToken,
        sortKey: SortKeyOrder.PROCESSED_AT);
    debugPrint(
        'ShopifyAPICall getMyOrderList: ${oredrListX?.length}  oredrList: $oredrListX');
    return oredrListX;
  } catch (e) {
    debugPrint('ShopifyAPICall getMyOrderList Exception 1: ${e.toString()}');
    throw Exception('Error');
  }
}




Future<String> createCheckoutWithWebPaymentURL(Addresses shipingAddressX, List<ProductsListData> cartProductListGlobalX) async {
  List<LineItem>? lineItems = [];
  String checkOutID ='';
  String webPaymentURL = "";
  ShopifyCheckout shopifyCheckout = ShopifyCheckout.instance;

  /*
   String? id,
    String? address1,
    String? address2,
    String? city,
    String? company,
    String? country,
    String? countryCode,
    String? firstName,
    String? lastName,
    String? formattedArea,
    String? latitude,
    String? longitude,
    String? name,
    String? phone,
    String? province,
    String? provinceCode,
    String? zip,

    "default_address": {
            "id": 8186069483742,
            "customer_id": 6487203283166,
            "first_name": "Abhishek",
            "last_name": "Rai",
            "company": "ThePlugShop Developer",
            "address1": "HN: 115",
            "address2": "Sec: 5",
            "city": "Ab Kettleby",
            "province": "England",
            "country": "United Kingdom",
            "zip": "LE14 ",
            "phone": "8899776655",
            "name": "Abhishek Rai",
            "province_code": "ENG",
            "country_code": "GB",
            "country_name": "United Kingdom",
            "default": true
        }
   */


  /*
  Address mailingAddress = Address(
      id: '8186069483742',
      address1: '47 Sunningdale Road',
      address2: 'Scunthorpe',
      city: 'Scunthorpe',
      company: 'ThePlugShop Developer',
      country: 'United Kingdom',
      countryCode: 'GB',
      firstName: 'Abhishek',
      lastName: 'Rai',
      formattedArea: '',
      latitude: '53.557888',
      longitude: '-0.673576',
      name: 'Abhishek Rai',
      phone: '8899776655',
      province: 'England',
      provinceCode: 'ENG',
      zip: 'DN17 2TA');

      */



  /*
  factory LineItem({
    required String title,
    required int quantity,
    required List<DiscountAllocations> discountAllocations,
    @Default([]) List<Attribute> customAttributes,
    String? variantId,
    String? id,
    ProductVariantCheckout? variant,
  }
   */

  /*
  "variants": [
                {
                    "id": 43310746960094,
                    "product_id": 7769985024222,
                    "title": "Apple Blackcurrant Pear / 0mg",
                    "price": "16.00",
                    "sku": null,
                    "position": 1,
                    "inventory_policy": "deny",
                    "compare_at_price": null,
                    "fulfillment_service": "manual",
                    "inventory_management": "shopify",
                    "option1": "Apple Blackcurrant Pear",
                    "option2": "0mg",
                    "option3": null,
                    "created_at": "2022-08-23T22:03:39+01:00",
                    "updated_at": "2022-08-23T23:23:34+01:00",
                    "taxable": true,
                    "barcode": null,
                    "grams": 0,
                    "image_id": 37890728362206,
                    "weight": 0.0,
                    "weight_unit": "lb",
                    "inventory_item_id": 45405960634590,
                    "inventory_quantity": 100,
                    "old_inventory_quantity": 100,
                    "requires_shipping": true,
                    "admin_graphql_api_id": "gid://shopify/ProductVariant/43310746960094"
                }
   */

  Address mailingAddress = Address(
      id: '${shipingAddressX.id}',
      address1: '${shipingAddressX.address1}',
      address2: '${shipingAddressX.address2}',
      city: '${shipingAddressX.city}',
      company: '${shipingAddressX.company}',
      country: '${shipingAddressX.countryName}',
      countryCode: '${shipingAddressX.countryCode}',
      firstName: '${shipingAddressX.firstName}',
      lastName: '${shipingAddressX.lastName}',
      formattedArea: '',
      latitude: '53.557888',
      longitude: '-0.673576',
      name: '${shipingAddressX.firstName} ${shipingAddressX.lastName}',
      phone: '${shipingAddressX.phone}',
      province: '${shipingAddressX.province}',
      provinceCode: '${shipingAddressX.provinceCode}',
      zip: '${shipingAddressX.zip}');





/*

  PriceV2 priceV2 = PriceV2(amount: 16.00, currencyCode: '£');
  DiscountAllocations discountAllocation =
      DiscountAllocations(allocatedAmount: priceV2);

  List<DiscountAllocations> discountAllocations = [];
  discountAllocations.add(discountAllocation);

  //Optional Attribute
  List<Attribute> customAttributes = [];
  Attribute attribute =
      Attribute(key: 'This Cart Attribute', value: 'This Cart Attribute Value');
  customAttributes.add(attribute);



  LineItem lineItem = LineItem(
      title: '3 Fruits 10ML E-Liquid (Pack of 10)',
      quantity: 5,
      discountAllocations: discountAllocations,
      customAttributes: customAttributes,
      variantId: 'gid://shopify/ProductVariant/43310746960094',
      id: "7769985024222");


  lineItems.add(lineItem);
*/


  for (var _cartItems in cartProductListGlobalX) {
    var variantsItems = _cartItems.variants![0];

    var vPrice =  double.parse(variantsItems.price ?? "0.0");
    PriceV2 priceV2 = PriceV2(amount: vPrice, currencyCode: '£');

    DiscountAllocations discountAllocation =
    DiscountAllocations(allocatedAmount: priceV2);

    List<DiscountAllocations> discountAllocations = [];
    discountAllocations.add(discountAllocation);

    //Optional Attribute
    List<Attribute> customAttributes = [];
    Attribute attribute =
    Attribute(key: 'This Cart Attribute', value: 'This Cart Attribute Value');
    customAttributes.add(attribute);


    LineItem lineItem = LineItem(
        title: '${_cartItems.title}',
        quantity: _cartItems.cartQty ?? 1,
        discountAllocations: discountAllocations,
        customAttributes: customAttributes,
        variantId: '${variantsItems.adminGraphqlApiId}',
        id: "${variantsItems.productId}");

    lineItems.add(lineItem);
  }




  try {
    Checkout checkout = await shopifyCheckout.createCheckout(lineItems: lineItems);
    checkOutID =  checkout.id;
    debugPrint(
        'ShopifyAPICall createCheckout response  id: ${checkout.id}  totalPriceV2: ${checkout.totalPriceV2}  subtotalPriceV2: ${checkout.subtotalPriceV2}  orderStatusUrl: ${checkout.orderStatusUrl}  shopifyPaymentsAccountId: ${checkout.shopifyPaymentsAccountId} toJson: ${checkout.toJson()} ');
  } catch (e) {
    debugPrint('ShopifyAPICall createCheckout Exception 1: ${e.toString()}');
    throw Exception('Error');
  }





  /*
   //For update checkout line items
  try {
    lineItems.clear();
    lineItems.add(lineItem2);
    Checkout checkout =
    await shopifyCheckout.addLineItemsToCheckout(checkoutId: checkOutID, lineItems: lineItems);
    debugPrint(
        'ShopifyAPICall createCheckout response 22 update id: ${checkout.id}  totalPriceV2: ${checkout.totalPriceV2}  subtotalPriceV2: ${checkout.subtotalPriceV2}  orderStatusUrl: ${checkout.orderStatusUrl}  shopifyPaymentsAccountId: ${checkout.shopifyPaymentsAccountId} toJson: ${checkout.toJson()} ');
  } catch (e) {
    debugPrint('ShopifyAPICall createCheckout Exception 22 update : ${e.toString()}');
    throw Exception('Error');
  }
  */





  //For mapped shipping address with  Checkout ID

  try {
    Checkout checkout = await shopifyCheckout.shippingAddressUpdate(checkOutID, mailingAddress);
    webPaymentURL =  checkout.webUrl ?? "";
    debugPrint(
        'ShopifyAPICall createCheckout response 33 shippingAddressUpdate  id: ${checkout.id}  totalPriceV2: ${checkout.totalPriceV2}  subtotalPriceV2: ${checkout.subtotalPriceV2}  orderStatusUrl: ${checkout.orderStatusUrl}  webUrl:${checkout.webUrl} shopifyPaymentsAccountId: ${checkout.shopifyPaymentsAccountId} toJson: ${checkout.toJson()} ');
  } catch (e) {
    debugPrint('ShopifyAPICall createCheckout Exception 33 shippingAddressUpdate : ${e.toString()}');
    throw Exception('Error with shipping address update');
  }




//For mapped Checkout with customers
  try {
     await shopifyCheckout.checkoutCustomerAssociate(checkOutID, userAccessTockenVal);
     debugPrint('ShopifyAPICall createCheckout response checkoutCustomerAssociate : ');
  } catch (e) {
    debugPrint('ShopifyAPICall createCheckout checkoutCustomerAssociate 44 : ${e.toString()}');
    throw Exception('Error with customers associate with order');
  }

/*


//var checkOutIDx =  "gid://shopify/Checkout/2aac0323e58b11701f350554a5365a7f?key=84e84da9f2732822a288fb21574981d8";
  try {
    await shopifyCheckout.checkoutCustomerAssociate(checkOutID, userAccessTockenVal);
    //debugPrint( 'ShopifyAPICall createCheckout response 22  id: ${checkout.id}  totalPriceV2: ${checkout.totalPriceV2}  subtotalPriceV2: ${checkout.subtotalPriceV2}  orderStatusUrl: ${checkout.orderStatusUrl}  shopifyPaymentsAccountId: ${checkout.shopifyPaymentsAccountId} toJson: ${checkout.toJson()} ');
    debugPrint('ShopifyAPICall createCheckout response 44 : ');
  } catch (e) {
    debugPrint('ShopifyAPICall createCheckout Exception 44 : ${e.toString()}');
    throw Exception('Error');
  }
*/



//https://theno1plugshop.myshopify.com/60653175006/checkouts/45b149b6cb2c6d16a49692148377492c/recover?key=cd8ebac7c07eea31650ebedfe2d34cad
  // App: id: gid://shopify/Checkout/2aac0323e58b11701f350554a5365a7f?key=84e84da9f2732822a288fb21574981d8  totalPriceV2: PriceV2(amount: 16.0, currencyCode: GBP)  subtotalPriceV2: PriceV2(amount: 16.0, currencyCode: GBP)  orderStatusUrl: null  shopifyPaymentsAccountId: null toJson: {id: gid://shopify/Checkout/2aac0323e58b11701f350554a5365a7f?key=84e84da9f2732822a288fb21574981d8, ready: true, availableShippingRates: null, createdAt: 2022-12-30T16:17:38Z, currencyCode: GBP, totalTaxV2: PriceV2(amount: 0.0, currencyCode: GBP), totalPriceV2: PriceV2(amount: 16.0, currencyCode: GBP), taxesIncluded: true, taxExempt: false, subtotalPriceV2: PriceV2(amount: 16.0, currencyCode: GBP), requiresShipping: true, appliedGiftCards: [], lineItems: [LineItem(title: 3 Fruits 10ML E-Liquid (Pack of 10), quantity: 1, discountAllocations: [], customAttributes: [], variantId: null, id: gid://shopify/CheckoutLineItem/433107469600940?checkout=2aac0323e58b11701f350554a5365a7f, variant: ProductVariantCh
  //Web: https://theno1plugshop.myshopify.com/60653175006/checkouts/2aac0323e58b11701f350554a5365a7f/recover?key=84e84da9f2732822a288fb21574981d8




  return webPaymentURL;

}
