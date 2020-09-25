import 'package:flutterdemogetx/data/remote/api/github_api_client.dart';
import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class GitHubRemoteDataSource {
  GithubApiClient _client = Get.find();

  Future<Tuple2<List<SearchResultItem>, int>> searchRepos(
      String query, int page,
      {int perPage = 20}) {
    return _client.searchRepos(query, page, perPage: perPage).then((value) =>
        Tuple2(
            value.items, page == value.totalCount / perPage ? null : ++page));
  }
}
