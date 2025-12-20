import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  static const Color primary = Color(0xFF004C89);
  static const Color bg = Color(0xFFF3F6FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        title: const Text("About Us"),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              child: Column(
                children: const [
                  _HeaderCard(),
                  SizedBox(height: 14),

                  _InfoCard(
                    icon: Icons.flag_outlined,
                    title: "What is VOICE UP?",
                    body:
                        "VOICE UP is a civic reporting app that helps citizens report public infrastructure issues "
                        "like road damage, garbage problems, and safety concerns using text, images, and videos.",
                  ),
                  _InfoCard(
                    icon: Icons.volunteer_activism_outlined,
                    title: "Our Mission",
                    body:
                        "Our mission is to improve community well-being by making it easier for citizens to report issues, "
                        "and for responsible authorities to identify problems faster and respond more effectively.",
                  ),
                  _InfoCard(
                    icon: Icons.mic_none_outlined,
                    title: "What You Can Do",
                    body:
                        "• Report road damage, garbage issues, and safety concerns\n"
                        "• Attach photos/videos for better clarity\n"
                        "• Share accurate location to help prioritize action\n"
                        "• Track your requests and stay informed",
                  ),
                  _InfoCard(
                    icon: Icons.smart_toy_outlined,
                    title: "AI-Assisted Safety",
                    body:
                        "VOICE UP uses AI to help detect fake or abusive content, filter irrelevant submissions, and "
                        "support prioritization by severity and location. AI results are assistive and may not always be 100% accurate.",
                  ),
                  _InfoCard(
                    icon: Icons.verified_user_outlined,
                    title: "Community Guidelines",
                    body:
                        "We encourage respectful and responsible use. Please submit only real civic issues, avoid spam, "
                        "and do not upload offensive or political content.",
                  ),

                  SizedBox(height: 14),
                  _ContactCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [primary, primary.withOpacity(0.86), const Color(0xFF032744)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: const Icon(Icons.campaign_outlined, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "VOICE UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "A civic reporting platform to help improve your community.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.body,
  });

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: TextStyle(
                    height: 1.35,
                    fontSize: 13.5,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.support_agent_outlined,
            color: Colors.black.withOpacity(0.55),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Need help? Contact support from the app or email your team’s support address.",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
