import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    super.key,
    this.color = AppColors.kBackIcon,
    this.iconColor = AppColors.kWhitePure,
    required this.icon,
    required this.onTap,
  });

  final Color color;
  final Color iconColor;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
