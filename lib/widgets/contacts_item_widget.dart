import 'package:chateo/models/user_models.dart';
import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class ContactsItemWidget extends StatelessWidget {
  const ContactsItemWidget({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0.w, 16.0.h, 0.0.w, 16.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.kBlackColor,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage(userModel.image), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userModel.firstName.capitalize} ${userModel.lastName.capitalize}',
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                Text(
                  'Last seen yesterday',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
