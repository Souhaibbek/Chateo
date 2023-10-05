import 'package:chateo/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class AppearencePage extends StatelessWidget {
  const AppearencePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    var style = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appearence',
          style: style.textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.isDarkMode.isTrue
                  ? 'Theme Mode ( Dark )'
                  : 'Theme Mode ( Light )',
              style: style.textTheme.headlineMedium,
            ),
            DayNightSwitcherIcon(
              onLongPress: () {
                Get.snackbar('Notice', 'Click to change the theme mode',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(
                      seconds: 1,
                    ));
              },
              isDarkModeEnabled: controller.isDarkMode.value,
              onStateChanged: (isDarkModeEnabled) {
                controller.changeAppMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
