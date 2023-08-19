import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String header;
  final List<Widget> actions;

  const SecondaryAppBar({
    super.key,
    required this.header,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    actions.last = Padding(
      padding: const EdgeInsets.only(right: 20),
      child: actions.last,
    );

    return AppBar(
      toolbarHeight: 86,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Center(
          child: IconButton(
            icon: const Icon(Icomoon.back),
            onPressed: context.router.pop,
          ),
        ),
      ),
      title: Text(
        header,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      actionsIconTheme: const IconThemeData(color: Colors.black, size: 30),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
