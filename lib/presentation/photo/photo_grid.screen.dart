import 'package:arctekko/presentation/photo/selectioned_photo.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'controllers/photo_grid.controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoGridScreen extends GetView<PhotoGridController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photo Grid"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: GetX<PhotoGridController>(
            builder: (controller) {
              return GridView.builder(
                  itemCount: controller.photoListLength,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (context, index) {
                    var imageData = controller.getAt(index);
                    return InkWell(
                      onTap: () => controller.changeSelectedPhoto(index),
                      child: Hero(
                        tag:
                            "${imageData.id.toString() + imageData.albumId.toString()}",
                        child: CachedNetworkImage(
                            imageUrl: imageData.url,
                            placeholder: (context, url) =>
                                new CircularProgressIndicator()),
                      ),
                    );
                  });
            },
          ),
        ));
  }
}
