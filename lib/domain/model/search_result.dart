import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  @JsonKey(name: "total_count")
  final int totalCount;
  @JsonKey(name: "items")
  final List<SearchResultItem> items;

  SearchResult({this.items, this.totalCount});

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
