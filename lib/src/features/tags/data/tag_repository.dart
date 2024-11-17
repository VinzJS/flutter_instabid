import 'package:dio/dio.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'tag_repository.g.dart';

abstract class TagRepository {
  TaskResult<PageResults<Tag>> list({
    String? query,
    int? pageNo,
    int? pageSize,
  });
  TaskResult<Tag> get(String id);
  TaskResult<void> delete(String id);
  TaskResult<Tag> update(Tag tag, Map<String, dynamic> update);
  TaskResult<Tag> create(Map<String, dynamic> payload);
}

@Riverpod(keepAlive: true)
TagRepository tagRepository(Ref ref) {
  return TagRepositoryImpl(
    dio: ref.read(dioProvider),
  );
}

class TagRepositoryImpl implements TagRepository {
  final Dio _dio;

  final String expand = '';

  TagRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  TaskResult<Tag> update(Tag tag, Map<String, dynamic> update) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.patch(
          '${EndPoints.tags}/${tag.id}',
          
          data: update,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Tag.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Tag> create(Map<String, dynamic> payload) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.post(
          EndPoints.tags,
          
          data: payload,
        );
        final map = Map<String, dynamic>.from(response.data);
        return Tag.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<void> delete(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.delete(
          '${EndPoints.tags}/$id',
        );
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<Tag> get(String id) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          '${EndPoints.tags}/$id',
          
        );
        final map = Map<String, dynamic>.from(response.data);
        return Tag.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<PageResults<Tag>> list(
      {String? query, int? pageNo, int? pageSize}) {
    return TaskResult.tryCatch(
      () async {
        final response = await _dio.get(
          EndPoints.tags,
          queryParameters: {'expand': expand, 'query': query},
        );
        final map = Map<String, dynamic>.from(response.data);
        return PageResults<Tag>(
          items: map['items']?.map<Tag>((e) {
                return Tag.fromMap(e);
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
