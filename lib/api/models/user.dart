import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserEntity extends Equatable {
  final String username;
  final String email;
  final String userImage;
  final String id;

  const UserEntity({
    required this.username,
    required this.email,
    required this.id,
    required this.userImage,
  });

  static const UserEntity emptyUser =
      UserEntity(email: '', username: '', id: '', userImage: '');

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  List<Object?> get props => [email, userImage, username, id];

  UserEntity copyWith({
    String? username,
    String? email,
    String? userImage,
    String? id,
  }) {
    return UserEntity(
      username: username ?? this.username,
      id: id ?? this.id,
      email: email ?? this.email,
      userImage: userImage ?? this.userImage,
    );
  }
}
