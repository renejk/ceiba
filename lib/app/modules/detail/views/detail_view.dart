import 'package:ceiba/app/modules/detail/widgets/card_post.dart';
import 'package:ceiba/app/modules/detail/widgets/card_title.dart';
import 'package:ceiba/app/modules/home/widgets/loading.dart';
import 'package:ceiba/app/utils/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx((() => Scaffold(
        backgroundColor: palette.background,
        body: controller.loading.value
            ? const LoadingWidget()
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    expandedHeight: Get.height * 0.31,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                          ClipRRect(child: CardTitle(controller: controller)),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  // lista de posts
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return PostCard(post: controller.posts[index]);
                      },
                      childCount: controller.posts.length,
                    ),
                  ),
                ],
              ))));
  }
}
