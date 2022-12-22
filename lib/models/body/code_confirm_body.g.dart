// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_confirm_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeConfirmBody _$CodeConfirmBodyFromJson(Map<String, dynamic> json) =>
    CodeConfirmBody(
      phone: json['phone'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CodeConfirmBodyToJson(CodeConfirmBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
