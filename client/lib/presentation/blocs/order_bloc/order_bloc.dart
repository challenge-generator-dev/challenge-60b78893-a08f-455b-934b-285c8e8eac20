import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_orders.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrders getOrders;

  OrderBloc({required this.getOrders}) : super(const OrderInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<RefreshOrders>(_onRefreshOrders);
    on<ClearOrderError>(_onClearOrderError);
  }

  Future<void> _onLoadOrders(LoadOrders event, Emitter<OrderState> emit) async {
    emit(const OrderLoading());
    try {
      final orderList = await getOrders();
      emit(OrderLoaded(
        orders: orderList.orders,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(OrderError(
        message: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _onRefreshOrders(RefreshOrders event, Emitter<OrderState> emit) async {
    try {
      final orderList = await getOrders();
      emit(OrderLoaded(
        orders: orderList.orders,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(OrderError(
        message: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  void _onClearOrderError(ClearOrderError event, Emitter<OrderState> emit) {
    emit(const OrderInitial());
  }
}