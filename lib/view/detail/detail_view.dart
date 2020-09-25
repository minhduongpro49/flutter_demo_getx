import 'package:flutter/material.dart';
import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:flutterdemogetx/view/detail/widget/footer_widget.dart';
import 'package:get/get.dart';

import 'detail_controllder.dart';

class DetailPage extends GetWidget<DetailController> {
  SearchResultItem _item = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.back(result: "Back Success");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Detail Page"), centerTitle: true),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildDetailItem(),
          FooterWidget(),
          _buildIncreaseButton()
        ]),
      ),
    );
  }

  Widget _buildDetailItem() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(_item.owner.avatarUrl),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_item.fullName,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(_item.htmlUrl,
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncreaseButton() {
    return RaisedButton(
      onPressed: () {
        controller.increaseCount();
      },
      color: Colors.cyanAccent,
      child: SizedBox(
          width: 200, height: 50, child: Center(child: Text("Plus One"))),
    );
  }
}
