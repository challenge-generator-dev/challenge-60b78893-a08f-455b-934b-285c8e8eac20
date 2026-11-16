import '../../../domain/entities/order.dart';

abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  final DateTime lastUpdated;

  const OrderLoaded({
    required this.orders,
    required this.lastUpdated,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderLoaded &&
        other.orders == orders &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode => orders.hashCode ^ lastUpdated.hashCode;

  double get totalRevenue {
    return orders.fold(0, (sum, order) => sum + order.totalPrice);
  }

  int get totalOrders => orders.length;

  List<Order> get pendingOrders {
    return orders.where((order) => order.status == 'pending').toList();
  }

  List<Order> get completedOrders {
    return orders.where((order) => order.status == 'completed').toList();
  }

  Map<String, int> get ordersByStatus {
    final Map<String, int> statusCount = {};
    for (final order in orders) {
      statusCount[order.status] = (statusCount[order.status] ?? 0) + 1;
    }
    return statusCount;
  }
}

class OrderError extends OrderState {
  final String message;
  final DateTime timestamp;

  const OrderError({
    required this.message,
    required this.timestamp,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderError &&
        other.message == message &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => message.hashCode ^ timestamp.hashCode;

  String get userFriendlyMessage {
    if (message.contains('SocketException') || message.contains('HandshakeException')) {
      return 'No se pudo conectar al servidor. Verifica tu conexión a internet.';
    } else if (message.contains('TimeoutException')) {
      return 'La solicitud tardó demasiado. Intenta de nuevo.';
    } else if (message.contains('403') || message.contains('Unauthorized')) {
      return 'No tienes autorización para acceder a los pedidos.';
    } else if (message.contains('404') || message.contains('Not Found')) {
      return 'No se encontraron pedidos.';
    } else if (message.contains('500') || message.contains('Internal Server Error')) {
      return 'Error del servidor. Intenta más tarde.';
    }
    return 'Ocurrió un error al cargar los pedidos. Intenta de nuevo.';
  }

  bool get isNetworkError {
    return message.contains('SocketException') ||
        message.contains('HandshakeException') ||
        message.contains('TimeoutException');
  }

  bool get isRetryable {
    return isNetworkError || message.contains('500');
  }
}