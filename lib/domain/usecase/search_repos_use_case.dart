import 'dart:async';

import 'package:flutterdemogetx/data/github_repository_implement.dart';
import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'base/base_use_case.dart';

class SearchReposUseCase
    extends UseCase<Tuple2<List<SearchResultItem>, int>, SearchReposInput> {
  final GithubRepositoryImplement _githubRepositoryImplement = Get.find();

  @override
  Future<Stream<Tuple2<List<SearchResultItem>, int>>> buildUseCaseStream(
      SearchReposInput input) async {
    final StreamController<Tuple2<List<SearchResultItem>, int>> controller =
        StreamController();
    try {
      controller.add(
          await _githubRepositoryImplement.searchRepo(input.query, input.page));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class SearchReposInput {
  int page;
  String query;

  SearchReposInput(this.query, this.page);
}
