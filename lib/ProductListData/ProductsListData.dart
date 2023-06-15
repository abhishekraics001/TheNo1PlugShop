import 'Images.dart';
import 'Options.dart';
import 'Variants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class ProductsListData {

  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  String? templateSuffix;
  String? status;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  List<Variants>? variants;
  List<Options>? options;
  List<Images>? images;
  Images? image;
  int? cartQty = 1;
  String cartImage = "";

  ProductsListData(
      {this.id,
      this.title,
      this.bodyHtml,
      this.vendor,
      this.productType,
      this.createdAt,
      this.handle,
      this.updatedAt,
      this.publishedAt,
      this.templateSuffix,
      this.status,
      this.publishedScope,
      this.tags,
      this.adminGraphqlApiId,
      this.variants,
      this.options,
      this.images,
      this.image});

  ProductsListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

     if(json['body_html'] != null) {
      bodyHtml = json['body_html'];
    }

    if(json['vendor'] != null) {
      vendor = json['vendor'];
    }

    if(json['product_type'] != null) {
      productType = json['product_type'];
    }

    if(json['created_at'] != null) {
      createdAt = json['created_at'];
    }

    if(json['handle'] != null) {
      handle = json['handle'];
    }

    if(json['updated_at'] != null) {
      updatedAt = json['updated_at'];
    }

    if(json['published_at'] != null) {
      publishedAt = json['published_at'];
    }

    if(json['template_suffix'] != null) {
      templateSuffix = json['template_suffix'];
    }

    if(json['status'] != null) {
      status = json['status'];
    }

    if(json['published_scope'] != null) {
      publishedScope = json['published_scope'];
    }

    if(json['tags'] != null) {
      tags = json['tags'];
    }


    if(json['admin_graphql_api_id'] != null) {
      adminGraphqlApiId = json['admin_graphql_api_id'];
    }



    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }

    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }





    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
      data['body_html'] = this.bodyHtml;

    if(this.vendor != null) {
      data['vendor'] = this.vendor;
    }

    if(this.productType != null) {
      data['product_type'] = this.productType;
    }

    if(this.createdAt != null) {
      data['created_at'] = this.createdAt;
    }

    if(this.handle != null) {
      data['handle'] = this.handle;
    }

    if(this.updatedAt != null) {
      data['updated_at'] = this.updatedAt;
    }

    if(this.publishedAt != null) {
      data['published_at'] = this.publishedAt;
    }

    if(this.templateSuffix != null) {
      data['template_suffix'] = this.templateSuffix;
    }

    if(this.status != null) {
      data['status'] = this.status;
    }

    if(this.publishedScope != null) {
      data['published_scope'] = this.publishedScope;
    }

    if(this.tags != null) {
      data['tags'] = this.tags;
    }

   if ( this.adminGraphqlApiId != null){
      data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    }



    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }


    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }



    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }



}
