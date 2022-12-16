import 'package:ceiba/app/models/post.dart';
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/services/model_services/post_service.dart';
import 'package:ceiba/app/services/other_services/post_hive.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  User? user;

  final loading = false.obs;

  final postsAll = <Post>[].obs;
  final posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() async {
    loading.value = true;
    user = Get.arguments as User;

    // get from hive
    postsAll.value = await postHiveService.getPostsByUserId(user!.id!);

    if (postsAll.isEmpty) {
      // get from api
      final data = await postService.getPostsByUserId(user!.id!);
      postsAll.value = data;
    }
    posts.addAll(postsAll);
    saveUserLocal(postsAll);
    loading.value = false;
  }

  // method for save post in hive
  void saveUserLocal(postsToSave) {
    postHiveService.updateUsers(postsToSave);
  }
}
