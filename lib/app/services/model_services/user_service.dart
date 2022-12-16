import 'dart:convert';

import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/utils/app_constant.dart';
import 'package:http/http.dart' as http;

class UserService {
  // get all user
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('${constant.apiUrl}/users'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => User.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load user');
    }
  }
}

UserService userService = UserService();
