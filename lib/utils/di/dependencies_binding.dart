import 'package:flutterdemogetx/data/github_repository_implement.dart';
import 'package:flutterdemogetx/data/remote/api/github_api_client.dart';
import 'package:get/get.dart';

class DependenciesBinding extends Bindings {
  @override
  void dependencies() {
    injectClient();
    injectRepository();
  }

  void injectClient() {
    Get.lazyPut<GithubApiClient>(() => GithubApiClient());
  }

  void injectRepository() {
    Get.lazyPut<GithubRepositoryImplement>(() => GithubRepositoryImplement());
  }
}
