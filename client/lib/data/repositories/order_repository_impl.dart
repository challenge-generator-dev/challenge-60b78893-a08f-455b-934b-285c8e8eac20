import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final Dio dio;
  final String baseUrl;

  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.dio,
    required this.baseUrl,
  })  : assert(baseUrl.isNotEmpty, 'Base URL cannot be empty');

  @override
  Future<OrderList> getOrders() async {
    try {
      final orderList = await remoteDataSource.getOrders();
      return orderList;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Repository error: ${e.toString()}');
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return Exception('Unauthorized. Please login again.');
        } else if (statusCode == 403) {
          return Exception('Forbidden. You do not have permission.');
        } else if (statusCode == 404) {
          return Exception('Resource not found.');
        } else if (statusCode != null && statusCode >= 500) {
          return Exception('Server error. Please try again later.');
        }
        return Exception('Bad response: ${statusCode}');
      case DioExceptionType.cancel:
        return Exception('Request cancelled.');
      case DioExceptionType.connectionError:
        return Exception('No internet connection.');
      default:
        return Exception('Network error: ${e.message}');
    }
  }

  Future<Order?> getOrderById(String orderId) async {
    try {
      final orderList = await getOrders();
      return orderList.orders.firstWhere(
        (order) => order.id == orderId,
        orElse: () => throw Exception('Order not found'),
      );
    } catch (e) {
      if (e is Exception && e.toString().contains('Order not found')) {
        rethrow;
      }
      throw Exception('Failed to fetch order: ${e.toString()}');
    }
  }

  Future<List<Order>> getOrdersByCustomer(String customerId) async {
    try {
      final orderList = await getOrders();
      return orderList.orders
          .where((order) => order.customerId == customerId)
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch customer orders: ${e.toString()}');
    }
  }

  Future<List<Order>> getOrdersByStatus(String status) async {
    try {
      final orderList = await getOrders();
      return orderList.orders
          .where((order) => order.status.toLowerCase() == status.toLowerCase())
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch orders by status: ${e.toString()}');
    }
  }

  double calculateTotalRevenue(List<Order> orders) {
    return orders.fold(0.0, (sum, order) => sum + order.totalPrice);
  }

  Map<String, int> getOrderStatusDistribution(List<Order> orders) {
    final distribution = <String, int>{};
    for (final order in orders) {
      distribution[order.status] = (distribution[order.status] ?? 0) + 1;
    }
    return distribution;
  }
}