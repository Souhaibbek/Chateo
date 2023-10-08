import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'circular_icon_widget.dart';

Widget settingsMenuItem(
  BuildContext context, {
  required String title,
  Color? iconColor,
  required void Function() onTap,
  required IconData icon,
  bool deleteMenu = false,
}) {
  var style = Theme.of(context);
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularIconWidget(
          icon: icon,
          onTap: () {},
          color: style.primaryColorLight,
          iconColor: iconColor ?? style.hintColor,
        ),
        SizedBox(
          width: 10.0.w,
        ),
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
            style: deleteMenu
                ? style.textTheme.headlineMedium!.copyWith(color: Colors.red)
                : style.textTheme.headlineMedium,
          ),
        ),
      ],
    ),
  );
}
