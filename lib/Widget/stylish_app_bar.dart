import 'package:flutter/material.dart';

class StylishAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StylishAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/Image_Logo.png',
          fit: BoxFit.contain,
          height: 32,
        )
      ]),
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
    );
  }
}
