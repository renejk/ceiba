import 'package:ceiba/app/models/user.dart';
import 'package:ceiba/app/modules/home/controllers/home_controller.dart';
import 'package:ceiba/app/utils/palette.dart';
import 'package:flutter/material.dart';

class CardContact extends StatelessWidget {
  const CardContact({
    Key? key,
    required this.user,
    required this.controller,
  }) : super(key: key);

  final User user;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      height: 100,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  user.name!,
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
                  user.phone!,
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
                  user.email!,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => controller.goToDetailUser(user),
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "VER PUBLICACIONES",
                    style: TextStyle(
                        color: palette.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
