import 'package:flutter/material.dart';
import 'package:news_demo/theme.dart';

import 'next_button.dart';

class ActionCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData? icon;

  const ActionCard({super.key, required this.text, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon!,
                    color: primaryColor,
                  ),
                  SizedBox(width: 12),
                ],
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                Spacer(),
                const NextIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
