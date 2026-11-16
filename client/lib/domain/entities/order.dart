import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String productId;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object?> get props => [productId, quantity, price];

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final qty = json['quantity'] as int;
    final prc = (json['price'] as num).toDouble();
    if (qty <= 0) {
      throw ArgumentError('Quantity must be greater than 0');
    }
    if (prc < 0) {
      throw ArgumentError('Price cannot be negative');
    }
    return OrderItem(
      productId: json['productId'] as String,
      quantity: qty,
      price: prc,
    );
  }
}

class Order extends Equatable {
  final String id;
  final String customerId;
  final List<OrderItem> items;
  final String status;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.customerId,
    required this.items,
    required this.status,
    required this.createdAt,
  });

  double get totalPrice {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  List<Object?> get props => [id, customerId, items, status, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'items': items.map((item) => item.toJson()).toList(),
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    final orderItems = (json['items'] as List<dynamic>)
        .map((itemJson) => OrderItem.fromJson(itemJson as Map<String, dynamic>))
        .toList();
    if (orderItems.isEmpty) {
      throw ArgumentError('Order must have at least one item');
    }
    final orderStatus = json['status'] as String;
    if (orderStatus.isEmpty) {
      throw ArgumentError('Status cannot be empty');
    }
    return Order(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      items: orderItems,
      status: orderStatus,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

class OrderList extends Equatable {
  final List<Order> orders;

  const OrderList({required this.orders});

  @override
  List<Object?> get props => [orders];

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((order) => order.toJson()).toList(),
    };
  }

  factory OrderList.fromJson(Map<String, dynamic> json) {
    return OrderList(
      orders: (json['orders'] as List<dynamic>)
          .map((orderJson) => Order.fromJson(orderJson as Map<String, dynamic>))
          .toList(),
    );
  }
}