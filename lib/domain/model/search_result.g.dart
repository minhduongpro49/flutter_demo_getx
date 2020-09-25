// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : SearchResultItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['total_count'] as int,
  );
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };
