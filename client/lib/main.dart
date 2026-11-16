import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'data/datasources/order_remote_data_source.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/repositories/order_repository.dart';
import 'domain/usecases/get_orders.dart';
import 'presentation/blocs/order_bloc/order_bloc.dart';
import 'presentation/blocs/order_bloc/order_event.dart';
import 'presentation/blocs/order_bloc/order_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    const baseUrl = 'https://placeholder.execute-api.us-east-1.amazonaws.com';
    final orderRemoteDataSource = OrderRemoteDataSourceImpl(
      dio: dio,
      baseUrl: baseUrl,
    );
    final OrderRepository orderRepository = OrderRepositoryImpl(
      remoteDataSource: orderRemoteDataSource,
      dio: dio,
      baseUrl: baseUrl,
    );
    final getOrders = GetOrders(repository: orderRepository);

    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => OrderBloc(getOrders: getOrders),
        child: const OrderScreen(),
      ),
    );
  }
}

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderInitial) {
            context.read<OrderBloc>().add(const LoadOrders());
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<OrderBloc>().add(const RefreshOrders());
              },
              child: ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return ListTile(
                    title: Text('Order #${order.id}'),
                    subtitle: Text('Status: ${order.status}'),
                  );
                },
              ),
            );
          } else if (state is OrderError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<OrderBloc>().add(const ClearOrderError());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}