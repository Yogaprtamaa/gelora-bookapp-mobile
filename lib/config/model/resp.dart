import 'package:json_annotation/json_annotation.dart';

part 'resp.g.dart';

@JsonSerializable(explicitToJson: true)
class Resp {
  dynamic status;
  dynamic message;
  dynamic result;
  dynamic response;
  dynamic data;
  dynamic code;

  Resp({
    this.result,
    this.message,
    this.response,
    this.status,
    this.data,
    this.code,
  });

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);
  Map<String, dynamic> toJson() => _$RespToJson(this);

  @override
  String toString() =>
      'status = $status, response = $response, result = $result, message = $message, code = $code';
}
