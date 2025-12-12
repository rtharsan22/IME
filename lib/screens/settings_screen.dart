import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // adjust path if needed
import '../screens/notifications_screen.dart'; // 👈 ADD THIS

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget buildPostCard({
    required String description,
    required String imagePath,
    required int likes,
    required int comments,
    required int shares,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =============== DESCRIPTION (only) ===============
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Description: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // =============== IMAGE ===============
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              imagePath,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 12),

          // =============== ICON ROW ===============
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_border),
                  const SizedBox(width: 4),
                  Text(likes.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.chat_bubble_outline),
                  const SizedBox(width: 4),
                  Text(comments.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.share),
                  const SizedBox(width: 4),
                  Text(shares.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _goToNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(title: "Voice Up"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _goToNotifications(context),
              child: buildPostCard(
                description:
                    "The public park's main gate is broken and needs repair. It's a safety concern for children playing.",
                imagePath: 'assets/images/post6.jpg',
                likes: 4200,
                comments: 85,
                shares: 30,
              ),
            ),
            GestureDetector(
              onTap: () => _goToNotifications(context),
              child: buildPostCard(
                description:
                    "Street lights are not working in most areas. Needs urgent attention.",
                imagePath: 'assets/images/post5.jpg',
                likes: 3200,
                comments: 42,
                shares: 12,
              ),
            ),
            GestureDetector(
              onTap: () => _goToNotifications(context),
              child: buildPostCard(
                description:
                    "The garbage collection has been delayed for over a week.",
                imagePath: 'assets/images/post7.jpg',
                likes: 5100,
                comments: 90,
                shares: 25,
              ),
            ),
            GestureDetector(
              onTap: () => _goToNotifications(context),
              child: buildPostCard(
                description:
                    "Road conditions are extremely poor. Multiple potholes everywhere.",
                imagePath: 'assets/images/post8.jpg',
                likes: 2200,
                comments: 35,
                shares: 10,
              ),
            ),
            GestureDetector(
              onTap: () => _goToNotifications(context),
              child: buildPostCard(
                description:
                    "Playground equipment is broken and unsafe for children.",
                imagePath: 'assets/images/post5.jpg',
                likes: 1800,
                comments: 22,
                shares: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
