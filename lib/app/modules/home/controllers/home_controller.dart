import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/routes/app_pages.dart';
import 'package:ceiba/app/services/model_services/user_service.dart';
import 'package:ceiba/app/services/other_services/user_hive.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  // list
  final users = <User>[].obs;
  final usersAll = <User>[].obs;

  // boolean
  final loadingUsers = false.obs;
  final isSearch = false.obs;

  // primitive
  final searchText = ''.obs;

  // controller
  TextEditingController searchController = TextEditingController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  // method for init controller
  @override
  void onInit() {
    super.onInit();
    initUser();
  }

  // method for charge data from api or hive
  void initUser() async {
    loadingUsers.value = true;
    if (userHiveService.box.isEmpty) {
      // get from api
      final data = await userService.getUsers();
      usersAll.value = data;
    } else {
      // get from hive
      usersAll.value = await userHiveService.getUsers();
    }
    users.addAll(usersAll);
    saveUserLocal(usersAll);

    loadingUsers.value = false;
  }

  // method for refresh data from api
  void fetchUser() async {
    final data = await userService.getUsers();
    usersAll.value = data;
    users.clear();
    users.addAll(usersAll);
    saveUserLocal(usersAll);
    onChangeSearch(searchText.value);
    refreshController.refreshCompleted(resetFooterState: false);
  }

  // method for search user
  void onChangeSearch(String value) {
    searchText.value = value;
    if (value.isNotEmpty) {
      isSearch.value = true;
      users.value = users
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      isSearch.value = false;
      users.clear();
      users.addAll(usersAll);
    }
  }

  // method for clear search
  void cancelSearch() {
    isSearch.value = false;
    searchController.clear();
    searchText.value = '';
    users.clear();
    users.addAll(usersAll);
  }

  // method for save user in hive
  void saveUserLocal(usersToSave) {
    userHiveService.updateUsers(usersToSave);
  }

  // method for go to detail user
  void goToDetailUser(User user) {
    Get.toNamed(Routes.DETAIL, arguments: user);
  }
}
