import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class UserProfileDeatils {
  Customer? customer;

  UserProfileDeatils({this.customer});

  UserProfileDeatils.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? email;
  bool? acceptsMarketing;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  int? ordersCount;
  String? state;
  String? totalSpent;
  //Null? lastOrderId;
  //Null? note;
  bool? verifiedEmail;
  //Null? multipassIdentifier;
  bool? taxExempt;
  String? tags;
  //Null? lastOrderName;
  String? currency;
  //Null? phone;
  List<Addresses>? addresses;
  String? acceptsMarketingUpdatedAt;
  String? marketingOptInLevel;
  //List<Null>? taxExemptions;
  EmailMarketingConsent? emailMarketingConsent;
  //Null? smsMarketingConsent;
  String? adminGraphqlApiId;
  Addresses? defaultAddress;

  //Customer({this.id, this.email, this.acceptsMarketing, this.createdAt, this.updatedAt, this.firstName, this.lastName, this.ordersCount, this.state, this.totalSpent, this.lastOrderId, this.note, this.verifiedEmail, this.multipassIdentifier, this.taxExempt, this.tags, this.lastOrderName, this.currency, this.phone, this.addresses, this.acceptsMarketingUpdatedAt, this.marketingOptInLevel, this.taxExemptions, this.emailMarketingConsent, this.smsMarketingConsent, this.adminGraphqlApiId, this.defaultAddress});
  Customer({this.id, this.email, this.acceptsMarketing, this.createdAt, this.updatedAt, this.firstName, this.lastName, this.ordersCount, this.state, this.totalSpent, this.verifiedEmail, this.taxExempt, this.tags, this.currency,  this.addresses, this.acceptsMarketingUpdatedAt, this.marketingOptInLevel, this.emailMarketingConsent,  this.adminGraphqlApiId, this.defaultAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    acceptsMarketing = json['accepts_marketing'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    ordersCount = json['orders_count'];
    state = json['state'];
    totalSpent = json['total_spent'];
    //lastOrderId = json['last_order_id'];
    //note = json['note'];
    verifiedEmail = json['verified_email'];
   // multipassIdentifier = json['multipass_identifier'];
    taxExempt = json['tax_exempt'];
    tags = json['tags'];
    //lastOrderName = json['last_order_name'];
    currency = json['currency'];
    //phone = json['phone'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) { addresses!.add(new Addresses.fromJson(v)); });
    }
    acceptsMarketingUpdatedAt = json['accepts_marketing_updated_at'];
    marketingOptInLevel = json['marketing_opt_in_level'];
    if (json['tax_exemptions'] != null) {
      //taxExemptions = <Null>[];
      //json['tax_exemptions'].forEach((v) { taxExemptions!.add(new Null.fromJson(v)); });
    }
    emailMarketingConsent = json['email_marketing_consent'] != null ? new EmailMarketingConsent.fromJson(json['email_marketing_consent']) : null;
   // smsMarketingConsent = json['sms_marketing_consent'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    defaultAddress = json['default_address'] != null ? new Addresses.fromJson(json['default_address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['accepts_marketing'] = this.acceptsMarketing;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['orders_count'] = this.ordersCount;
    data['state'] = this.state;
    data['total_spent'] = this.totalSpent;
    //data['last_order_id'] = this.lastOrderId;
    //data['note'] = this.note;
    data['verified_email'] = this.verifiedEmail;
    //data['multipass_identifier'] = this.multipassIdentifier;
    data['tax_exempt'] = this.taxExempt;
    data['tags'] = this.tags;
    //data['last_order_name'] = this.lastOrderName;
    data['currency'] = this.currency;
    //data['phone'] = this.phone;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['accepts_marketing_updated_at'] = this.acceptsMarketingUpdatedAt;
    data['marketing_opt_in_level'] = this.marketingOptInLevel;
   /* if (this.taxExemptions != null) {
      data['tax_exemptions'] = this.taxExemptions!.map((v) => v.toJson()).toList();
    }*/
    if (this.emailMarketingConsent != null) {
      data['email_marketing_consent'] = this.emailMarketingConsent!.toJson();
    }
    //data['sms_marketing_consent'] = this.smsMarketingConsent;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.defaultAddress != null) {
      data['default_address'] = this.defaultAddress!.toJson();
    }
    return data;
  }
}

class Addresses {
  int? id;
  int? customerId;
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? province;
  String? country;
  String? zip;
  String? phone;
  String? name;
  String? provinceCode;
  String? countryCode;
  String? countryName;
  bool? defaultAddress;

