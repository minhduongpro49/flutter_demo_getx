import 'package:json_annotation/json_annotation.dart';
import 'github_user.dart';

part 'search_result_item.g.dart';

@JsonSerializable()
class SearchResultItem {
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "owner")
  final GithubUser owner;

  SearchResultItem({this.fullName, this.htmlUrl, this.owner});

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}
