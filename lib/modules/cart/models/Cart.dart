part of '../cart.dart';
class Cart {
  
  Cart({
    required this.id,
    required this.name,
    required this.variation,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.variationId
  });

  late final int id;
  late final int variationId;
  late final String name;
  late final String variation;
  double price;
  int quantity;
  double totalPrice;
}