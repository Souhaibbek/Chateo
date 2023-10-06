import 'package:flutter/material.dart';

Widget accountInfoItem(
  BuildContext context, {
  required String title,
  required String value,
  Function()? onTap,
  bool mini = false,
}) {
  var style = Theme.of(context);

  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style.textTheme.bodyMedium!
                      .copyWith(color: style.hintColor),
                ),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: style.textTheme.bodyMedium!.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
          if (!mini)
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.edit,
                size: 20,
              ),
            ),
        ],
      ),
    ),
  );
}
