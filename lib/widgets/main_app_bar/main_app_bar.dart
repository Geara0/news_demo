import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_demo/icomoon_icons.dart';
import 'package:news_demo/theme.dart';
import 'package:news_demo/widgets/colored_button/colored_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            const SizedBox(width: 24),
            SizedBox(
              height: 45,
              child: Image.asset(
                'assets/icon/icon.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const Spacer(),
            ColoredButton(
              height: 40,
              onPressed: () {},
              foregroundColor: Colors.black,
              backgroundColor: tertiaryColor,
              child: const Text('mainAppBar.about').tr(),
            ),
            const SizedBox(width: 6),
            Badge.count(
              count: 1,
              child: ColoredButton(
                height: 40,
                width: 40,
                onPressed: () {},
                padding: EdgeInsets.zero,
                foregroundColor: Colors.black,
                backgroundColor: tertiaryColor,
                child: const Icon(Icomoon.bell),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