  Addresses({this.id, this.customerId, this.firstName, this.lastName, this.company, this.address1, this.address2, this.city, this.province, this.country, this.zip, this.phone, this.name, this.provinceCode, this.countryCode, this.countryName, this.defaultAddress});

Addresses.fromJson(Map<String, dynamic> json) {
id = json['id'];
customerId = json['customer_id'];
firstName = json['first_name'];
lastName = json['last_name'];
company = json['company'];
address1 = json['address1'];
address2 = json['address2'];
city = json['city'];
province = json['province'];
country = json['country'];
zip = json['zip'];
phone = json['phone'];
name = json['name'];
provinceCode = json['province_code'];
countryCode = json['country_code'];
countryName = json['country_name'];
defaultAddress = json['default'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['customer_id'] = this.customerId;
  data['first_name'] = this.firstName;
  data['last_name'] = this.lastName;
  data['company'] = this.company;
  data['address1'] = this.address1;
  data['address2'] = this.address2;
  data['city'] = this.city;
  data['province'] = this.province;
  data['country'] = this.country;
  data['zip'] = this.zip;
  data['phone'] = this.phone;
  data['name'] = this.name;
  data['province_code'] = this.provinceCode;
  data['country_code'] = this.countryCode;
  data['country_name'] = this.countryName;
  data['default'] = this.defaultAddress;
  return data;
}
}

class EmailMarketingConsent {
  String? state;
  String? optInLevel;
  String? consentUpdatedAt;

  EmailMarketingConsent({this.state, this.optInLevel, this.consentUpdatedAt});

  EmailMarketingConsent.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    optInLevel = json['opt_in_level'];
    consentUpdatedAt = json['consent_updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['opt_in_level'] = this.optInLevel;
    data['consent_updated_at'] = this.consentUpdatedAt;
    return data;
  }
}

/*
class Customer {
  int? id;
  String? email;
  bool? acceptsMarketing;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  int? ordersCount;
  String? state;
  String? totalSpent;
  Null? lastOrderId;
  Null? note;
  bool? verifiedEmail;
  Null? multipassIdentifier;
  bool? taxExempt;
  String? tags;
  Null? lastOrderName;
  String? currency;
  Null? phone;
  List<Addresses>? addresses;
  String? acceptsMarketingUpdatedAt;
  String? marketingOptInLevel;
  List<Null>? taxExemptions;
  EmailMarketingConsent? emailMarketingConsent;
  Null? smsMarketingConsent;
  String? adminGraphqlApiId;
  Addresses? defaultAddress;

  Customer({this.id, this.email, this.acceptsMarketing, this.createdAt, this.updatedAt, this.firstName, this.lastName, this.ordersCount, this.state, this.totalSpent, this.lastOrderId, this.note, this.verifiedEmail, this.multipassIdentifier, this.taxExempt, this.tags, this.lastOrderName, this.currency, this.phone, this.addresses, this.acceptsMarketingUpdatedAt, this.marketingOptInLevel, this.taxExemptions, this.emailMarketingConsent, this.smsMarketingConsent, this.adminGraphqlApiId, this.defaultAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    acceptsMarketing = json['accepts_marketing'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    ordersCount = json['orders_count'];
    state = json['state'];
    totalSpent = json['total_spent'];
    lastOrderId = json['last_order_id'];
    note = json['note'];
    verifiedEmail = json['verified_email'];
    multipassIdentifier = json['multipass_identifier'];
    taxExempt = json['tax_exempt'];
    tags = json['tags'];
    lastOrderName = json['last_order_name'];
    currency = json['currency'];
    phone = json['phone'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) { addresses!.add(new Addresses.fromJson(v)); });
    }
    acceptsMarketingUpdatedAt = json['accepts_marketing_updated_at'];
    marketingOptInLevel = json['marketing_opt_in_level'];
    if (json['tax_exemptions'] != null) {
      taxExemptions = <Null>[];
      json['tax_exemptions'].forEach((v) { taxExemptions!.add(new Null.fromJson(v)); });
    }
    emailMarketingConsent = json['email_marketing_consent'] != null ? new EmailMarketingConsent.fromJson(json['email_marketing_consent']) : null;
    smsMarketingConsent = json['sms_marketing_consent'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    defaultAddress = json['default_address'] != null ? new Addresses.fromJson(json['default_address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['accepts_marketing'] = this.acceptsMarketing;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['orders_count'] = this.ordersCount;
    data['state'] = this.state;
    data['total_spent'] = this.totalSpent;
    data['last_order_id'] = this.lastOrderId;
    data['note'] = this.note;
    data['verified_email'] = this.verifiedEmail;
    data['multipass_identifier'] = this.multipassIdentifier;
    data['tax_exempt'] = this.taxExempt;
    data['tags'] = this.tags;
    data['last_order_name'] = this.lastOrderName;
    data['currency'] = this.currency;
    data['phone'] = this.phone;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['accepts_marketing_updated_at'] = this.acceptsMarketingUpdatedAt;
    data['marketing_opt_in_level'] = this.marketingOptInLevel;
    if (this.taxExemptions != null) {
      data['tax_exemptions'] = this.taxExemptions!.map((v) => v.toJson()).toList();
    }
    if (this.emailMarketingConsent != null) {
      data['email_marketing_consent'] = this.emailMarketingConsent!.toJson();
    }
    data['sms_marketing_consent'] = this.smsMarketingConsent;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.defaultAddress != null) {
      data['default_address'] = this.defaultAddress!.toJson();
    }
    return data;
  }
}
*/
