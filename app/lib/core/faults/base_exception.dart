import 'package:external_dependencies/external_dependencies.dart';

typedef ExceptionObserver = void Function(BaseException exception);

abstract class BaseException extends Equatable implements Exception {
  BaseException({
    required this.type,
    this.debugInfo,
    this.debugData,
    this.message,
  }) {
    observer?.call(this);
  }

  final ExceptionType type;
  final String? message;
  final String? debugInfo;
  final dynamic debugData;

  static ExceptionObserver? observer;

  @override
  List<Object> get props => [type];

  @override
  String toString() => '''
  [BaseException - $type] $debugInfo.
  Debug Data: $debugData
  ''';
}

//Can be used in the future features when will request remote data
enum ExceptionType {
  serverError,
  notFound,
  unauthorized,
}
