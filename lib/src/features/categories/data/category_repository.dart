import 'package:dio/dio.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'category_repository.g.dart';

abstract class CategoryRepository {
  TaskResult<PageResults<Category>> list({
    String? query,
    int? pageNo,
    int? pageSize,
  });
  TaskResult<Category> get(String id);
  TaskResult<void> delete(String id);
  TaskResult<Category> update(Category category, Map<String, dynamic> update);
  TaskResult<Category> create(Map<String, dynamic> payload);
}

@Riverpod(keepAlive: true)
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepositoryImpl(
    dio: ref.read(dioProvider),
  );
}

class CategoryRepositoryImpl implements CategoryRepository {
  final Dio _dio;

  CategoryRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  TaskResult<Category> update(Category category, Map<String, dynamic> update) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.patch(
          '${EndPoints.categories}/${category.id}',
          data: update,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Category.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Category> create(Map<String, dynamic> payload) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.post(
          EndPoints.categories,
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Category.fromMap(map);
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
  TaskResult<Category> get(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          '${EndPoints.categories}/$id',
        );
        final map = Map<String, dynamic>.from(response.data);
        return Category.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<PageResults<Category>> list(
      {String? query, int? pageNo, int? pageSize}) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          EndPoints.categories,
          queryParameters: {'query': query},
        );
        final map = Map<String, dynamic>.from(response.data);
        return PageResults<Category>(
          items: map['items']?.map<Category>((e) {
                return Category.fromMap(e);
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
