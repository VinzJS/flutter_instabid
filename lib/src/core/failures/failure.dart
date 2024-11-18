import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';

part 'failure.mapper.dart';



@MappableClass()
class Failure with FailureMappable {
  final dynamic message;
  final StackTrace? stackTrace;
  final String? identifier;

  Failure([
    this.message,
    this.stackTrace,
    this.identifier,
  ]);

  Failure.presentation([
    this.message,
    this.stackTrace,
    this.identifier,
  ]);

  Failure.auth([
    this.message,
    this.stackTrace,
    this.identifier,
  ]);

  static Failure tryCatchData([
    dynamic message,
    StackTrace? stackTrace,
  ]) {
    return Failure(message, stackTrace);
  }

  static Failure tryCatchPresentation([
    dynamic message,
    StackTrace? stackTrace,
  ]) {
    return Failure(message, stackTrace);
  }

  static Failure tryCatchDomain([
    dynamic message,
    StackTrace? stackTrace,
  ]) {
    return Failure(message, stackTrace);
  }

  String get messageString {
    final error = message;
    var returnMessage = 'Something went wrong';

    ///
    ///  error message for network errors.
    ///
    if (error is DioException) {
      final dioMessage = 'Server Request has failed';
      final data = error.response?.data;
      returnMessage = data?['message'] ?? dioMessage;
    }

    return returnMessage;
  }

  static const fromMap = FailureMapper.fromMap;
  static const fromJson = FailureMapper.fromJson;
}
