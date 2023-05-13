import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabbedController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    // Initialize the TabController with 3 tabs
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    // Dispose of the TabController when the widget is removed from the widget tree
    tabController.dispose();
    super.onClose();
  }
}
