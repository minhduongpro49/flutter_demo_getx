import 'package:flutterdemogetx/domain/usecase/search_repos_use_case.dart';
import 'package:flutterdemogetx/view/search/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() {
      Get.put(SearchReposUseCase());
      return SearchController(searchReposUseCase: Get.find());
    });
  }
}
