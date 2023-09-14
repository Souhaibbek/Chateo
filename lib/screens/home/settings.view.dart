import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Settings',
        actions: [
          IconButton(
            onPressed: () {
              controller.changeAppMode();
            },
            icon: Icon(
              Icons.swap_horizontal_circle_sharp,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
