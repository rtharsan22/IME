import 'package:flutter/material.dart';
import 'package:voice_up/navigation/bottom_nav_scaffold.dart';
import 'package:voice_up/screens/terms_conditions_screen.dart';

// ✅ Change paths to your real file locations
import 'profile_screen.dart';

import 'policies_screen.dart';
import 'aboutus_screen.dart';

class SettingsScreenOffical extends StatefulWidget {
  const SettingsScreenOffical({super.key});

  @override
  State<SettingsScreenOffical> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreenOffical> {
  static const Color primary = Color(0xFF004C89);
  static const Color bg = Color(0xFFF3F6FB);

  // Demo settings (store with SharedPreferences later)
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _darkMode = false;
  bool _locationServices = true;

  String _language = "English";
  final List<String> _languages = const ["English", "සිංහල", "தமிழ்"];

  void _openPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Future<void> _logout() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text("Logout"),
          ),
        ],
      ),
    );

    if (result == true) {
      // TODO: FirebaseAuth.instance.signOut(); etc.
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Logged out ✅")));

      // Optional: Navigate to login screen
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginScreen()), (r) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              child: Column(
                children: [
                  const _HeaderCard(),
                  const SizedBox(height: 14),

                  _SectionTitle(title: "Account"),
                  _ActionTile(
                    icon: Icons.person_outline,
                    title: "Profile",
                    subtitle: "View and update your profile",
                    onTap: () => _openPage(const ProfileScreen()),
                  ),

                  const SizedBox(height: 12),

                  _SectionTitle(title: "Preferences"),
                  _SwitchTile(
                    icon: Icons.notifications_none,
                    title: "Push Notifications",
                    subtitle: "Get updates about your requests",
                    value: _pushNotifications,
                    onChanged: (v) => setState(() => _pushNotifications = v),
                  ),
                  _SwitchTile(
                    icon: Icons.email_outlined,
                    title: "Email Notifications",
                    subtitle: "Receive updates through email",
                    value: _emailNotifications,
                    onChanged: (v) => setState(() => _emailNotifications = v),
                  ),
                  _SwitchTile(
                    icon: Icons.location_on_outlined,
                    title: "Location Services",
                    subtitle: "Allow location for better reporting",
                    value: _locationServices,
                    onChanged: (v) => setState(() => _locationServices = v),
                  ),
                  _SwitchTile(
                    icon: Icons.dark_mode_outlined,
                    title: "Dark Mode",
                    subtitle: "Reduce eye strain at night",
                    value: _darkMode,
                    onChanged: (v) => setState(() => _darkMode = v),
                  ),

                  _DropdownTile(
                    icon: Icons.language_outlined,
                    title: "Language",
                    subtitle: "Choose your preferred language",
                    value: _language,
                    items: _languages,
                    onChanged: (v) => setState(() => _language = v),
                  ),

                  const SizedBox(height: 12),

                  _SectionTitle(title: "Support & Legal"),
                  _ActionTile(
                    icon: Icons.description_outlined,
                    title: "Terms & Conditions",
                    subtitle: "Read the terms of use",
                    onTap: () => _openPage(const TermsConditionScreen()),
                  ),
                  _ActionTile(
                    icon: Icons.privacy_tip_outlined,
                    title: "Policies",
                    subtitle: "Privacy, AI and moderation policies",
                    onTap: () => _openPage(const PoliciesScreen()),
                  ),
                  _ActionTile(
                    icon: Icons.info_outline,
                    title: "About Us",
                    subtitle: "Learn about VOICE UP",
                    onTap: () => _openPage(const AboutUsScreen()),
                  ),
                  _ActionTile(
                    icon: Icons.support_agent_outlined,
                    title: "Help & Support",
                    subtitle: "Contact support team",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Support page / email action here"),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  // Logout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _logout,
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===================== UI Widgets =====================

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
            child: const Icon(Icons.tune, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Manage your app preferences and account options.",
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

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12.5),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeColor: primary),
        ],
      ),
    );
  }
}

class _DropdownTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const _DropdownTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
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
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12.5),
                ),
              ],
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) {
                if (v != null) onChanged(v);
              },
            ),
          ),
        ],
      ),
    );
  }
}
