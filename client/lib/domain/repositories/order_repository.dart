import '../entities/order.dart';

abstract class OrderRepository {
  Future<OrderList> getOrders();
}