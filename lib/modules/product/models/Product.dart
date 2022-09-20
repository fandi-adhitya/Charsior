
part of '../product.dart';
class Product {
  Product({
    required this.data,
  });
  late final List<ProductData> data;
  
  Product.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>ProductData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductData {
  ProductData({
    required this.id,
    required this.name,
    required this.businessId,
    required this.type,
     this.subUnitIds,
    required this.enableStock,
     this.alertQuantity,
    required this.sku,
    required this.barcodeType,
     this.expiryPeriod,
     this.expiryPeriodType,
    required this.enableSrNo,
     this.weight,
     this.productCustomField1,
     this.productCustomField2,
     this.productCustomField3,
     this.productCustomField4,
     this.image,
     this.productDescription,
    required this.createdBy,
     this.warrantyId,
    required this.isInactive,
    required this.notForSelling,
    required this.imageUrl,
    required this.productVariations,
     this.brand,
    required this.unit,
     this.category,
     this.subCategory,
     this.productTax,
    required this.productLocations,
  });
  late final int id;
  late final String name;
  late final int businessId;
  late final String type;
  late final Null subUnitIds;
  late final int enableStock;
  late final String? alertQuantity;
  late final String sku;
  late final String barcodeType;
  late final Null expiryPeriod;
  late final Null expiryPeriodType;
  late final int enableSrNo;
  late final Null weight;
  late final Null productCustomField1;
  late final Null productCustomField2;
  late final Null productCustomField3;
  late final Null productCustomField4;
  late final Null image;
  late final String? productDescription;
  late final int createdBy;
  late final Null warrantyId;
  late final int isInactive;
  late final int notForSelling;
  late final String imageUrl;
  late final List<ProductVariations> productVariations;
  late final Null brand;
  late final Unit unit;
  late final Category? category;
  late final SubCategory? subCategory;
  late final Null productTax;
  late final List<ProductLocations> productLocations;
  
  ProductData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    businessId = json['business_id'];
    type = json['type'];
    subUnitIds = null;
    enableStock = json['enable_stock'];
    alertQuantity = null;
    sku = json['sku'];
    barcodeType = json['barcode_type'];
    expiryPeriod = null;
    expiryPeriodType = null;
    enableSrNo = json['enable_sr_no'];
    weight = null;
    productCustomField1 = null;
    productCustomField2 = null;
    productCustomField3 = null;
    productCustomField4 = null;
    image = null;
    productDescription = null;
    createdBy = json['created_by'];
    warrantyId = null;
    isInactive = json['is_inactive'];
    notForSelling = json['not_for_selling'];
    imageUrl = json['image_url'];
    productVariations = List.from(json['product_variations']).map((e)=>ProductVariations.fromJson(e)).toList();
    brand = null;
    unit = Unit.fromJson(json['unit']);
    category = null;
    subCategory = null;
    productTax = null;
    productLocations = List.from(json['product_locations']).map((e)=>ProductLocations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['business_id'] = businessId;
    _data['type'] = type;
    _data['sub_unit_ids'] = subUnitIds;
    _data['enable_stock'] = enableStock;
    _data['alert_quantity'] = alertQuantity;
    _data['sku'] = sku;
    _data['barcode_type'] = barcodeType;
    _data['expiry_period'] = expiryPeriod;
    _data['expiry_period_type'] = expiryPeriodType;
    _data['enable_sr_no'] = enableSrNo;
    _data['weight'] = weight;
    _data['product_custom_field1'] = productCustomField1;
    _data['product_custom_field2'] = productCustomField2;
    _data['product_custom_field3'] = productCustomField3;
    _data['product_custom_field4'] = productCustomField4;
    _data['image'] = image;
    _data['product_description'] = productDescription;
    _data['created_by'] = createdBy;
    _data['warranty_id'] = warrantyId;
    _data['is_inactive'] = isInactive;
    _data['not_for_selling'] = notForSelling;
    _data['image_url'] = imageUrl;
    _data['product_variations'] = productVariations.map((e)=>e.toJson()).toList();
    _data['brand'] = brand;
    _data['unit'] = unit.toJson();
    _data['category'] = category;
    _data['sub_category'] = subCategory;
    _data['product_tax'] = productTax;
    _data['product_locations'] = productLocations.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductVariations {
  ProductVariations({
    required this.id,
     this.variationTemplateId,
    required this.name,
    required this.productId,
    required this.isDummy,
    required this.createdAt,
    required this.updatedAt,
    required this.variations,
  });
  late final int id;
  late final int? variationTemplateId;
  late final String name;
  late final int productId;
  late final int isDummy;
  late final String createdAt;
  late final String updatedAt;
  late final List<Variations> variations;
  
  ProductVariations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    variationTemplateId = null;
    name = json['name'];
    productId = json['product_id'];
    isDummy = json['is_dummy'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    variations = List.from(json['variations']).map((e)=>Variations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['variation_template_id'] = variationTemplateId;
    _data['name'] = name;
    _data['product_id'] = productId;
    _data['is_dummy'] = isDummy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['variations'] = variations.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Variations {
  Variations({
    required this.id,
    required this.name,
    required this.productId,
    required this.subSku,
    required this.productVariationId,
     this.variationValueId,
    required this.defaultPurchasePrice,
    required this.dppIncTax,
    required this.profitPercent,
    required this.defaultSellPrice,
    required this.sellPriceIncTax,
    required this.createdAt,
    required this.updatedAt,
     this.deletedAt,
     this.comboVariations,
    required this.variationLocationDetails,
    required this.media,
    required this.discounts,
  });
  late final int id;
  late final String name;
  late final int productId;
  late final String subSku;
  late final int productVariationId;
  late final int? variationValueId;
  late final String defaultPurchasePrice;
  late final String dppIncTax;
  late final String profitPercent;
  late final String defaultSellPrice;
  late final String sellPriceIncTax;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final List<dynamic>? comboVariations;
  late final List<VariationLocationDetails> variationLocationDetails;
  late final List<dynamic> media;
  late final List<dynamic> discounts;
  
  Variations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    subSku = json['sub_sku'];
    productVariationId = json['product_variation_id'];
    variationValueId = null;
    defaultPurchasePrice = json['default_purchase_price'];
    dppIncTax = json['dpp_inc_tax'];
    profitPercent = json['profit_percent'];
    defaultSellPrice = json['default_sell_price'];
    sellPriceIncTax = json['sell_price_inc_tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    comboVariations = null;
    variationLocationDetails = List.from(json['variation_location_details']).map((e)=>VariationLocationDetails.fromJson(e)).toList();
    media = List.castFrom<dynamic, dynamic>(json['media']);
    discounts = List.castFrom<dynamic, dynamic>(json['discounts']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['product_id'] = productId;
    _data['sub_sku'] = subSku;
    _data['product_variation_id'] = productVariationId;
    _data['variation_value_id'] = variationValueId;
    _data['default_purchase_price'] = defaultPurchasePrice;
    _data['dpp_inc_tax'] = dppIncTax;
    _data['profit_percent'] = profitPercent;
    _data['default_sell_price'] = defaultSellPrice;
    _data['sell_price_inc_tax'] = sellPriceIncTax;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['combo_variations'] = comboVariations;
    _data['variation_location_details'] = variationLocationDetails.map((e)=>e.toJson()).toList();
    _data['media'] = media;
    _data['discounts'] = discounts;
    return _data;
  }
}

class VariationLocationDetails {
  VariationLocationDetails({
    required this.id,
    required this.productId,
    required this.productVariationId,
    required this.variationId,
    required this.locationId,
    required this.qtyAvailable,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int productId;
  late final int productVariationId;
  late final int variationId;
  late final int locationId;
  late final String qtyAvailable;
  late final String createdAt;
  late final String updatedAt;
  
  VariationLocationDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    productVariationId = json['product_variation_id'];
    variationId = json['variation_id'];
    locationId = json['location_id'];
    qtyAvailable = json['qty_available'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['product_variation_id'] = productVariationId;
    _data['variation_id'] = variationId;
    _data['location_id'] = locationId;
    _data['qty_available'] = qtyAvailable;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Unit {
  Unit({
    required this.id,
    required this.businessId,
    required this.actualName,
    required this.shortName,
    required this.allowDecimal,
     this.baseUnitId,
     this.baseUnitMultiplier,
    required this.createdBy,
     this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int businessId;
  late final String actualName;
  late final String shortName;
  late final int allowDecimal;
  late final Null baseUnitId;
  late final Null baseUnitMultiplier;
  late final int createdBy;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  
  Unit.fromJson(Map<String, dynamic> json){
    id = json['id'];
    businessId = json['business_id'];
    actualName = json['actual_name'];
    shortName = json['short_name'];
    allowDecimal = json['allow_decimal'];
    baseUnitId = null;
    baseUnitMultiplier = null;
    createdBy = json['created_by'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['business_id'] = businessId;
    _data['actual_name'] = actualName;
    _data['short_name'] = shortName;
    _data['allow_decimal'] = allowDecimal;
    _data['base_unit_id'] = baseUnitId;
    _data['base_unit_multiplier'] = baseUnitMultiplier;
    _data['created_by'] = createdBy;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.businessId,
     this.shortCode,
    required this.parentId,
    required this.createdBy,
    required this.categoryType,
     this.description,
     this.slug,
     this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int businessId;
  late final Null shortCode;
  late final int parentId;
  late final int createdBy;
  late final String categoryType;
  late final Null description;
  late final Null slug;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  
  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    businessId = json['business_id'];
    shortCode = null;
    parentId = json['parent_id'];
    createdBy = json['created_by'];
    categoryType = json['category_type'];
    description = null;
    slug = null;
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['business_id'] = businessId;
    _data['short_code'] = shortCode;
    _data['parent_id'] = parentId;
    _data['created_by'] = createdBy;
    _data['category_type'] = categoryType;
    _data['description'] = description;
    _data['slug'] = slug;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.businessId,
     this.shortCode,
    required this.parentId,
    required this.createdBy,
    required this.categoryType,
     this.description,
     this.slug,
     this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int businessId;
  late final Null shortCode;
  late final int parentId;
  late final int createdBy;
  late final String categoryType;
  late final Null description;
  late final Null slug;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  
  SubCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    businessId = json['business_id'];
    shortCode = null;
    parentId = json['parent_id'];
    createdBy = json['created_by'];
    categoryType = json['category_type'];
    description = null;
    slug = null;
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['business_id'] = businessId;
    _data['short_code'] = shortCode;
    _data['parent_id'] = parentId;
    _data['created_by'] = createdBy;
    _data['category_type'] = categoryType;
    _data['description'] = description;
    _data['slug'] = slug;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ProductLocations {
  ProductLocations({
    required this.id,
    required this.businessId,
    required this.locationId,
    required this.name,
    required this.landmark,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.invoiceSchemeId,
    required this.invoiceLayoutId,
    required this.saleInvoiceLayoutId,
     this.sellingPriceGroupId,
    required this.printReceiptOnInvoice,
    required this.receiptPrinterType,
     this.printerId,
    required this.mobile,
    required this.alternateNumber,
    required this.email,
    required this.website,
     this.featuredProducts,
    required this.isActive,
    required this.defaultPaymentAccounts,
     this.customField1,
     this.customField2,
     this.customField3,
     this.customField4,
     this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });
  late final int id;
  late final int businessId;
  late final String locationId;
  late final String name;
  late final String landmark;
  late final String country;
  late final String state;
  late final String city;
  late final String zipCode;
  late final int invoiceSchemeId;
  late final int invoiceLayoutId;
  late final int saleInvoiceLayoutId;
  late final Null sellingPriceGroupId;
  late final int printReceiptOnInvoice;
  late final String receiptPrinterType;
  late final Null printerId;
  late final String mobile;
  late final String alternateNumber;
  late final String email;
  late final String website;
  late final Null featuredProducts;
  late final int isActive;
  late final String defaultPaymentAccounts;
  late final Null customField1;
  late final Null customField2;
  late final Null customField3;
  late final Null customField4;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  late final Pivot pivot;
  
  ProductLocations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    businessId = json['business_id'];
    locationId = json['location_id'];
    name = json['name'];
    landmark = json['landmark'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    invoiceSchemeId = json['invoice_scheme_id'];
    invoiceLayoutId = json['invoice_layout_id'];
    saleInvoiceLayoutId = json['sale_invoice_layout_id'];
    sellingPriceGroupId = null;
    printReceiptOnInvoice = json['print_receipt_on_invoice'];
    receiptPrinterType = json['receipt_printer_type'];
    printerId = null;
    mobile = json['mobile'];
    alternateNumber = json['alternate_number'];
    email = json['email'];
    website = json['website'];
    featuredProducts = null;
    isActive = json['is_active'];
    defaultPaymentAccounts = json['default_payment_accounts'];
    customField1 = null;
    customField2 = null;
    customField3 = null;
    customField4 = null;
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['business_id'] = businessId;
    _data['location_id'] = locationId;
    _data['name'] = name;
    _data['landmark'] = landmark;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['zip_code'] = zipCode;
    _data['invoice_scheme_id'] = invoiceSchemeId;
    _data['invoice_layout_id'] = invoiceLayoutId;
    _data['sale_invoice_layout_id'] = saleInvoiceLayoutId;
    _data['selling_price_group_id'] = sellingPriceGroupId;
    _data['print_receipt_on_invoice'] = printReceiptOnInvoice;
    _data['receipt_printer_type'] = receiptPrinterType;
    _data['printer_id'] = printerId;
    _data['mobile'] = mobile;
    _data['alternate_number'] = alternateNumber;
    _data['email'] = email;
    _data['website'] = website;
    _data['featured_products'] = featuredProducts;
    _data['is_active'] = isActive;
    _data['default_payment_accounts'] = defaultPaymentAccounts;
    _data['custom_field1'] = customField1;
    _data['custom_field2'] = customField2;
    _data['custom_field3'] = customField3;
    _data['custom_field4'] = customField4;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.productId,
    required this.locationId,
  });
  late final int productId;
  late final int locationId;
  
  Pivot.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['location_id'] = locationId;
    return _data;
  }
}