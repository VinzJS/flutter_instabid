import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'product_repository.g.dart';

abstract class ProductRepository {
  TaskResult<PageResults<Product>> list({
    String? query,
    int? pageNo,
    int? pageSize,
  });
  TaskResult<Product> get(String id);
  TaskResult<void> delete(String id);
  TaskResult<Product> update(Product product, Map<String, dynamic> update);
  TaskResult<Product> create(Map<String, dynamic> payload);
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(
    dio: ref.read(dioProvider),
  );
}

class ProductRepositoryImpl implements ProductRepository {
  final Dio _dio;

  ProductRepositoryImpl({required Dio dio}) : _dio = dio;

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
  TaskResult<Product> update(Product product, Map<String, dynamic> update) {
    return TaskResult.tryCatch(
      () async {
        final updateMap = _convertPhotoToMultipartFile(update);
        final payload = FormData.fromMap(updateMap);

        final response = await _dio.patch(
          '${EndPoints.products}/${product.id}',
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Product.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Product> create(Map<String, dynamic> data) {
    return TaskResult.tryCatch(
      () async {
        final updateMap = _convertPhotoToMultipartFile(data);
        final payload = FormData.fromMap(updateMap);

        final response = await _dio.post(
          EndPoints.products,
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Product.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<void> delete(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.delete(
          '${EndPoints.products}/$id',
        );
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Product> get(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          '${EndPoints.products}/$id',
        );
        final map = Map<String, dynamic>.from(response.data);
        return Product.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<PageResults<Product>> list(
      {String? query, int? pageNo, int? pageSize}) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          EndPoints.products,
          queryParameters: {'filter': query},
        );
        final map = Map<String, dynamic>.from(response.data);
        return PageResults<Product>(
          items: map['items']?.map<Product>((e) {
                return Product.fromMap(e);
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
