import 'package:flutter/material.dart';
import '../screens/home_screen.dart'; // <-- adjust path
import '../widgets/custom_app_bar.dart'; // adjust path if needed

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildNotificationCard({
    required String title,
    required String subtitle,
    required String time,
    IconData? icon,
    Color? iconColor,
    Color? badgeColor,
    String? badgeText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading circle icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: badgeColor ?? const Color(0xFFE0ECFF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: icon != null
                  ? Icon(icon, color: iconColor ?? Colors.blue, size: 22)
                  : Text(
                      (title.isNotEmpty ? title[0] : '?').toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
            ),
          ),

          const SizedBox(width: 10),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row (title + optional badge)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (badgeText != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDEBFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          badgeText,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D4ED8),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(title: "Voice Up"),
      body: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 16),
        children: [
          // ✅ Back button + Notifications text in SAME ROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back, size: 22),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          _buildNotificationCard(
            title: "RDA Department",
            subtitle:
                "We completely repaired the road issue you reported near the main junction. Thank you for informing us.",
            time: "10 min ago",
            icon: Icons.verified,
            iconColor: Colors.green,
            badgeColor: const Color(0xFFE6F4EA),
            badgeText: "Completed",
          ),

          _buildNotificationCard(
            title: "RDX Division",
            subtitle:
                "We considered your request and scheduled a field inspection for next week.",
            time: "45 min ago",
            icon: Icons.engineering,
            iconColor: Colors.orange,
            badgeColor: const Color(0xFFFFF4E5),
            badgeText: "In progress",
          ),

          _buildNotificationCard(
            title: "Community",
            subtitle:
                "1,000+ people liked your post about the broken road. Your voice is making a difference!",
            time: "2 hrs ago",
            icon: Icons.favorite,
            iconColor: Colors.redAccent,
          ),

          _buildNotificationCard(
            title: "RDA Department",
            subtitle:
                "We have added your issue to our priority maintenance list. You will be notified after completion.",
            time: "Yesterday",
            icon: Icons.add_road,
            iconColor: Colors.blueGrey,
          ),

          _buildNotificationCard(
            title: "RDX & RDA",
            subtitle:
                "Your recent reports helped us identify multiple critical spots nearby. Thank you for continuously reporting.",
            time: "2 days ago",
            icon: Icons.campaign,
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
