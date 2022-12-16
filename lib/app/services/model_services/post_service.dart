import 'dart:convert';

import 'package:ceiba/app/models/post.dart';
import 'package:ceiba/app/utils/app_constant.dart';
import 'package:http/http.dart' as http;

class PostService {
  // get all post
  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('${constant.apiUrl}/posts'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  // get all post by user id
  Future<List<Post>> getPostsByUserId(int userId) async {
    final response =
        await http.get(Uri.parse('${constant.apiUrl}/posts?userId=$userId'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

PostService postService = PostService();
