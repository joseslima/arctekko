import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'controller/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Selected"),
        ),
        body: SafeArea(
          child: Text("Ola"),
        ));
  }
}
