import 'package:ceiba/app/models/post.dart';
import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/utils/app_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // init hive database
  await Hive.initFlutter();
  // register adapter for models
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(GeoAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(PostAdapter());
  // open box for models
  await Hive.openBox<User>(constant.hiveBoxNameUsers);
  await Hive.openBox<Post>(constant.hiveBoxNamePosts);
  runApp(
    // init app with GetMaterialApp
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
