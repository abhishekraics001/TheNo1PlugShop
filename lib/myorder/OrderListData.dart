import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theplugshop/account/UserProfileDeatils.dart';

@JsonSerializable()
class OrderListData {
  List<Orders>? orders;

  OrderListData({this.orders});

  OrderListData.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) { orders!.add(new Orders.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? adminGraphqlApiId;
  int? appId;
  //Null? browserIp;
  bool? buyerAcceptsMarketing;
 // Null? cancelReason;
 // Null? cancelledAt;
  //Null? cartToken;
  int? checkoutId;
  String? checkoutToken;
  //ClientDetails? clientDetails;
  //Null? closedAt;
  bool? confirmed;
  String? contactEmail;
  String? createdAt;
  String? currency;
  String? currentSubtotalPrice;
  CurrentSubtotalPriceSet? currentSubtotalPriceSet;
  String? currentTotalDiscounts;
  CurrentSubtotalPriceSet? currentTotalDiscountsSet;
  //Null? currentTotalDutiesSet;
  String? currentTotalPrice;
  CurrentSubtotalPriceSet? currentTotalPriceSet;
  String? currentTotalTax;
  CurrentSubtotalPriceSet? currentTotalTaxSet;
  String? customerLocale;
  //Null? deviceId;
  //List<Null>? discountCodes;
  String? email;
  bool? estimatedTaxes;
  String? financialStatus;
  //Null? fulfillmentStatus;
  String? gateway;
  //Null? landingSite;
  //Null? landingSiteRef;
  //Null? locationId;
  String? name;
  //Null? note;
 // List<Null>? noteAttributes;
  int? number;
  int? orderNumber;
  String? orderStatusUrl;
 // Null? originalTotalDutiesSet;
  List<String>? paymentGatewayNames;
  //Null? phone;
  String? presentmentCurrency;
  String? processedAt;
  String? processingMethod;
 // Null? reference;
  //Null? referringSite;
  //Null? sourceIdentifier;
  String? sourceName;
  //Null? sourceUrl;
  String? subtotalPrice;
  CurrentSubtotalPriceSet? subtotalPriceSet;
  String? tags;
  //List<Null>? taxLines;
  bool? taxesIncluded;
  bool? test;
  String? token;
  String? totalDiscounts;
  CurrentSubtotalPriceSet? totalDiscountsSet;
  String? totalLineItemsPrice;
  CurrentSubtotalPriceSet? totalLineItemsPriceSet;
  String? totalOutstanding;
  String? totalPrice;
  CurrentSubtotalPriceSet? totalPriceSet;
  String? totalPriceUsd;
  CurrentSubtotalPriceSet? totalShippingPriceSet;
  String? totalTax;
  CurrentSubtotalPriceSet? totalTaxSet;
  String? totalTipReceived;
  int? totalWeight;
  String? updatedAt;
  int? userId;
  BillingAddress? billingAddress;
  Customer? customer;
 // List<Null>? discountApplications;
 // List<Null>? fulfillments;
  List<LineItems>? lineItems;
  PaymentTerms? paymentTerms;
 // List<Null>? refunds;
  ShippingAddress? shippingAddress;
 // List<Null>? shippingLines;

  //Orders({this.id, this.adminGraphqlApiId, this.appId, this.browserIp, this.buyerAcceptsMarketing, this.cancelReason, this.cancelledAt, this.cartToken, this.checkoutId, this.checkoutToken, this.clientDetails, this.closedAt, this.confirmed, this.contactEmail, this.createdAt, this.currency, this.currentSubtotalPrice, this.currentSubtotalPriceSet, this.currentTotalDiscounts, this.currentTotalDiscountsSet, this.currentTotalDutiesSet, this.currentTotalPrice, this.currentTotalPriceSet, this.currentTotalTax, this.currentTotalTaxSet, this.customerLocale, this.deviceId, this.discountCodes, this.email, this.estimatedTaxes, this.financialStatus, this.fulfillmentStatus, this.gateway, this.landingSite, this.landingSiteRef, this.locationId, this.name, this.note, this.noteAttributes, this.number, this.orderNumber, this.orderStatusUrl, this.originalTotalDutiesSet, this.paymentGatewayNames, this.phone, this.presentmentCurrency, this.processedAt, this.processingMethod, this.reference, this.referringSite, this.sourceIdentifier, this.sourceName, this.sourceUrl, this.subtotalPrice, this.subtotalPriceSet, this.tags, this.taxLines, this.taxesIncluded, this.test, this.token, this.totalDiscounts, this.totalDiscountsSet, this.totalLineItemsPrice, this.totalLineItemsPriceSet, this.totalOutstanding, this.totalPrice, this.totalPriceSet, this.totalPriceUsd, this.totalShippingPriceSet, this.totalTax, this.totalTaxSet, this.totalTipReceived, this.totalWeight, this.updatedAt, this.userId, this.billingAddress, this.customer, this.discountApplications, this.fulfillments, this.lineItems, this.paymentTerms, this.refunds, this.shippingAddress, this.shippingLines});
  Orders({this.id, this.adminGraphqlApiId, this.appId, this.buyerAcceptsMarketing,  this.checkoutId, this.checkoutToken,  this.confirmed, this.contactEmail, this.createdAt, this.currency, this.currentSubtotalPrice, this.currentSubtotalPriceSet, this.currentTotalDiscounts, this.currentTotalDiscountsSet,  this.currentTotalPrice, this.currentTotalPriceSet, this.currentTotalTax, this.currentTotalTaxSet, this.customerLocale, this.email, this.estimatedTaxes, this.financialStatus, this.gateway,  this.name, this.number, this.orderNumber, this.orderStatusUrl, this.paymentGatewayNames,  this.presentmentCurrency, this.processedAt, this.processingMethod, this.sourceName,  this.subtotalPrice, this.subtotalPriceSet, this.tags, this.taxesIncluded, this.test, this.token, this.totalDiscounts, this.totalDiscountsSet, this.totalLineItemsPrice, this.totalLineItemsPriceSet, this.totalOutstanding, this.totalPrice, this.totalPriceSet, this.totalPriceUsd, this.totalShippingPriceSet, this.totalTax, this.totalTaxSet, this.totalTipReceived, this.totalWeight, this.updatedAt, this.userId, this.billingAddress, this.customer, this.lineItems, this.paymentTerms,  this.shippingAddress, });


  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    appId = json['app_id'];
    //browserIp = json['browser_ip'];
    buyerAcceptsMarketing = json['buyer_accepts_marketing'];
    //cancelReason = json['cancel_reason'];
    //cancelledAt = json['cancelled_at'];
    //cartToken = json['cart_token'];
    checkoutId = json['checkout_id'];
    checkoutToken = json['checkout_token'];
   // clientDetails = json['client_details'] != null ? new ClientDetails.fromJson(json['client_details']) : null;
    //closedAt = json['closed_at'];
    confirmed = json['confirmed'];
    contactEmail = json['contact_email'];
    createdAt = json['created_at'];
    currency = json['currency'];
    currentSubtotalPrice = json['current_subtotal_price'];
    currentSubtotalPriceSet = json['current_subtotal_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_subtotal_price_set']) : null;
    currentTotalDiscounts = json['current_total_discounts'];
    currentTotalDiscountsSet = json['current_total_discounts_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_total_discounts_set']) : null;
    //currentTotalDutiesSet = json['current_total_duties_set'];
    currentTotalPrice = json['current_total_price'];
    currentTotalPriceSet = json['current_total_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_total_price_set']) : null;
    currentTotalTax = json['current_total_tax'];
    currentTotalTaxSet = json['current_total_tax_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_total_tax_set']) : null;
    customerLocale = json['customer_locale'];
    //deviceId = json['device_id'];
    if (json['discount_codes'] != null) {
      //discountCodes = <Null>[];
     // json['discount_codes'].forEach((v) { discountCodes!.add(new Null.fromJson(v)); });
    }
    email = json['email'];
    estimatedTaxes = json['estimated_taxes'];
    financialStatus = json['financial_status'];
    //fulfillmentStatus = json['fulfillment_status'];
    gateway = json['gateway'];
    //landingSite = json['landing_site'];
    //landingSiteRef = json['landing_site_ref'];
    //locationId = json['location_id'];
    name = json['name'];
   // note = json['note'];
    if (json['note_attributes'] != null) {
      //noteAttributes = <Null>[];
      //json['note_attributes'].forEach((v) { noteAttributes!.add(new Null.fromJson(v)); });
    }
    number = json['number'];
    orderNumber = json['order_number'];
    orderStatusUrl = json['order_status_url'];
    //originalTotalDutiesSet = json['original_total_duties_set'];
    paymentGatewayNames = json['payment_gateway_names'].cast<String>();
    //phone = json['phone'];
    presentmentCurrency = json['presentment_currency'];
    processedAt = json['processed_at'];
    processingMethod = json['processing_method'];
   // reference = json['reference'];
    //referringSite = json['referring_site'];
    //sourceIdentifier = json['source_identifier'];
    sourceName = json['source_name'];
    //sourceUrl = json['source_url'];
    subtotalPrice = json['subtotal_price'];
    subtotalPriceSet = json['subtotal_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['subtotal_price_set']) : null;
    tags = json['tags'];
    if (json['tax_lines'] != null) {
      //taxLines = <Null>[];
     // json['tax_lines'].forEach((v) { taxLines!.add(new Null.fromJson(v)); });
    }
    taxesIncluded = json['taxes_included'];
    test = json['test'];
    token = json['token'];
    totalDiscounts = json['total_discounts'];
    totalDiscountsSet = json['total_discounts_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_discounts_set']) : null;
    totalLineItemsPrice = json['total_line_items_price'];
    totalLineItemsPriceSet = json['total_line_items_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_line_items_price_set']) : null;
    totalOutstanding = json['total_outstanding'];
    totalPrice = json['total_price'];
    totalPriceSet = json['total_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_price_set']) : null;
    totalPriceUsd = json['total_price_usd'];
    totalShippingPriceSet = json['total_shipping_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_shipping_price_set']) : null;
    totalTax = json['total_tax'];
    totalTaxSet = json['total_tax_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_tax_set']) : null;
    totalTipReceived = json['total_tip_received'];
    totalWeight = json['total_weight'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    billingAddress = json['billing_address'] != null ? new BillingAddress.fromJson(json['billing_address']) : null;
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
    if (json['discount_applications'] != null) {
      //discountApplications = <Null>[];
      //json['discount_applications'].forEach((v) { discountApplications!.add(new Null.fromJson(v)); });
    }
    if (json['fulfillments'] != null) {
      //fulfillments = <Null>[];
     // json['fulfillments'].forEach((v) { fulfillments!.add(new Null.fromJson(v)); });
    }
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) { lineItems!.add(new LineItems.fromJson(v)); });
    }
    paymentTerms = json['payment_terms'] != null ? new PaymentTerms.fromJson(json['payment_terms']) : null;
    if (json['refunds'] != null) {
      //refunds = <Null>[];
      //json['refunds'].forEach((v) { refunds!.add(new Null.fromJson(v)); });
    }
    shippingAddress = json['shipping_address'] != null ? new ShippingAddress.fromJson(json['shipping_address']) : null;
    if (json['shipping_lines'] != null) {
      //shippingLines = <Null>[];
      //json['shipping_lines'].forEach((v) { shippingLines!.add(new Null.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    data['app_id'] = this.appId;
   // data['browser_ip'] = this.browserIp;
    data['buyer_accepts_marketing'] = this.buyerAcceptsMarketing;
    //data['cancel_reason'] = this.cancelReason;
    //data['cancelled_at'] = this.cancelledAt;
    //data['cart_token'] = this.cartToken;
    data['checkout_id'] = this.checkoutId;
    data['checkout_token'] = this.checkoutToken;
    /*if (this.clientDetails != null) {
      data['client_details'] = this.clientDetails!.toJson();
    }*/
    //data['closed_at'] = this.closedAt;
    data['confirmed'] = this.confirmed;
    data['contact_email'] = this.contactEmail;
    data['created_at'] = this.createdAt;
    data['currency'] = this.currency;
    data['current_subtotal_price'] = this.currentSubtotalPrice;
    if (this.currentSubtotalPriceSet != null) {
      data['current_subtotal_price_set'] = this.currentSubtotalPriceSet!.toJson();
    }
    data['current_total_discounts'] = this.currentTotalDiscounts;
    if (this.currentTotalDiscountsSet != null) {
      data['current_total_discounts_set'] = this.currentTotalDiscountsSet!.toJson();
    }
    //data['current_total_duties_set'] = this.currentTotalDutiesSet;
    data['current_total_price'] = this.currentTotalPrice;
    if (this.currentTotalPriceSet != null) {
      data['current_total_price_set'] = this.currentTotalPriceSet!.toJson();
    }
    data['current_total_tax'] = this.currentTotalTax;
    if (this.currentTotalTaxSet != null) {
      data['current_total_tax_set'] = this.currentTotalTaxSet!.toJson();
    }
    data['customer_locale'] = this.customerLocale;
    //data['device_id'] = this.deviceId;
    //if (this.discountCodes != null) {
      //data['discount_codes'] = this.discountCodes!.map((v) => v.toJson()).toList();
    //}
    data['email'] = this.email;
    data['estimated_taxes'] = this.estimatedTaxes;
    data['financial_status'] = this.financialStatus;
    //data['fulfillment_status'] = this.fulfillmentStatus;
    data['gateway'] = this.gateway;
    //data['landing_site'] = this.landingSite;
   // data['landing_site_ref'] = this.landingSiteRef;
   // data['location_id'] = this.locationId;
    data['name'] = this.name;
    //data['note'] = this.note;
    //if (this.noteAttributes != null) {
     // data['note_attributes'] = this.noteAttributes!.map((v) => v.toJson()).toList();
    //}
    data['number'] = this.number;
    data['order_number'] = this.orderNumber;
    data['order_status_url'] = this.orderStatusUrl;
    //data['original_total_duties_set'] = this.originalTotalDutiesSet;
    data['payment_gateway_names'] = this.paymentGatewayNames;
    //data['phone'] = this.phone;
    data['presentment_currency'] = this.presentmentCurrency;
    data['processed_at'] = this.processedAt;
    data['processing_method'] = this.processingMethod;
    //data['reference'] = this.reference;
    //data['referring_site'] = this.referringSite;
    //data['source_identifier'] = this.sourceIdentifier;
    data['source_name'] = this.sourceName;
    //data['source_url'] = this.sourceUrl;
    data['subtotal_price'] = this.subtotalPrice;
    if (this.subtotalPriceSet != null) {
      data['subtotal_price_set'] = this.subtotalPriceSet!.toJson();
    }
    data['tags'] = this.tags;
    //if (this.taxLines != null) {
      //data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    //}
    data['taxes_included'] = this.taxesIncluded;
    data['test'] = this.test;
    data['token'] = this.token;
    data['total_discounts'] = this.totalDiscounts;
    if (this.totalDiscountsSet != null) {
      data['total_discounts_set'] = this.totalDiscountsSet!.toJson();
    }
    data['total_line_items_price'] = this.totalLineItemsPrice;
    if (this.totalLineItemsPriceSet != null) {
      data['total_line_items_price_set'] = this.totalLineItemsPriceSet!.toJson();
    }
    data['total_outstanding'] = this.totalOutstanding;
    data['total_price'] = this.totalPrice;
    if (this.totalPriceSet != null) {
      data['total_price_set'] = this.totalPriceSet!.toJson();
    }
    data['total_price_usd'] = this.totalPriceUsd;
    if (this.totalShippingPriceSet != null) {
      data['total_shipping_price_set'] = this.totalShippingPriceSet!.toJson();
    }
    data['total_tax'] = this.totalTax;
    if (this.totalTaxSet != null) {
      data['total_tax_set'] = this.totalTaxSet!.toJson();
    }
    data['total_tip_received'] = this.totalTipReceived;
    data['total_weight'] = this.totalWeight;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
   // if (this.discountApplications != null) {
     // data['discount_applications'] = this.discountApplications!.map((v) => v.toJson()).toList();
    //}
    //if (this.fulfillments != null) {
      //data['fulfillments'] = this.fulfillments!.map((v) => v.toJson()).toList();
   // }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.paymentTerms != null) {
      data['payment_terms'] = this.paymentTerms!.toJson();
    }
   /* if (this.refunds != null) {
      data['refunds'] = this.refunds!.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] = this.shippingLines!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class ClientDetails {
  Null? acceptLanguage;
  Null? browserHeight;
  Null? browserIp;
  Null? browserWidth;
  Null? sessionHash;
  Null? userAgent;

  ClientDetails({this.acceptLanguage, this.browserHeight, this.browserIp, this.browserWidth, this.sessionHash, this.userAgent});

  ClientDetails.fromJson(Map<String, dynamic> json) {
    acceptLanguage = json['accept_language'];
    browserHeight = json['browser_height'];
    browserIp = json['browser_ip'];
    browserWidth = json['browser_width'];
    sessionHash = json['session_hash'];
    userAgent = json['user_agent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accept_language'] = this.acceptLanguage;
    data['browser_height'] = this.browserHeight;
    data['browser_ip'] = this.browserIp;
    data['browser_width'] = this.browserWidth;
    data['session_hash'] = this.sessionHash;
    data['user_agent'] = this.userAgent;
    return data;
  }
}

class CurrentSubtotalPriceSet {
  ShopMoney? shopMoney;
  ShopMoney? presentmentMoney;

  CurrentSubtotalPriceSet({this.shopMoney, this.presentmentMoney});

  CurrentSubtotalPriceSet.fromJson(Map<String, dynamic> json) {
    shopMoney = json['shop_money'] != null ? new ShopMoney.fromJson(json['shop_money']) : null;
    presentmentMoney = json['presentment_money'] != null ? new ShopMoney.fromJson(json['presentment_money']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopMoney != null) {
      data['shop_money'] = this.shopMoney!.toJson();
    }
    if (this.presentmentMoney != null) {
      data['presentment_money'] = this.presentmentMoney!.toJson();
    }
    return data;
  }
}

class ShopMoney {
  String? amount;
  String? currencyCode;

  ShopMoney({this.amount, this.currencyCode});

  ShopMoney.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency_code'] = this.currencyCode;
    return data;
  }
}

class BillingAddress {
  String? firstName;
  String? address1;
  String? phone;
  String? city;
  String? zip;
  String? province;
  String? country;
  String? lastName;
  String? address2;
  String? company;
  //Null? latitude;
  //Null? longitude;
  String? name;
  String? countryCode;
  String? provinceCode;

  BillingAddress({this.firstName, this.address1, this.phone, this.city, this.zip, this.province, this.country, this.lastName, this.address2, this.company,  this.name, this.countryCode, this.provinceCode});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    address1 = json['address1'];
    phone = json['phone'];
    city = json['city'];
    zip = json['zip'];
    province = json['province'];
    country = json['country'];
    lastName = json['last_name'];
    address2 = json['address2'];
    company = json['company'];
   // latitude = json['latitude'];
   // longitude = json['longitude'];
    name = json['name'];
    countryCode = json['country_code'];
    provinceCode = json['province_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['address1'] = this.address1;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['province'] = this.province;
    data['country'] = this.country;
    data['last_name'] = this.lastName;
    data['address2'] = this.address2;
    data['company'] = this.company;
    //data['latitude'] = this.latitude;
    //data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['province_code'] = this.provinceCode;
    return data;
  }
}


class LineItems {
  int? id;
  String? adminGraphqlApiId;
  DestinationLocation? destinationLocation;
  int? fulfillableQuantity;
  String? fulfillmentService;
  //Null? fulfillmentStatus;
  bool? giftCard;
  int? grams;
  String? name;
  DestinationLocation? originLocation;
  String? price;
  CurrentSubtotalPriceSet? priceSet;
  bool? productExists;
  int? productId;
  //List<Null>? properties;
  int? quantity;
  bool? requiresShipping;
  String? sku;
  bool? taxable;
  String? title;
  String? totalDiscount;
  CurrentSubtotalPriceSet? totalDiscountSet;
  int? variantId;
  String? variantInventoryManagement;
  String? variantTitle;
  String? vendor;
 // List<Null>? taxLines;
 // List<Null>? duties;
  //List<Null>? discountAllocations;

  //LineItems({this.id, this.adminGraphqlApiId, this.destinationLocation, this.fulfillableQuantity, this.fulfillmentService, this.fulfillmentStatus, this.giftCard, this.grams, this.name, this.originLocation, this.price, this.priceSet, this.productExists, this.productId, this.properties, this.quantity, this.requiresShipping, this.sku, this.taxable, this.title, this.totalDiscount, this.totalDiscountSet, this.variantId, this.variantInventoryManagement, this.variantTitle, this.vendor, this.taxLines, this.duties, this.discountAllocations});
  LineItems({this.id, this.adminGraphqlApiId, this.destinationLocation, this.fulfillableQuantity, this.fulfillmentService,this.giftCard, this.grams, this.name, this.originLocation, this.price, this.priceSet, this.productExists, this.productId,  this.quantity, this.requiresShipping, this.sku, this.taxable, this.title, this.totalDiscount, this.totalDiscountSet, this.variantId, this.variantInventoryManagement, this.variantTitle, this.vendor});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    destinationLocation = json['destination_location'] != null ? new DestinationLocation.fromJson(json['destination_location']) : null;
    fulfillableQuantity = json['fulfillable_quantity'];
    fulfillmentService = json['fulfillment_service'];
    //fulfillmentStatus = json['fulfillment_status'];
    giftCard = json['gift_card'];
    grams = json['grams'];
    name = json['name'];
    originLocation = json['origin_location'] != null ? new DestinationLocation.fromJson(json['origin_location']) : null;
    price = json['price'];
    priceSet = json['price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['price_set']) : null;
    productExists = json['product_exists'];
    productId = json['product_id'];
    if (json['properties'] != null) {
     // properties = <Null>[];
     // json['properties'].forEach((v) { properties!.add(new Null.fromJson(v)); });
    }
    quantity = json['quantity'];
    requiresShipping = json['requires_shipping'];
    sku = json['sku'];
    taxable = json['taxable'];
    title = json['title'];
    totalDiscount = json['total_discount'];
    totalDiscountSet = json['total_discount_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_discount_set']) : null;
    variantId = json['variant_id'];
    variantInventoryManagement = json['variant_inventory_management'];
    variantTitle = json['variant_title'];
    vendor = json['vendor'];
    if (json['tax_lines'] != null) {
     // taxLines = <Null>[];
      //json['tax_lines'].forEach((v) { taxLines!.add(new Null.fromJson(v)); });
    }
    if (json['duties'] != null) {
     // duties = <Null>[];
      //json['duties'].forEach((v) { duties!.add(new Null.fromJson(v)); });
    }
    if (json['discount_allocations'] != null) {
      //discountAllocations = <Null>[];
      //json['discount_allocations'].forEach((v) { discountAllocations!.add(new Null.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.destinationLocation != null) {
      data['destination_location'] = this.destinationLocation!.toJson();
    }
    data['fulfillable_quantity'] = this.fulfillableQuantity;
    data['fulfillment_service'] = this.fulfillmentService;
    //data['fulfillment_status'] = this.fulfillmentStatus;
    data['gift_card'] = this.giftCard;
    data['grams'] = this.grams;
    data['name'] = this.name;
    if (this.originLocation != null) {
      data['origin_location'] = this.originLocation!.toJson();
    }
    data['price'] = this.price;
    if (this.priceSet != null) {
      data['price_set'] = this.priceSet!.toJson();
    }
    data['product_exists'] = this.productExists;
    data['product_id'] = this.productId;
   /* if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }*/
    data['quantity'] = this.quantity;
    data['requires_shipping'] = this.requiresShipping;
    data['sku'] = this.sku;
    data['taxable'] = this.taxable;
    data['title'] = this.title;
    data['total_discount'] = this.totalDiscount;
    if (this.totalDiscountSet != null) {
      data['total_discount_set'] = this.totalDiscountSet!.toJson();
    }
    data['variant_id'] = this.variantId;
    data['variant_inventory_management'] = this.variantInventoryManagement;
    data['variant_title'] = this.variantTitle;
    data['vendor'] = this.vendor;
   /* if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    }
    if (this.duties != null) {
      data['duties'] = this.duties!.map((v) => v.toJson()).toList();
    }
    if (this.discountAllocations != null) {
      data['discount_allocations'] = this.discountAllocations!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class DestinationLocation {
  int? id;
  String? countryCode;
  String? provinceCode;
  String? name;
  String? address1;
  String? address2;
  String? city;
  String? zip;

  DestinationLocation({this.id, this.countryCode, this.provinceCode, this.name, this.address1, this.address2, this.city, this.zip});

  DestinationLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    provinceCode = json['province_code'];
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_code'] = this.countryCode;
    data['province_code'] = this.provinceCode;
    data['name'] = this.name;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['zip'] = this.zip;
    return data;
  }
}

class PaymentTerms {
  int? id;
  String? createdAt;
 // Null? dueInDays;
  List<PaymentSchedules>? paymentSchedules;
  String? paymentTermsName;
  String? paymentTermsType;
  String? updatedAt;

  PaymentTerms({this.id, this.createdAt, this.paymentSchedules, this.paymentTermsName, this.paymentTermsType, this.updatedAt});

  PaymentTerms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
   // dueInDays = json['due_in_days'];
    if (json['payment_schedules'] != null) {
      paymentSchedules = <PaymentSchedules>[];
      json['payment_schedules'].forEach((v) { paymentSchedules!.add(new PaymentSchedules.fromJson(v)); });
    }
    paymentTermsName = json['payment_terms_name'];
    paymentTermsType = json['payment_terms_type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
   // data['due_in_days'] = this.dueInDays;
    if (this.paymentSchedules != null) {
      data['payment_schedules'] = this.paymentSchedules!.map((v) => v.toJson()).toList();
    }
    data['payment_terms_name'] = this.paymentTermsName;
    data['payment_terms_type'] = this.paymentTermsType;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PaymentSchedules {
  int? id;
  String? amount;
  String? currency;
  //Null? issuedAt;
  //Null? dueAt;
  //Null? completedAt;
  String? createdAt;
  String? updatedAt;

  PaymentSchedules({this.id, this.amount, this.currency,  this.createdAt, this.updatedAt});

  PaymentSchedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    currency = json['currency'];
   // issuedAt = json['issued_at'];
   // dueAt = json['due_at'];
   // completedAt = json['completed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
   // data['issued_at'] = this.issuedAt;
    //data['due_at'] = this.dueAt;
    //data['completed_at'] = this.completedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ShippingAddress {
  String? firstName;
  String? address1;
  String? phone;
  String? city;
  String? zip;
  String? province;
  String? country;
  String? lastName;
  String? address2;
  String? company;
  double? latitude;
  double? longitude;
  String? name;
  String? countryCode;
  String? provinceCode;

  ShippingAddress({this.firstName, this.address1, this.phone, this.city, this.zip, this.province, this.country, this.lastName, this.address2, this.company, this.latitude, this.longitude, this.name, this.countryCode, this.provinceCode});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    address1 = json['address1'];
    phone = json['phone'];
    city = json['city'];
    zip = json['zip'];
    province = json['province'];
    country = json['country'];
    lastName = json['last_name'];
    address2 = json['address2'];
    company = json['company'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    countryCode = json['country_code'];
    provinceCode = json['province_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['address1'] = this.address1;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['province'] = this.province;
    data['country'] = this.country;
    data['last_name'] = this.lastName;
    data['address2'] = this.address2;
    data['company'] = this.company;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['province_code'] = this.provinceCode;
    return data;
  }
}
/*
class Orders {
  int? id;
  String? adminGraphqlApiId;
  int? appId;
  Null? browserIp;
  bool? buyerAcceptsMarketing;
  Null? cancelReason;
  Null? cancelledAt;
  Null? cartToken;
  int? checkoutId;
  String? checkoutToken;
  ClientDetails? clientDetails;
  Null? closedAt;
  bool? confirmed;
  String? contactEmail;
  String? createdAt;
  String? currency;
  String? currentSubtotalPrice;
  CurrentSubtotalPriceSet? currentSubtotalPriceSet;
  String? currentTotalDiscounts;
  CurrentSubtotalPriceSet? currentTotalDiscountsSet;
  Null? currentTotalDutiesSet;
  String? currentTotalPrice;
  CurrentSubtotalPriceSet? currentTotalPriceSet;
  String? currentTotalTax;
  CurrentSubtotalPriceSet? currentTotalTaxSet;
  String? customerLocale;
  Null? deviceId;
  List<Null>? discountCodes;
  String? email;
  bool? estimatedTaxes;
  String? financialStatus;
  Null? fulfillmentStatus;
  String? gateway;
  Null? landingSite;
  Null? landingSiteRef;
  Null? locationId;
  String? name;
  Null? note;
  List<Null>? noteAttributes;
  int? number;
  int? orderNumber;
  String? orderStatusUrl;
  Null? originalTotalDutiesSet;
  List<String>? paymentGatewayNames;
  Null? phone;
  String? presentmentCurrency;
  String? processedAt;
  String? processingMethod;
  Null? reference;
  Null? referringSite;
  Null? sourceIdentifier;
  String? sourceName;
  Null? sourceUrl;
  String? subtotalPrice;
  CurrentSubtotalPriceSet? subtotalPriceSet;
  String? tags;
  List<Null>? taxLines;
  bool? taxesIncluded;
  bool? test;
  String? token;
  String? totalDiscounts;
  CurrentSubtotalPriceSet? totalDiscountsSet;
  String? totalLineItemsPrice;
  CurrentSubtotalPriceSet? totalLineItemsPriceSet;
  String? totalOutstanding;
  String? totalPrice;
  CurrentSubtotalPriceSet? totalPriceSet;
  String? totalPriceUsd;
  CurrentSubtotalPriceSet? totalShippingPriceSet;
  String? totalTax;
  CurrentSubtotalPriceSet? totalTaxSet;
  String? totalTipReceived;
  int? totalWeight;
  String? updatedAt;
  int? userId;
  BillingAddress? billingAddress;
  Customer? customer;
  List<Null>? discountApplications;
  List<Null>? fulfillments;
  List<LineItems>? lineItems;
  PaymentTerms? paymentTerms;
  List<Null>? refunds;
  ShippingAddress? shippingAddress;
  List<Null>? shippingLines;

  Orders({this.id, this.adminGraphqlApiId, this.appId, this.browserIp, this.buyerAcceptsMarketing, this.cancelReason, this.cancelledAt, this.cartToken, this.checkoutId, this.checkoutToken, this.clientDetails, this.closedAt, this.confirmed, this.contactEmail, this.createdAt, this.currency, this.currentSubtotalPrice, this.currentSubtotalPriceSet, this.currentTotalDiscounts, this.currentTotalDiscountsSet, this.currentTotalDutiesSet, this.currentTotalPrice, this.currentTotalPriceSet, this.currentTotalTax, this.currentTotalTaxSet, this.customerLocale, this.deviceId, this.discountCodes, this.email, this.estimatedTaxes, this.financialStatus, this.fulfillmentStatus, this.gateway, this.landingSite, this.landingSiteRef, this.locationId, this.name, this.note, this.noteAttributes, this.number, this.orderNumber, this.orderStatusUrl, this.originalTotalDutiesSet, this.paymentGatewayNames, this.phone, this.presentmentCurrency, this.processedAt, this.processingMethod, this.reference, this.referringSite, this.sourceIdentifier, this.sourceName, this.sourceUrl, this.subtotalPrice, this.subtotalPriceSet, this.tags, this.taxLines, this.taxesIncluded, this.test, this.token, this.totalDiscounts, this.totalDiscountsSet, this.totalLineItemsPrice, this.totalLineItemsPriceSet, this.totalOutstanding, this.totalPrice, this.totalPriceSet, this.totalPriceUsd, this.totalShippingPriceSet, this.totalTax, this.totalTaxSet, this.totalTipReceived, this.totalWeight, this.updatedAt, this.userId, this.billingAddress, this.customer, this.discountApplications, this.fulfillments, this.lineItems, this.paymentTerms, this.refunds, this.shippingAddress, this.shippingLines});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    appId = json['app_id'];
    browserIp = json['browser_ip'];
    buyerAcceptsMarketing = json['buyer_accepts_marketing'];
    cancelReason = json['cancel_reason'];
    cancelledAt = json['cancelled_at'];
    cartToken = json['cart_token'];
    checkoutId = json['checkout_id'];
    checkoutToken = json['checkout_token'];
    clientDetails = json['client_details'] != null ? new ClientDetails.fromJson(json['client_details']) : null;
    closedAt = json['closed_at'];
    confirmed = json['confirmed'];
    contactEmail = json['contact_email'];
    createdAt = json['created_at'];
    currency = json['currency'];
    currentSubtotalPrice = json['current_subtotal_price'];
    currentSubtotalPriceSet = json['current_subtotal_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_subtotal_price_set']) : null;
    currentTotalDiscounts = json['current_total_discounts'];
    currentTotalDiscountsSet = json['current_total_discounts_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_total_discounts_set']) : null;
    currentTotalDutiesSet = json['current_total_duties_set'];
    currentTotalPrice = json['current_total_price'];
    currentTotalPriceSet = json['current_total_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_total_price_set']) : null;
    currentTotalTax = json['current_total_tax'];
    currentTotalTaxSet = json['current_total_tax_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['current_total_tax_set']) : null;
    customerLocale = json['customer_locale'];
    deviceId = json['device_id'];
    if (json['discount_codes'] != null) {
      discountCodes = <Null>[];
      json['discount_codes'].forEach((v) { discountCodes!.add(new Null.fromJson(v)); });
    }
    email = json['email'];
    estimatedTaxes = json['estimated_taxes'];
    financialStatus = json['financial_status'];
    fulfillmentStatus = json['fulfillment_status'];
    gateway = json['gateway'];
    landingSite = json['landing_site'];
    landingSiteRef = json['landing_site_ref'];
    locationId = json['location_id'];
    name = json['name'];
    note = json['note'];
    if (json['note_attributes'] != null) {
      noteAttributes = <Null>[];
      json['note_attributes'].forEach((v) { noteAttributes!.add(new Null.fromJson(v)); });
    }
    number = json['number'];
    orderNumber = json['order_number'];
    orderStatusUrl = json['order_status_url'];
    originalTotalDutiesSet = json['original_total_duties_set'];
    paymentGatewayNames = json['payment_gateway_names'].cast<String>();
    phone = json['phone'];
    presentmentCurrency = json['presentment_currency'];
    processedAt = json['processed_at'];
    processingMethod = json['processing_method'];
    reference = json['reference'];
    referringSite = json['referring_site'];
    sourceIdentifier = json['source_identifier'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    subtotalPrice = json['subtotal_price'];
    subtotalPriceSet = json['subtotal_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['subtotal_price_set']) : null;
    tags = json['tags'];
    if (json['tax_lines'] != null) {
      taxLines = <Null>[];
      json['tax_lines'].forEach((v) { taxLines!.add(new Null.fromJson(v)); });
    }
    taxesIncluded = json['taxes_included'];
    test = json['test'];
    token = json['token'];
    totalDiscounts = json['total_discounts'];
    totalDiscountsSet = json['total_discounts_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_discounts_set']) : null;
    totalLineItemsPrice = json['total_line_items_price'];
    totalLineItemsPriceSet = json['total_line_items_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_line_items_price_set']) : null;
    totalOutstanding = json['total_outstanding'];
    totalPrice = json['total_price'];
    totalPriceSet = json['total_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_price_set']) : null;
    totalPriceUsd = json['total_price_usd'];
    totalShippingPriceSet = json['total_shipping_price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_shipping_price_set']) : null;
    totalTax = json['total_tax'];
    totalTaxSet = json['total_tax_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_tax_set']) : null;
    totalTipReceived = json['total_tip_received'];
    totalWeight = json['total_weight'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    billingAddress = json['billing_address'] != null ? new BillingAddress.fromJson(json['billing_address']) : null;
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
    if (json['discount_applications'] != null) {
      discountApplications = <Null>[];
      json['discount_applications'].forEach((v) { discountApplications!.add(new Null.fromJson(v)); });
    }
    if (json['fulfillments'] != null) {
      fulfillments = <Null>[];
      json['fulfillments'].forEach((v) { fulfillments!.add(new Null.fromJson(v)); });
    }
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) { lineItems!.add(new LineItems.fromJson(v)); });
    }
    paymentTerms = json['payment_terms'] != null ? new PaymentTerms.fromJson(json['payment_terms']) : null;
    if (json['refunds'] != null) {
      refunds = <Null>[];
      json['refunds'].forEach((v) { refunds!.add(new Null.fromJson(v)); });
    }
    shippingAddress = json['shipping_address'] != null ? new ShippingAddress.fromJson(json['shipping_address']) : null;
    if (json['shipping_lines'] != null) {
      shippingLines = <Null>[];
      json['shipping_lines'].forEach((v) { shippingLines!.add(new Null.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    data['app_id'] = this.appId;
    data['browser_ip'] = this.browserIp;
    data['buyer_accepts_marketing'] = this.buyerAcceptsMarketing;
    data['cancel_reason'] = this.cancelReason;
    data['cancelled_at'] = this.cancelledAt;
    data['cart_token'] = this.cartToken;
    data['checkout_id'] = this.checkoutId;
    data['checkout_token'] = this.checkoutToken;
    if (this.clientDetails != null) {
      data['client_details'] = this.clientDetails!.toJson();
    }
    data['closed_at'] = this.closedAt;
    data['confirmed'] = this.confirmed;
    data['contact_email'] = this.contactEmail;
    data['created_at'] = this.createdAt;
    data['currency'] = this.currency;
    data['current_subtotal_price'] = this.currentSubtotalPrice;
    if (this.currentSubtotalPriceSet != null) {
      data['current_subtotal_price_set'] = this.currentSubtotalPriceSet!.toJson();
    }
    data['current_total_discounts'] = this.currentTotalDiscounts;
    if (this.currentTotalDiscountsSet != null) {
      data['current_total_discounts_set'] = this.currentTotalDiscountsSet!.toJson();
    }
    data['current_total_duties_set'] = this.currentTotalDutiesSet;
    data['current_total_price'] = this.currentTotalPrice;
    if (this.currentTotalPriceSet != null) {
      data['current_total_price_set'] = this.currentTotalPriceSet!.toJson();
    }
    data['current_total_tax'] = this.currentTotalTax;
    if (this.currentTotalTaxSet != null) {
      data['current_total_tax_set'] = this.currentTotalTaxSet!.toJson();
    }
    data['customer_locale'] = this.customerLocale;
    data['device_id'] = this.deviceId;
    if (this.discountCodes != null) {
      data['discount_codes'] = this.discountCodes!.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['estimated_taxes'] = this.estimatedTaxes;
    data['financial_status'] = this.financialStatus;
    data['fulfillment_status'] = this.fulfillmentStatus;
    data['gateway'] = this.gateway;
    data['landing_site'] = this.landingSite;
    data['landing_site_ref'] = this.landingSiteRef;
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['note'] = this.note;
    if (this.noteAttributes != null) {
      data['note_attributes'] = this.noteAttributes!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    data['order_number'] = this.orderNumber;
    data['order_status_url'] = this.orderStatusUrl;
    data['original_total_duties_set'] = this.originalTotalDutiesSet;
    data['payment_gateway_names'] = this.paymentGatewayNames;
    data['phone'] = this.phone;
    data['presentment_currency'] = this.presentmentCurrency;
    data['processed_at'] = this.processedAt;
    data['processing_method'] = this.processingMethod;
    data['reference'] = this.reference;
    data['referring_site'] = this.referringSite;
    data['source_identifier'] = this.sourceIdentifier;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['subtotal_price'] = this.subtotalPrice;
    if (this.subtotalPriceSet != null) {
      data['subtotal_price_set'] = this.subtotalPriceSet!.toJson();
    }
    data['tags'] = this.tags;
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    }
    data['taxes_included'] = this.taxesIncluded;
    data['test'] = this.test;
    data['token'] = this.token;
    data['total_discounts'] = this.totalDiscounts;
    if (this.totalDiscountsSet != null) {
      data['total_discounts_set'] = this.totalDiscountsSet!.toJson();
    }
    data['total_line_items_price'] = this.totalLineItemsPrice;
    if (this.totalLineItemsPriceSet != null) {
      data['total_line_items_price_set'] = this.totalLineItemsPriceSet!.toJson();
    }
    data['total_outstanding'] = this.totalOutstanding;
    data['total_price'] = this.totalPrice;
    if (this.totalPriceSet != null) {
      data['total_price_set'] = this.totalPriceSet!.toJson();
    }
    data['total_price_usd'] = this.totalPriceUsd;
    if (this.totalShippingPriceSet != null) {
      data['total_shipping_price_set'] = this.totalShippingPriceSet!.toJson();
    }
    data['total_tax'] = this.totalTax;
    if (this.totalTaxSet != null) {
      data['total_tax_set'] = this.totalTaxSet!.toJson();
    }
    data['total_tip_received'] = this.totalTipReceived;
    data['total_weight'] = this.totalWeight;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.discountApplications != null) {
      data['discount_applications'] = this.discountApplications!.map((v) => v.toJson()).toList();
    }
    if (this.fulfillments != null) {
      data['fulfillments'] = this.fulfillments!.map((v) => v.toJson()).toList();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.paymentTerms != null) {
      data['payment_terms'] = this.paymentTerms!.toJson();
    }
    if (this.refunds != null) {
      data['refunds'] = this.refunds!.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] = this.shippingLines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/


/*

class CurrentSubtotalPriceSet {
  ShopMoney? shopMoney;
  ShopMoney? presentmentMoney;

  CurrentSubtotalPriceSet({this.shopMoney, this.presentmentMoney});

  CurrentSubtotalPriceSet.fromJson(Map<String, dynamic> json) {
    shopMoney = json['shop_money'] != null ? new ShopMoney.fromJson(json['shop_money']) : null;
    presentmentMoney = json['presentment_money'] != null ? new ShopMoney.fromJson(json['presentment_money']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopMoney != null) {
      data['shop_money'] = this.shopMoney!.toJson();
    }
    if (this.presentmentMoney != null) {
      data['presentment_money'] = this.presentmentMoney!.toJson();
    }
    return data;
  }
}
*/

