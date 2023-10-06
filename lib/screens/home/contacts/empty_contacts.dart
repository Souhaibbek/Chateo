import 'package:chateo/utils/assets.dart';
import 'package:flutter/material.dart';

class EmptyContactsList extends StatelessWidget {
  const EmptyContactsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.background,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'No Contacts Yet!\nInvite Your Friends',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
