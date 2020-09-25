import 'package:flutter/material.dart';
import 'package:flutterdemogetx/domain/model/process_state.dart';
import 'package:flutterdemogetx/view/search/widget/item_repos_widget.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

import 'search_controller.dart';

class SearchPage extends GetWidget<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Repos Github"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            _buildSearchBar(context),
            Expanded(child: Obx(() => _buildListResult()))
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: TextField(controller: controller.textEditingController)),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              controller.searchRepo();
            },
          )
        ],
      ),
    );
  }

  Widget _buildListResult() {
    var state = controller.searchResultState;
    switch (state.status()) {
      case ProcessStatus.FIRST_LOAD:
        return Center(child: CircularProgressIndicator());
        break;
      case ProcessStatus.ERROR:
        // todo show error or nothing
        return Container();
      default:
        return state.data.isNull
            ? Container()
            : LoadMore(
                onLoadMore: () async {
                  controller.searchRepo(isLoadMore: true);
                  return true;
                },
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          controller.goToDetail(state.data[index]);
                        },
                        child: ItemReposWidget(item: state.data[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              );
    }
  }
}
