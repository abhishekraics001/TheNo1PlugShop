import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:theplugshop/ProductListData/ProductsListData.dart';
import 'package:theplugshop/ProductListData/ProductsListResponse.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';
import 'package:theplugshop/myorder/OrderListData.dart';
import 'package:theplugshop/webview/ShopDetailsData.dart';
import 'Album.dart';

String baseURL_ADMIN = 'https://theno1plugshop.myshopify.com/admin/api/2022-10';
String accessToken = "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";
String authorizationKey = 'fc75f9670c25cf20a8c12cf314596818';
String authorizationValue = 'd48053a1be3d5d10df78d55189f6a202';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  print('data 01 ${response.reasonPhrase}');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('data 02 ${jsonDecode(response.body)}');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print('data 03 ');
    throw Exception('Failed to load album');
  }
}

Future<void> fetchAlbum2() async {
  final headers = <String, String>{
    'X-Shopify-Access-Token': accessToken,
    authorizationKey: authorizationValue,
    'Cookie':
        '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
  };

  final request =
      http.Request('GET', Uri.parse('$baseURL_ADMIN/customers.json'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print('data 11 ${response.reasonPhrase}');

    final xx = await response.stream.bytesToString();
    print('data 12 ${xx}');

    final responseJson = jsonDecode(xx);
    print('data 13 ${responseJson}');

    //ProductsListResponse productsListResponse = ProductsListResponse.fr
  } else {
    print('data 4 ${response.reasonPhrase}');
  }
}

Future<ShopDetailsData> getShopDetailsData(String pageNameOrNo) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
    };

    var headers2 = {
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
    };

    var urlx = '$baseURL_ADMIN/pages/$pageNameOrNo.json';
    print("httpRequest getShopDetailsData Request URL $urlx");

    var request = http.Request(
        'GET', Uri.parse('$baseURL_ADMIN//pages/$pageNameOrNo.json'));
    request.headers.addAll(headers2);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getShopDetailsData Response sucess: ${value}');

      var data = ShopDetailsData.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data;
    } else {
      print(
          'httpRequest getShopDetailsData Response: => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getShopDetailsData Response: => Error is comming: ${e}');
    throw Exception('Error');
  }
}

/*
Future<List<ProductsListData>?> getTrendingProductList(String noOfItems) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'sort-by': 'best-selling',
      'status': 'active',
      'product_type': 'DISPOSABLE PODS',
      'limit': '${noOfItems}',
      'collection_id': ''
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");

    var request = http.Request('GET', finalUri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getTrendingProductList => Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}*/

Future<List<ProductsListData>?> getTrendingProductList(String noOfItems) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'sort_by': 'price-ascending',//'best-selling', price-ascending
      'status': 'active',
      'product_type': 'DISPOSABLE PODS', //'Disposable Pod Kit', //'DISPOSABLE PODS',
      'limit': '${noOfItems}',
      'vendor': '',
      'tag': 'Disposable Pod Kit'
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");
    var request = http.Request('GET', finalUri);

    /*
    Uri uri = Uri.parse('https://theno1plugshop.myshopify.com//admin/api/2023-01/collections/378458734814/products.json?');

    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
*/


    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getTrendingProductList => Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}


/*
Future<List<ProductsListData>?> getTrendingProductList2(
    String noOfItems) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'sort-by': 'best-selling',
      'status': 'active',
      'product_type': 'DISPOSABLE PODS',
      'limit': '${noOfItems}',
      'collection_id': ''
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");

    var request = http.Request('GET', finalUri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print(
          'httpRequest getTrendingProductList => Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}

Future<List<ProductsListData>?> getRelatedProductListXXXXX(
    String noOfItems, String pID, String pType) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'sort-by': 'best-selling',
      'status': 'active',
      'product_type': '$pType',
      'limit': '${noOfItems}',
      'product_id': '$pID',
      'intent': 'related'
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");

    var request = http.Request('GET', finalUri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print(
          'httpRequest getTrendingProductList => Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}

Future<List<ProductsListData>?> getProductListItems2(
    String collectionID,
    String productType,
    String venderName,
    String collectiontag,
    String noOfItems) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'collection_id': collectionID,
      'product_type': productType,
      'vendor': venderName,
      'tag': collectiontag,
      'limit': noOfItems,
      'sort-by': 'best-selling',
      'status': 'active',
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getProductListItems Request URL $uri");

    var request = http.Request('GET', finalUri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getProductListItems=> Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getProductListItems => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getProductListItems => Error is comming: ${e}');
    throw Exception('Error');
  }
}
*/



Future<List<ProductsListData>?> getProductListItems(
    String productType,
    String venderbBrandName,
    String collectionTag) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
      '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'product_type': productType,
      'vendor': venderbBrandName,
      'tag': collectionTag,
      'limit': '250',
      'sort-by': 'best-selling',
      'status': 'active',
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getProductListItems Request URL $uri");

    var request = http.Request('GET', finalUri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getProductListItems=> Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getProductListItems => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getProductListItems => Error is comming: ${e}');
    throw Exception('Error');
  }
}

Future<Customer?> getProfileDetails(String customersID) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/customers/$customersID.json');
    print("httpRequest getProfileDetails Request URL $uri");

    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getProfileDetails => Success is comming: ${value}');

      var data = UserProfileDeatils.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.customer;
    } else {
      print('httpRequest getProfileDetails => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getProfileDetails => Error is comming: ${e}');
    throw Exception('Error');
  }
}

Future<List<Orders>?> getOrderListData(String customersID) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Uri uri = Uri.parse(
        '$baseURL_ADMIN/orders.json?customer_id=$customersID&status=any');
    print("httpRequest getOrderListData Request URL $uri");

    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getOrderListData => Success is comming: ${value}');

      var data = OrderListData.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.orders;
    } else {
      print('httpRequest getOrderListData => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getOrderListData => Error is comming: ${e}');
    throw Exception('Error');
  }
}
