import 'package:flutter/material.dart';

class UserEventCard extends StatelessWidget {
  final VoidCallback? onTap;
  final ImageProvider image;
  final String title;
  final String role;
  final String date;

  const UserEventCard({
    super.key,
    required this.image,
    required this.title,
    required this.role,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0x7F333037),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0x7F333037),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image(
                  width: 48,
                  height: 48,
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
