// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resp _$RespFromJson(Map<String, dynamic> json) => Resp(
      result: json['result'],
      message: json['message'],
      response: json['response'],
      status: json['status'],
      data: json['data'],
      code: json['code'],
    );

Map<String, dynamic> _$RespToJson(Resp instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
      'response': instance.response,
      'data': instance.data,
      'code': instance.code,
    };
