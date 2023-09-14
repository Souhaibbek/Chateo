import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Contacts',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.w,
            ),
            child: AppTextFormField(
              controller: controller.searchController,
              hintText: 'Search',
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
    );
  }
}
