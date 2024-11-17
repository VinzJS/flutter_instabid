import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:instabid/src/_index.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FlutterSecureStorage storage;
  final Dio dio;
  final String idKey;
  final String tokenKey;

  AuthRepositoryImpl({
    required this.storage,
    required this.dio,
    required this.idKey,
    required this.tokenKey,
  });

  @override
  TaskResult<User> login({
    required String email,
    required String password,
  }) {
    return TaskResult.tryCatch(
      () async {
        final response = await dio.post(
          EndPoints.login,
          options: Options(
            headers: {'ignore_auth': true},
          ),
          data: {
            'identity': email.trim(),
            'password': password.trim(),
          },
        );

        final map = Map<String, dynamic>.from(response.data);
        await storage.write(
          key: tokenKey,
          value: map['token'],
        );
        final record = Map<String, dynamic>.from(map['record']);
        await storage.write(
          key: idKey,
          value: record['id'],
        );
        return User.fromMap(record);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<void> logout() {
    return TaskResult.tryCatch(() async {
      await storage.delete(key: idKey);
      await storage.delete(key: tokenKey);
    }, Failure.tryCatchData);
  }

  Map<String, dynamic> parse(String data) {
    int attempts = 0;
    var result = jsonDecode(data);
    while (attempts < 5) {
      try {
        result = Map<String, dynamic>.from(jsonDecode(result));
        if (result is Map) {
          return Map<String, dynamic>.from(result);
        }
      } catch (e) {
        // Handle the error if necessary or continue to retry
      }
      attempts++;
    }
    throw Failure(
      'Failed to parse data into a Map<String, dynamic> after 5 attempts ${result.runtimeType}',
    );
  }

  TaskResult<void> _refreshTokenAndSaveToLocal() {
    return TaskResult.tryCatch(
      () async {
        final response = await dio.post(EndPoints.refreshToken);
        final result = Map<String, dynamic>.from(response.data);
        await storage.write(
          key: tokenKey,
          value: result['token'],
        );

        final record = result['record'];
        await storage.write(
          key: idKey,
          value: record['id'],
        );
      },
      Failure.tryCatchData,
    );
  }

  TaskResult<User> _createUser({
    required String email,
    required String name,
    required String password,
    required String passwordConfirm,
  }) {
    return TaskResult.tryCatch(
      () async {
        /// check if email is valid
        if (!email.contains('@')) {
          throw Failure('email is not valid', StackTrace.current);
        }

        /// check if email is valid
        if (!email.contains('.')) {
          throw Failure('email is not valid', StackTrace.current);
        }

        /// passwords must match
        ///
        if (password != passwordConfirm) {
          throw Failure('passwords do not match', StackTrace.current);
        }

        /// passwords must be min 8 characters
        if (password.length < 8) {
          throw Failure('password must be min 8 chars', StackTrace.current);
        }

        final response = await dio.post(
          EndPoints.users,
          data: {
            'email': email.trim(),
            'name': name.trim(),
            'password': password.trim(),
            'isStoreOwner': false,
            'passwordConfirm': passwordConfirm,
            'storeLimit': 1,
          },
        );

        /// append email since its not returned by the api
        final map = Map<String, dynamic>.from({
          ...response.data,
          'email': email,
        });
        return User.fromMap(map);
      },
      Failure.tryCatchData,
    );
  }

  @override
  TaskResult<User> register({
    required String email,
    required String name,
    required String password,
    required String passwordConfirm,
  }) {
    return TaskResult.Do(($) async {
      final user = await $(_createUser(
        email: email,
        name: name,
        password: password,
        passwordConfirm: passwordConfirm,
      ));
      return await $(login(email: email, password: password));
    });
  }

  @override
  TaskResult<void> refresh() {
    return _refreshTokenAndSaveToLocal();
  }

  @override

  /// Returns the stored token in the storage.
  TaskResult<String> getToken() {
    return TaskResult.tryCatch(() async {
      final token = await storage.read(key: tokenKey);
      if (token == null) {
        throw 'token is null';
      }
      return token;
    }, Failure.tryCatchData);
  }

  @override
  TaskResult<String> getId() {
    return TaskResult.tryCatch(() async {
      final token = await storage.read(key: idKey);
      if (token == null) {
        throw 'id is null';
      }
      return token;
    }, Failure.tryCatchData);
  }
}
