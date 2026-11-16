import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';

abstract class OrderRemoteDataSource {
  Future<OrderList> getOrders();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  OrderRemoteDataSourceImpl({required this.dio, required this.baseUrl});

  @override
  Future<OrderList> getOrders() async {
    try {
      final response = await dio.get('$baseUrl/orders');
      if (response.statusCode == 200) {
        final List<dynamic> ordersJson = response.data['orders'];
        final orders = ordersJson.map((json) => Order.fromJson(json)).toList();
        return OrderList(orders: orders);
      } else {
        throw Exception('Failed to load orders: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}