import 'package:flutter/material.dart';

PersistentBottomSheetController<dynamic> showSettingBottomSheet(
    BuildContext context, Widget widget) {
  return showBottomSheet(
    elevation: 20,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) => widget,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.55,
    ),
  );
}
