import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';


typedef LoggerCallback = void Function(String command,Object data);

@freezed
class Request with _$Request {
  factory Request({
    required String command,
    LoggerCallback? onError,
    LoggerCallback? onResponse
  }) = _Request;
}