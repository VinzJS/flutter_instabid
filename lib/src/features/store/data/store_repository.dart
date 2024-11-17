import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'store_repository.g.dart';

abstract class StoreRepository {
  TaskResult<PageResults<StoreFront>> list({
    String? query,
    int? pageNo,
    int? pageSize,
  });
  TaskResult<StoreFront> get(String id);
  TaskResult<void> delete(String id);
  TaskResult<StoreFront> update(StoreFront store, Map<String, dynamic> update);
  TaskResult<StoreFront> create(Map<String, dynamic> payload);
}

@Riverpod(keepAlive: true)
StoreRepository storeRepository(Ref ref) {
  return StoreRepositoryImpl(
    dio: ref.read(dioProvider),
  );
}

class StoreRepositoryImpl implements StoreRepository {
  final Dio _dio;

  StoreRepositoryImpl({required Dio dio}) : _dio = dio;

  ///
  /// Convert XFile to MultipartFile since Dio doesn't support uploading via XFile
  ///
  Map<String, dynamic> _convertPhotoToMultipartFile(
      Map<String, dynamic> update) {
    final updateMap = {...update};
    final fieldOfPhoto = StoreField.displayImage;
    final photo = updateMap[fieldOfPhoto];
    if (photo is XFile) {
      final multipartFile = MultipartFile.fromFileSync(
        photo.path,
        filename: photo.name,
      );
      updateMap[fieldOfPhoto] = multipartFile;
    }
    return updateMap;
  }

  @override
  TaskResult<StoreFront> update(StoreFront store, Map<String, dynamic> update) {
    return TaskResult.tryCatch(
      () async {
        ///
        /// Create FormData
        ///

        final updateMap = _convertPhotoToMultipartFile(update);
        final payload = FormData.fromMap(updateMap);
        final response = await _dio.patch(
          '${EndPoints.stores}/${store.id}',
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return StoreFront.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<StoreFront> create(Map<String, dynamic> payload) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.post(
          EndPoints.stores,
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return StoreFront.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<void> delete(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.delete(
          '${EndPoints.categories}/$id',
        );
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<StoreFront> get(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          '${EndPoints.stores}/$id',
        );
        final map = Map<String, dynamic>.from(response.data);
        return StoreFront.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<PageResults<StoreFront>> list(
      {String? query, int? pageNo, int? pageSize}) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          EndPoints.stores,
          queryParameters: {'query': query},
        );
        final map = Map<String, dynamic>.from(response.data);
        return PageResults<StoreFront>(
          items: map['items']?.map<StoreFront>((e) {
                return StoreFront.fromMap(e);
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
