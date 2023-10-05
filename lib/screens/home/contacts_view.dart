import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/contacts_item_widget.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
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
            onPressed: () {
              controller.changeAppMode();
            },
            icon: const Icon(Icons.swap_calls),
          ),
        ],
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
            child: Obx(
              () => controller.loadingContactsList.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : (controller.contacts.isNotEmpty)
                      ? ListView.builder(
                          itemCount: controller.contacts.length,
                          itemBuilder: (context, index) => ContactsItemWidget(
                            userModel: controller.contacts[index],
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.background,
                                width: MediaQuery.of(context).size.width * 0.6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'No Contacts Yet!\nInvite Your Friends',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
