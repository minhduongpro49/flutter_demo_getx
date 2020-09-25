import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:tuple/tuple.dart';

abstract class GithubRepository {
  Future<Tuple2<List<SearchResultItem>, int>> searchRepo(
      String query, int page);
}
