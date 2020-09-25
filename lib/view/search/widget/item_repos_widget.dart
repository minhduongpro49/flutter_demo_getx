import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemogetx/domain/model/search_result_item.dart';
import 'package:get/get.dart';

class ItemReposWidget extends GetWidget {
  SearchResultItem item;

  ItemReposWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(item.owner.avatarUrl),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.fullName,
                  style: TextStyle(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Text(item.htmlUrl,
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis)
            ],
          ),
        )
      ],
    );
  }
}
