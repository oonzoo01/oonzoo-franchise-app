import 'package:flutter/material.dart';

class OnBoardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardAppbar({
    super.key,
    required this.headText,
  });

  final String headText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: 10),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      title: Text(
        headText,
        style: const TextStyle(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
