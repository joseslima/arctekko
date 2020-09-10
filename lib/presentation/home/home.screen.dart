import 'package:arctekko/domain/post/models/post.model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PostBook",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(45, 136, 255, 3),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Feed:", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              GetX<HomeController>(
                builder: (controller) {
                  return controller.initialLoading
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Flexible(
                          child: SmartRefresher(
                            controller: controller.refreshController,
                            enablePullDown: true,
                            onRefresh: controller.getPosts,
                            child: ListView.builder(
                              itemCount: controller.postsLength,
                              itemBuilder: (context, index) {
                                Post post = controller.getPostAt(index);
                                return postCard(post);
                              },
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding postCard(Post post) {
    Text userNameWidget = Text("@${post.user.username}",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45));
    Text titleWidget = Text("${post.title}",
        style: TextStyle(color: Colors.black87, fontSize: 15));
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => {controller.goToPostPage(post)},
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 5), child: userNameWidget),
              titleWidget
            ],
          ),
        ),
      ),
    );
  }
}
