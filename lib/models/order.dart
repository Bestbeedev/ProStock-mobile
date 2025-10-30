import 'product.dart';

class Order {
  final int id;
  final String status;
  final double totalAmount;
  final String? deliveryAddress;
  final String? paymentMethod;
  final int buyerId;
  final List<Product> products;

  Order({
    required this.id,
    required this.status,
    required this.totalAmount,
    this.deliveryAddress,
    this.paymentMethod,
    required this.buyerId,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    status: json['status'],
    totalAmount: (json['totalAmount'] as num).toDouble(),
    deliveryAddress: json['deliveryAddress'],
    paymentMethod: json['paymentMethod'],
    buyerId: json['buyerId'] ?? json['buyer']['id'],
    products: (json['Products'] as List)
        .map((p) => Product.fromJson(p))
        .toList(),
  );
}
