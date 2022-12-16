import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/utils/app_constant.dart';
import 'package:hive/hive.dart';

class UserHiveService {
  final box = Hive.box<User>(constant.hiveBoxNameUsers);
  // get all user
  Future<List<User>> getUsers() async {
    final response = box.values.toList();
    if (response.isNotEmpty) {
      return response.toList();
    } else {
      return [];
    }
  }

  // add users
  void addUsers(List<User> users) {
    box.addAll(users);
  }

  // delete all users
  void deleteAllUsers() {
    box.clear();
  }

  //update or add list of  user
  void updateUsers(List<User> users) {
    box.putAll({for (var i = 0; i < users.length; i++) users[i].id: users[i]});
  }
}

UserHiveService userHiveService = UserHiveService();
