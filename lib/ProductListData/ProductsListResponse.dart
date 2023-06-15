import 'package:freezed_annotation/freezed_annotation.dart';

import 'ProductsListData.dart';

@JsonSerializable()
class ProductsListResponse {
  List<ProductsListData>? products;

  ProductsListResponse({this.products});

  ProductsListResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsListData>[];
      json['products'].forEach((v) {
        products!.add(new ProductsListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
