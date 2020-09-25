import 'package:json_annotation/json_annotation.dart';

part 'github_user.g.dart';

@JsonSerializable()
class GithubUser {
  @JsonKey(name: "login")
  final String login;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  GithubUser({this.login, this.avatarUrl});

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
