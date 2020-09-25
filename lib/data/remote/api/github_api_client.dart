import 'package:dio/dio.dart';
import 'package:flutterdemogetx/domain/model/search_result.dart';
import 'package:retrofit/http.dart';

part 'github_api_client.g.dart';

@RestApi(baseUrl: "https://api.github.com/")
abstract class GithubApiClient {
  factory GithubApiClient() {
    var dio = Dio();
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _GithubApiClient(dio);
  }

  @GET("search/repositories")
  Future<SearchResult> searchRepos(
      @Query("q") String queries, @Query("page") int page,
      {@Query("per_page") int perPage = 20});
}