/*
class LineItems {
  int? id;
  String? adminGraphqlApiId;
  DestinationLocation? destinationLocation;
  int? fulfillableQuantity;
  String? fulfillmentService;
  Null? fulfillmentStatus;
  bool? giftCard;
  int? grams;
  String? name;
  DestinationLocation? originLocation;
  String? price;
  CurrentSubtotalPriceSet? priceSet;
  bool? productExists;
  int? productId;
  List<Null>? properties;
  int? quantity;
  bool? requiresShipping;
  String? sku;
  bool? taxable;
  String? title;
  String? totalDiscount;
  CurrentSubtotalPriceSet? totalDiscountSet;
  int? variantId;
  String? variantInventoryManagement;
  String? variantTitle;
  String? vendor;
  List<Null>? taxLines;
  List<Null>? duties;
  List<Null>? discountAllocations;

  LineItems({this.id, this.adminGraphqlApiId, this.destinationLocation, this.fulfillableQuantity, this.fulfillmentService, this.fulfillmentStatus, this.giftCard, this.grams, this.name, this.originLocation, this.price, this.priceSet, this.productExists, this.productId, this.properties, this.quantity, this.requiresShipping, this.sku, this.taxable, this.title, this.totalDiscount, this.totalDiscountSet, this.variantId, this.variantInventoryManagement, this.variantTitle, this.vendor, this.taxLines, this.duties, this.discountAllocations});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    destinationLocation = json['destination_location'] != null ? new DestinationLocation.fromJson(json['destination_location']) : null;
    fulfillableQuantity = json['fulfillable_quantity'];
    fulfillmentService = json['fulfillment_service'];
    fulfillmentStatus = json['fulfillment_status'];
    giftCard = json['gift_card'];
    grams = json['grams'];
    name = json['name'];
    originLocation = json['origin_location'] != null ? new DestinationLocation.fromJson(json['origin_location']) : null;
    price = json['price'];
    priceSet = json['price_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['price_set']) : null;
    productExists = json['product_exists'];
    productId = json['product_id'];
    if (json['properties'] != null) {
      properties = <Null>[];
      json['properties'].forEach((v) { properties!.add(new Null.fromJson(v)); });
    }
    quantity = json['quantity'];
    requiresShipping = json['requires_shipping'];
    sku = json['sku'];
    taxable = json['taxable'];
    title = json['title'];
    totalDiscount = json['total_discount'];
    totalDiscountSet = json['total_discount_set'] != null ? new CurrentSubtotalPriceSet.fromJson(json['total_discount_set']) : null;
    variantId = json['variant_id'];
    variantInventoryManagement = json['variant_inventory_management'];
    variantTitle = json['variant_title'];
    vendor = json['vendor'];
    if (json['tax_lines'] != null) {
      taxLines = <Null>[];
      json['tax_lines'].forEach((v) { taxLines!.add(new Null.fromJson(v)); });
    }
    if (json['duties'] != null) {
      duties = <Null>[];
      json['duties'].forEach((v) { duties!.add(new Null.fromJson(v)); });
    }
    if (json['discount_allocations'] != null) {
      discountAllocations = <Null>[];
      json['discount_allocations'].forEach((v) { discountAllocations!.add(new Null.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.destinationLocation != null) {
      data['destination_location'] = this.destinationLocation!.toJson();
    }
    data['fulfillable_quantity'] = this.fulfillableQuantity;
    data['fulfillment_service'] = this.fulfillmentService;
    data['fulfillment_status'] = this.fulfillmentStatus;
    data['gift_card'] = this.giftCard;
    data['grams'] = this.grams;
    data['name'] = this.name;
    if (this.originLocation != null) {
      data['origin_location'] = this.originLocation!.toJson();
    }
    data['price'] = this.price;
    if (this.priceSet != null) {
      data['price_set'] = this.priceSet!.toJson();
    }
    data['product_exists'] = this.productExists;
    data['product_id'] = this.productId;
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['requires_shipping'] = this.requiresShipping;
    data['sku'] = this.sku;
    data['taxable'] = this.taxable;
    data['title'] = this.title;
    data['total_discount'] = this.totalDiscount;
    if (this.totalDiscountSet != null) {
      data['total_discount_set'] = this.totalDiscountSet!.toJson();
    }
    data['variant_id'] = this.variantId;
    data['variant_inventory_management'] = this.variantInventoryManagement;
    data['variant_title'] = this.variantTitle;
    data['vendor'] = this.vendor;
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    }
    if (this.duties != null) {
      data['duties'] = this.duties!.map((v) => v.toJson()).toList();
    }
    if (this.discountAllocations != null) {
      data['discount_allocations'] = this.discountAllocations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
*/
