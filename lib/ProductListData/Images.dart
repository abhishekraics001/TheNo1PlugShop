import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Images {
  int? id;
  int? productId;
  //int? position;
  String? createdAt;
  String? updatedAt;
  String? alt;
  //int? width;
  //int? height;
  String? src;
  // List<int>? variantIds;
  String? adminGraphqlApiId;

  Images(
      {this.id,
      this.productId,
      //this.position,
      this.createdAt,
      this.updatedAt,
      this.alt,
      //this.width,
      //this.height,
      this.src,
      //this.variantIds,
      this.adminGraphqlApiId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    //position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    ////width = json['width'];
    //height = json['height'];
    src = json['src'];
    //variantIds = json['variant_ids'].cast<int>();
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    //data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['alt'] = this.alt;
    //data['width'] = this.width;
    //data['height'] = this.height;
    data['src'] = this.src;
    //data['variant_ids'] = this.variantIds;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}
