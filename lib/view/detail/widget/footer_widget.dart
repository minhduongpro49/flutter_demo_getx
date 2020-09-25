import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemogetx/view/detail/detail_controllder.dart';
import 'package:get/get.dart';

class FooterWidget extends GetWidget {
  DetailController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(() => Text(_controller.count.value.toString(),
            style: TextStyle(fontSize: 100, color: Colors.deepOrangeAccent))));
  }
}
