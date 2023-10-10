import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/screens/home/contacts/contacts_item_widget.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'empty_contacts.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'Contacts',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: AppTextFormField(
              controller: controller.searchController,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)),
              hintText: 'Search',
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => controller.loadingContactsList.isTrue
                        ? const Center(child: CircularProgressIndicator())
                        : (controller.contacts.isNotEmpty)
                            ? ListView.builder(
                                itemCount: controller.contacts.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(top: 8.0.h),
                                  child: ContactsItemWidget(
                                    userModel: controller.contacts[index],
                                    index: index,
                                  ),
                                ),
                              )
                            : const Center(
                                child: EmptyContactsList(),
                              ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
