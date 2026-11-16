abstract class OrderEvent {
  const OrderEvent();
}

class LoadOrders extends OrderEvent {
  const LoadOrders();
}

class RefreshOrders extends OrderEvent {
  const RefreshOrders();
}

class ClearOrderError extends OrderEvent {
  const ClearOrderError();
}