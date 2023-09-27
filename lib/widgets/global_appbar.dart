import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.actions,
    this.leading,
    this.color,
  });

  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    return AppBar(
      backgroundColor: color,
      title: Text(
        title ?? '',
        style: style.textTheme.headlineMedium,
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
