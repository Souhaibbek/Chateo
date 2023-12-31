import 'package:cached_network_image/cached_network_image.dart';
import 'package:chateo/models/user_models.dart';
import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactHeader extends StatelessWidget {
  const ContactHeader({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0.w, 0.0.h, 0.0.w, 0.0.h),
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
                  image: CachedNetworkImageProvider(userModel.image),
                  fit: BoxFit.cover),
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
    );
  }
}
