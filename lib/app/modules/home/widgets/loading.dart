import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: Get.width * 0.02, vertical: 100),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
