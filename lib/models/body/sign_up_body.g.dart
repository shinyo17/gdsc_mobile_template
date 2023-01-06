// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpBody _$SignUpBodyFromJson(Map<String, dynamic> json) => SignUpBody(
      termsAcceptedAt: DateTime.parse(json['terms_accepted_at'] as String),
    );

Map<String, dynamic> _$SignUpBodyToJson(SignUpBody instance) =>
    <String, dynamic>{
      'terms_accepted_at': instance.termsAcceptedAt.toIso8601String(),
    };
