import 'package:flutter/material.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

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
        title: const Text("Policies"),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _HeaderCard(),
                  SizedBox(height: 14),

                  _PolicyCard(
                    number: "1",
                    title: "Privacy Policy",
                    body:
                        "We collect only necessary user data (account details, reports, location).\n\n"
                        "User data is used only for civic issue reporting and improvement of services.\n\n"
                        "Personal data is not sold or shared with third parties for commercial use.",
                  ),
                  _PolicyCard(
                    number: "2",
                    title: "Data Collection & Usage Policy",
                    body:
                        "Text, images, videos, and location data are collected to verify and process reports.\n\n"
                        "Data may be analyzed using AI to improve accuracy and prioritization.\n\n"
                        "Anonymized data may be used for research and system improvement.",
                  ),
                  _PolicyCard(
                    number: "3",
                    title: "AI Usage Policy",
                    body:
                        "AI is used to analyze reports, detect fake content, and prioritize issues.\n\n"
                        "AI decisions support moderation and do not fully replace human judgment.\n\n"
                        "Reports may be flagged or reviewed based on AI analysis.",
                  ),
                  _PolicyCard(
                    number: "4",
                    title: "Content Moderation Policy",
                    body:
                        "Abusive, hateful, misleading, or irrelevant content is not allowed.\n\n"
                        "Content may be blocked, flagged, or removed if it violates app rules.\n\n"
                        "Repeated misuse may lead to account suspension or permanent ban.",
                  ),
                  _PolicyCard(
                    number: "5",
                    title: "Abuse & Misuse Policy",
                    body:
                        "Political propaganda, spam, or false reporting is strictly prohibited.\n\n"
                        "A strike-based system is used to prevent repeated misuse.\n\n"
                        "Serious violations may result in immediate account termination.",
                  ),
                  _PolicyCard(
                    number: "6",
                    title: "Location & Priority Policy",
                    body:
                        "Location data is used to assess issue importance and urgency.\n\n"
                        "Priority levels are assigned based on severity, location, and community impact.\n\n"
                        "Location data is used only for civic decision-making.",
                  ),
                  _PolicyCard(
                    number: "7",
                    title: "Data Security Policy",
                    body:
                        "Reasonable security measures are used to protect user data.\n\n"
                        "Unauthorized access, misuse, or data leakage is actively prevented.",
                  ),
                  _PolicyCard(
                    number: "8",
                    title: "Data Retention Policy",
                    body:
                        "Data is stored only as long as necessary for issue resolution and analysis.\n\n"
                        "Users may request deletion of their account and associated data.",
                  ),
                  _PolicyCard(
                    number: "9",
                    title: "User Rights Policy",
                    body:
                        "Users have the right to access, update, or delete their data.\n\n"
                        "Users can report misuse or policy violations within the app.",
                  ),
                  _PolicyCard(
                    number: "10",
                    title: "Policy Updates",
                    body:
                        "Policies may be updated to improve security, compliance, or features.\n\n"
                        "Continued use of the app indicates acceptance of updated policies.",
                  ),

                  SizedBox(height: 16),
                  _FooterNote(),
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
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: const Icon(Icons.privacy_tip_outlined, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Policies – VOICE UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "How we handle privacy, data, safety and moderation.",
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

class _PolicyCard extends StatelessWidget {
  final String number;
  final String title;
  final String body;

  const _PolicyCard({
    required this.number,
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
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
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

class _FooterNote extends StatelessWidget {
  const _FooterNote();

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
          Icon(Icons.info_outline, color: Colors.black.withOpacity(0.55)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "These policies are designed to protect users and improve civic reporting quality in VOICE UP.",
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
