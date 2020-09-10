import 'package:arctekko/infrastructure/dal/services/photo/dto/photo_data.dart';
import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/photo_grid.controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelectionedPhotoScreen extends GetView<PhotoGridController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Selected"),
        ),
        body: SafeArea(
          child: GetX<PhotoGridController>(
            builder: (controller) {
              PhotoData selectionedPhoto = controller.getSelectionedPhoto();
              return Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: Hero(
                      tag:
                          "${selectionedPhoto.id.toString() + selectionedPhoto.albumId.toString()}",
                      child: ExtendedImage.network(
                        controller.getSelectionedPhoto().url,
                        fit: BoxFit.contain,
                        //enableLoadState: false,
                        mode: ExtendedImageMode.gesture,
                        initGestureConfigHandler: (state) {
                          return GestureConfig(
                            minScale: 0.9,
                            animationMinScale: 0.7,
                            maxScale: 3.0,
                            animationMaxScale: 3.5,
                            speed: 1.0,
                            inertialSpeed: 100.0,
                            initialScale: 1.0,
                            inPageView: false,
                            initialAlignment: InitialAlignment.center,
                          );
                        },
                      ),
                    ),
                  ))
                ],
              );
              // return Text("${controller.getSelectionedPhoto().title}");
            },
          ),
        ));
  }
}
