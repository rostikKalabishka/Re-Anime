// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      username: json['username'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      userImage: json['user_image'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'user_image': instance.userImage,
      'id': instance.id,
    };
