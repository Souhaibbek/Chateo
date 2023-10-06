import 'package:chateo/models/user_models.dart';
import 'package:chateo/screens/home/contacts/contact_header.dart';
import 'package:chateo/screens/home/contacts/contact_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsItemWidget extends StatelessWidget {
  const ContactsItemWidget({
    super.key,
    required this.userModel,
    required this.index,
  });
  final UserModel userModel;

  final int index;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Text(''),
      onExpansionChanged: (expanded) {},
      shape: Border.all(color: Colors.transparent, width: 0),
      collapsedShape: Border.all(color: Colors.transparent, width: 0),
      title: ContactHeader(userModel: userModel),
      childrenPadding: EdgeInsets.fromLTRB(30.0.w, 0.0.h, 0.0.w, 0.0.h),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.0.w, 0.0.h, 20.0.w, 0.0.h),
          child: Row(
            children: [
              contactActionItem(
                context: context,
                title: 'Check profile',
                icon: Icons.person,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ContactProfileInfo(
                        userModel: userModel,
                      );
                    },
                  );
                },
              ),
              const Spacer(),
              contactActionItem(
                context: context,
                title: 'Send a message',
                icon: Icons.send,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell contactActionItem(
      {required BuildContext context,
      required String title,
      required IconData icon,
      required void Function()? onTap}) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
