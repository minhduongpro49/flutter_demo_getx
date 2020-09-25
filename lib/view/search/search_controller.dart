import 'package:flutter/cupertino.dart';
import 'package:flutterdemogetx/domain/model/process_state.dart';
import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:flutterdemogetx/domain/usecase/base/base_observer.dart';
import 'package:flutterdemogetx/domain/usecase/search_repos_use_case.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class SearchController extends GetxController {
  final SearchReposUseCase searchReposUseCase;
  final TextEditingController textEditingController = TextEditingController();
  var _query = RxString();
  var searchResultState = RxProcessState<List<SearchResultItem>>.init();

  SearchController({this.searchReposUseCase});

  @override
  void onInit() {
    super.onInit();
    initLiveSearch();
  }

  void initLiveSearch() {
    textEditingController.addListener(() {
      if (_query.value == textEditingController.text ||
          textEditingController.text.isNullOrBlank) return;
      _query.value = textEditingController.text;
    });
    debounce(_query, (_) => {searchRepo()}, time: Duration(seconds: 1));
  }

  void searchRepo({bool isLoadMore = false}) {
    if (searchResultState.isLoading()) return;

    searchReposUseCase.execute(
        BaseObserver()
          ..onSubscribe(() {
            if (isLoadMore)
              searchResultState.setLoadMore();
            else
              searchResultState.setFirstLoading();
          })
          ..onSuccess((Tuple2 data) {
            if (searchResultState.data.isNullOrBlank) {
              searchResultState.setSuccess(data.item1, nextPage: data.item2);
            } else {
              var finalData = searchResultState.data + data.item1;
              searchResultState.setSuccess(finalData, nextPage: data.item2);
            }
          })
          ..onError((error) {
            if (searchResultState.isFirstLoad()) {
              searchResultState.setError("error");
            }
          }),
        SearchReposInput(
            textEditingController.text, searchResultState.nextPage));
  }

  void goToDetail(SearchResultItem item) async {
    var message = await Get.toNamed("/detail", arguments: item);
    Get.snackbar("message", message);
  }

  @override
  void onClose() {
    searchResultState.close();
    _query.close();
    super.onClose();
  }
}
