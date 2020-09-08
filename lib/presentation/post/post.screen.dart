import 'package:arctekko/domain/post/models/post.model.dart';
import 'package:arctekko/domain/user/models/user.model.dart';
import 'package:arctekko/presentation/home/controller/home.controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(45, 136, 255, 3),
                          size: 20,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Post",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ],
                  )),
              GetX<HomeController>(
                builder: (controller) {
                  var post = controller.selectedPost;
                  var user = post.user;

                  var sizedBox = SizedBox(
                    height: 5,
                  );
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      userInfoWidget(user, sizedBox),
                      postWidget(post)
                    ],
                  );
                },
              )
            ])),
      ),
    ));
  }

  Padding postWidget(Post post) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(post.body))
        ],
      ),
    );
  }

  Padding userInfoWidget(User user, SizedBox sizedBox) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "@${user.username}",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          sizedBox,
          Text(
            user.name,
            style: TextStyle(color: Colors.black54),
          ),
          sizedBox,
          Text(
            user.email,
            style: TextStyle(color: Colors.black54),
          ),
          sizedBox,
          Text(
            user.phone,
            style: TextStyle(color: Colors.black54),
          )
        ]),
      ),
    );
  }
}
