import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders({required this.repository});

  Future<OrderList> call() async {
    try {
      return await repository.getOrders();
    } catch (e) {
      throw Exception('Failed to fetch orders: ${e.toString()}');
    }
  }
}