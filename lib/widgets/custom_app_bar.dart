import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voice_up/screens/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF004C89),
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,

      title: Row(
        children: [
          // === VOICE UP TEXT (MOVED 20px RIGHT) ===
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Spacer(),

          // === BELL ICON ===
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 26,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 10,
                top: 12,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          // === PROFILE CIRCLE ===
          Container(
            margin: const EdgeInsets.only(right: 14),
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
            child: const Center(
              child: Text(
                "R",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
