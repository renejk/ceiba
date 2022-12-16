import 'package:ceiba/app/models/post.dart';
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/utils/app_constant.dart';
import 'package:hive/hive.dart';

class PostHiveService {
  final box = Hive.box<Post>(constant.hiveBoxNamePosts);
  // get all post
  Future<List<Post>> getPosts() async {
    final response = box.values.toList();
    if (response.isNotEmpty) {
      return response.toList();
    } else {
      return [];
    }
  }

  // get all post by user id
  Future<List<Post>> getPostsByUserId(int id) async {
    final data = box.values.toList();
    final response = data.where((element) => element.userId == id).toList();
    if (response.isNotEmpty) {
      return response.toList();
    } else {
      return [];
    }
  }

  // add posts
  void addPost(List<Post> posts) {
    box.addAll(posts);
  }

  // delete all posts
  void deleteAllPost() {
    box.clear();
  }

  //update or add list of  posts
  void updateUsers(List<Post> posts) {
    box.putAll({for (var i = 0; i < posts.length; i++) posts[i].id: posts[i]});
  }
}

PostHiveService postHiveService = PostHiveService();
