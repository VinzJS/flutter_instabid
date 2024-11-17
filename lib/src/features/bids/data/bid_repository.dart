import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bid_repository.g.dart';

abstract class BidRepository {
  TaskResult<PageResults<Bid>> list({
    String? query,
    int? pageNo,
    int? pageSize,
  });
  TaskResult<Bid> get(String id);
  TaskResult<void> delete(String id);
  TaskResult<Bid> update(Bid bid, Map<String, dynamic> update);
  TaskResult<Bid> create(Map<String, dynamic> payload);
}

@Riverpod(keepAlive: true)
BidRepository bidRepository(Ref ref) {
  return BidRepositoryImpl(
    dio: ref.read(dioProvider),
  );
}

class BidRepositoryImpl implements BidRepository {
  final Dio _dio;

  BidRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  TaskResult<Bid> update(Bid bid, Map<String, dynamic> update) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.patch(
          '${EndPoints.bids}/${bid.id}',
          data: update,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Bid.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Bid> create(Map<String, dynamic> payload) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.post(
          EndPoints.bids,
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Bid.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<void> delete(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.delete(
          '${EndPoints.bids}/$id',
        );
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Bid> get(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          '${EndPoints.bids}/$id',
        );
        final map = Map<String, dynamic>.from(response.data);
        return Bid.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<PageResults<Bid>> list(
      {String? query, int? pageNo, int? pageSize}) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          EndPoints.bids,
          queryParameters: {'query': query},
        );
        final map = Map<String, dynamic>.from(response.data);
        return PageResults<Bid>(
          items: map['items']?.map<Bid>((e) {
                return Bid.fromMap(e);
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
