import 'package:flutter/material.dart';
import 'package:flutter_scroll_controller_animation/app/modules/home/views/scorll_animation_widget.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ScrollAnimationWidget();
  }
}
