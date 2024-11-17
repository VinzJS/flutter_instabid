import 'package:dio/dio.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'order_repository.g.dart';

abstract class OrderRepository {
  TaskResult<PageResults<Order>> list({
    String? query,
    int? pageNo,
    int? pageSize,
  });
  TaskResult<Order> get(String id);
  TaskResult<void> delete(String id);
  TaskResult<Order> update(Order bid, Map<String, dynamic> update);
  TaskResult<Order> create(Map<String, dynamic> payload);
}

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  return OrderRepositoryImpl(
    dio: ref.read(dioProvider),
  );
}

class OrderRepositoryImpl implements OrderRepository {
  final Dio _dio;

  final String expand = '';

  OrderRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  TaskResult<Order> update(Order bid, Map<String, dynamic> update) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.patch(
          '${EndPoints.orders}/${bid.id}',
          data: update,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Order.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Order> create(Map<String, dynamic> payload) {
    return TaskResult.tryCatch(
      () async {
        // append the total amount
        final newPayload = Map<String, dynamic>.from({...payload});
        final price = newPayload[OrderField.price];
        final amount = newPayload[OrderField.amount];
        newPayload[OrderField.total] = price * amount;

        final response = await _dio.post(
          EndPoints.orders,
          data: newPayload,
        );
        final result = Map<String, dynamic>.from(response.data);
        return Order.fromMap(result);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<void> delete(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.delete(
          '${EndPoints.orders}/$id',
        );
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Order> get(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          '${EndPoints.orders}/$id',
        );
        final map = Map<String, dynamic>.from(response.data);
        return Order.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<PageResults<Order>> list(
      {String? query, int? pageNo, int? pageSize}) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          EndPoints.orders,
          queryParameters: {'expand': expand, 'query': query},
        );
        final map = Map<String, dynamic>.from(response.data);
        return PageResults<Order>(
          items: map['items']?.map<Order>((e) {
                return Order.fromMap(e);
              }).toList() ??
              [],
          page: map['page'],
          perPage: map['perPage'],
          totalItems: map['totalItems'],
          totalPages: map['totalPages'],
        );
      },
      Failure.tryCatchData,
    );
  }
}
