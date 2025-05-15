import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_response_model.g.dart';

@JsonSerializable()
class UsersResponseModel {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'data')
  List<UserModel>? data;
  @JsonKey(name: 'support')
  Support? support;

  UsersResponseModel({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) => _$UsersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseModelToJson(this);
}

@JsonSerializable()
class Support {
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'text')
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'avatar')
  String? avatar;

  UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}