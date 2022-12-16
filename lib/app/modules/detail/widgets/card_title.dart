import 'package:ceiba/app/modules/detail/controllers/detail_controller.dart';
import 'package:ceiba/app/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Container(
          height: 60,
          margin: const EdgeInsets.all(15),
          child: Row(children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: palette.primary))
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          controller.user!.name!,
                          style: TextStyle(
                              color: palette.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.phone,
                          color: palette.primary,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          controller.user!.phone!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.email,
                          color: palette.primary,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          controller.user!.email!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "${controller.posts.length} posts",
                          style: TextStyle(
                              color: palette.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
