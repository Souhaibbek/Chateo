import 'package:chateo/routes/app_routes.dart';
import 'package:chateo/screens/home/home_controller.dart';
import 'package:chateo/utils/assets.dart';
import 'package:chateo/utils/text_field.dart';
import 'package:chateo/widgets/contacts_item_widget.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            onPressed: () async {
              var auth = FirebaseAuth.instance;
              await auth
                  .signOut()
                  .then((value) => Get.offAllNamed(AppRoutes.LOGIN));
            },
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
              () => controller.loadingUsersList.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : (controller.users.isNotEmpty)
                      ? ListView.builder(
                          itemCount: controller.users.length,
                          itemBuilder: (context, index) => ContactsItemWidget(
                            userModel: controller.users[index],
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
