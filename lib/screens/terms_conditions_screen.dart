import 'package:flutter/material.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

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
        title: const Text("Terms & Conditions"),
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

                  _SectionCard(
                    number: "1",
                    title: "Acceptance of Terms",
                    body:
                        "By using the VOICE UP mobile application, you agree to these Terms & Conditions. "
                        "If you do not agree, please stop using the app.",
                  ),
                  _SectionCard(
                    number: "2",
                    title: "Purpose of the App",
                    body:
                        "VOICE UP allows citizens to report public infrastructure issues such as road damage, "
                        "garbage problems, and safety concerns using text, images, and videos.",
                  ),
                  _SectionCard(
                    number: "3",
                    title: "User Responsibilities",
                    body:
                        "Users must:\n"
                        "• Provide accurate and truthful information\n"
                        "• Upload only real and relevant civic issues\n"
                        "• Use the app respectfully and responsibly\n\n"
                        "Users must not:\n"
                        "• Upload fake, misleading, or AI-generated content\n"
                        "• Submit abusive, offensive, or political content\n"
                        "• Spam or misuse the reporting system",
                  ),
                  _SectionCard(
                    number: "4",
                    title: "Content Review & Moderation",
                    body:
                        "All submissions are automatically reviewed using AI systems.\n\n"
                        "Reports may be flagged, rejected, or blocked if they violate app rules.\n\n"
                        "Repeated misuse may result in temporary or permanent account suspension.",
                  ),
                  _SectionCard(
                    number: "5",
                    title: "AI-Based Processing",
                    body:
                        "VOICE UP uses AI to:\n"
                        "• Analyze images and videos\n"
                        "• Detect fake or AI-generated content\n"
                        "• Filter abusive or irrelevant submissions\n"
                        "• Prioritize issues based on severity and location\n\n"
                        "AI results are assistive and may not always be 100% accurate.",
                  ),
                  _SectionCard(
                    number: "6",
                    title: "User Content Rights",
                    body:
                        "Users retain ownership of the content they upload.\n\n"
                        "By submitting content, users allow VOICE UP to process and share reports with relevant authorities.",
                  ),
                  _SectionCard(
                    number: "7",
                    title: "Location Usage",
                    body:
                        "Location data is used only to verify and prioritize civic issues.\n\n"
                        "Location information is not sold or misused.",
                  ),
                  _SectionCard(
                    number: "8",
                    title: "Limitation of Responsibility",
                    body:
                        "VOICE UP is not responsible for:\n"
                        "• Delays or actions taken by government authorities\n"
                        "• Incorrect information provided by users\n"
                        "• Outcomes resulting from reported issues",
                  ),
                  _SectionCard(
                    number: "9",
                    title: "Account Suspension",
                    body:
                        "VOICE UP reserves the right to suspend or terminate accounts that violate these Terms & Conditions.",
                  ),
                  _SectionCard(
                    number: "10",
                    title: "Changes to Terms",
                    body:
                        "These Terms & Conditions may be updated at any time. Continued use of the app means you accept the latest version.",
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
            child: const Icon(Icons.description_outlined, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Terms & Conditions – VOICE UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Please read carefully before using the app.",
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

class _SectionCard extends StatelessWidget {
  final String number;
  final String title;
  final String body;

  const _SectionCard({
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
              "If you have questions about these terms, please contact the VOICE UP support team.",
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
