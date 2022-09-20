part of '../taxonomies.dart';

class Taxonomies {
  Taxonomies({
    required this.data,
  });
  late final List<Data> data;
  
  Taxonomies.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
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
    required this.subCategories,
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
  late final List<dynamic> subCategories;
  
  Data.fromJson(Map<String, dynamic> json){
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
    subCategories = List.castFrom<dynamic, dynamic>(json['sub_categories']);
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
    _data['sub_categories'] = subCategories;
    return _data;
  }
}