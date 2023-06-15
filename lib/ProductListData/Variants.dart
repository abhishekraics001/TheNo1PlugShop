import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Variants {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  //Double? position;
  String? inventoryPolicy;
  String? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  String? option2;
  //Null? option3;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  String? barcode;
  /*int? grams;
  int? imageId;
  int? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity; */
  bool? requiresShipping;
  String? adminGraphqlApiId;

  Variants(
      {this.id,
      this.productId,
      this.title,
      this.price,
      this.sku,
      //this.position,
      this.inventoryPolicy,
      this.compareAtPrice,
      this.fulfillmentService,
      this.inventoryManagement,
      this.option1,
      //this.option2,
      //this.option3,
      this.createdAt,
      this.updatedAt,
      this.taxable,
      this.barcode,
      /*  this.grams,
      this.imageId,
      this.weight,
      this.weightUnit,
      this.inventoryItemId,
      this.inventoryQuantity,
      this.oldInventoryQuantity, */
      this.requiresShipping,
      this.adminGraphqlApiId});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    //position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    compareAtPrice = json['compare_at_price'];
    fulfillmentService = json['fulfillment_service'];
    inventoryManagement = json['inventory_management'];
    option1 = json['option1'];
    // option2 = json['option2'];
    //option3 = json['option3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    /* grams = json['grams'];
    imageId = json['image_id'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
    inventoryQuantity = json['inventory_quantity'];
    oldInventoryQuantity = json['old_inventory_quantity']; */
    requiresShipping = json['requires_shipping'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['sku'] = this.sku;
    //data['position'] = this.position;
    data['inventory_policy'] = this.inventoryPolicy;
    data['compare_at_price'] = this.compareAtPrice;
    data['fulfillment_service'] = this.fulfillmentService;
    data['inventory_management'] = this.inventoryManagement;
    data['option1'] = this.option1;
    //data['option2'] = this.option2;
    //data['option3'] = this.option3;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['taxable'] = this.taxable;
    data['barcode'] = this.barcode;
    /*  data['grams'] = this.grams;
    data['image_id'] = this.imageId;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['inventory_item_id'] = this.inventoryItemId;
    data['inventory_quantity'] = this.inventoryQuantity;
    data['old_inventory_quantity'] = this.oldInventoryQuantity; */
    data['requires_shipping'] = this.requiresShipping;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}
