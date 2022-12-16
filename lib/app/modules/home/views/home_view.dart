import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/modules/home/widgets/card_contact.dart';
import 'package:ceiba/app/modules/home/widgets/loading.dart';
import 'package:ceiba/app/utils/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        title: const Text('Prueba de Ingreso'),
        centerTitle: false,
        backgroundColor: palette.primary,
      ),
      body: Obx((() => Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: palette.primary,
              ))),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) => controller.onChangeSearch(value),
                      controller: controller.searchController,
                      decoration: const InputDecoration(
                        labelText: 'Buscar usuario',
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Obx((() => IconButton(
                        onPressed: () => controller.cancelSearch(),
                        icon: controller.isSearch.value
                            ? const Icon(Icons.cancel)
                            : const Icon(Icons.search),
                      ))),
                ],
              ),
            ),
            controller.loadingUsers.value
                ? const LoadingWidget()
                : Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.02, vertical: 20),
                        child: controller.users.isEmpty
                            ? const SizedBox(
                                height: 200,
                                child: Center(
                                  child: Text("List is empty"),
                                ),
                              )
                            : SmartRefresher(
                                enablePullDown: true,
                                controller: controller.refreshController,
                                onRefresh: () => controller.fetchUser(),
                                child: ListView(
                                  children: controller.users
                                      .map((element) => CardContact(
                                            controller: controller,
                                            user: element,
                                          ))
                                      .toList(),
                                ))),
                  )
          ]))),
    );
  }
}
