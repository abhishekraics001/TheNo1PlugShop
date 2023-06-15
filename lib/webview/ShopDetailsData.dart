class ShopDetailsData {
  Page? page;

  ShopDetailsData({this.page});

  ShopDetailsData.fromJson(Map<String, dynamic> json) {
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class Page {
  int? id;
  String? title;
  int? shopId;
  String? handle;
  String? bodyHtml;
  //Null? author;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? templateSuffix;
  String? adminGraphqlApiId;

  Page(
      {this.id,
      this.title,
      this.shopId,
      this.handle,
      this.bodyHtml,
      //this.author,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.templateSuffix,
      this.adminGraphqlApiId});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shopId = json['shop_id'];
    handle = json['handle'];
    bodyHtml = json['body_html'];
    //author = json['author'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['shop_id'] = this.shopId;
    data['handle'] = this.handle;
    data['body_html'] = this.bodyHtml;
    //data['author'] = this.author;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['published_at'] = this.publishedAt;
    data['template_suffix'] = this.templateSuffix;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}
