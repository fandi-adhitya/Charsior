part of '../checkout.dart';

class Checkout {
  Checkout({
    required this.sells,
  });
  late final List<Sells> sells;
  
  Checkout.fromJson(Map<String, dynamic> json){
    sells = List.from(json['sells']).map((e)=>Sells.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sells'] = sells.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Sells {
  Sells({
    required this.locationId,
    required this.contactId,
    required this.transactionDate,
    required this.discountAmount,
    required this.products,
    required this.payments,
  });
  late final int locationId;
  late final int contactId;
  late final String transactionDate;
  late final int discountAmount;
  late final List<Products> products;
  late final List<Payments> payments;
  
  Sells.fromJson(Map<String, dynamic> json){
    locationId = json['location_id'];
    contactId = json['contact_id'];
    transactionDate = json['transaction_date'];
    discountAmount = json['discount_amount'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    payments = List.from(json['payments']).map((e)=>Payments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location_id'] = locationId;
    _data['contact_id'] = contactId;
    _data['transaction_date'] = transactionDate;
    _data['discount_amount'] = discountAmount;
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['payments'] = payments.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.unitPrice,
  });
  late final int productId;
  late final int variationId;
  late final int quantity;
  late final String unitPrice;
  
  Products.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['variation_id'] = variationId;
    _data['quantity'] = quantity;
    _data['unit_price'] = unitPrice;
    return _data;
  }
}

class Payments {
  Payments({
    required this.amount,
    required this.method,
  });
  late final String amount;
  late final String method;
  
  Payments.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['method'] = method;
    return _data;
  }
}