import 'package:flutterdemogetx/data/remote/github_remote_data_srouce.dart';
import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:flutterdemogetx/domain/repository/github_repository.dart';
import 'package:tuple/tuple.dart';

class GithubRepositoryImplement implements GithubRepository {
  GitHubRemoteDataSource _remoteDataSource = GitHubRemoteDataSource();

  @override
  Future<Tuple2<List<SearchResultItem>, int>> searchRepo(
      String query, int page) {
    return _remoteDataSource.searchRepos(query, page);
  }
}
