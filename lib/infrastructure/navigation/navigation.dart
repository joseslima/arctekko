import 'package:arctekko/presentation/home/home.screen.dart';
import 'package:arctekko/presentation/photo/selectioned_photo.dart';
import 'package:arctekko/presentation/post/post.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers.dart';
import 'bindings/controllers/home.controller.binding.dart';
import 'bindings/controllers/post.controller.binding.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({@required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => EnvironmentsBadge(child: LoginScreen()),
      binding: LoginControllerBinding(),
    ),
    GetPage(
        name: Routes.PHOTO_GRID,
        page: () => EnvironmentsBadge(child: PhotoGridScreen()),
        binding: PhotoGridControllerBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => EnvironmentsBadge(child: HomeScreen()),
        binding: HomeControllerBinding()
    ),
    GetPage(
        name: Routes.POST,
        page: () => EnvironmentsBadge(child: PostScreen()),
        binding: PostControllerBinding()
    )
  ];
}
