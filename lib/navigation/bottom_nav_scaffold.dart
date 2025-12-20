import 'package:flutter/material.dart';
import 'package:voice_up/screens/profile_screen.dart';

import '../screens/home_screen.dart';
import '../screens/explore_screen.dart';

import '../screens/view_profile_screen.dart';
import '../screens/settings_screen_official.dart';
import '../screens/terms_conditions_screen.dart';
import '../screens/policies_screen.dart';
import '../screens/aboutus_screen.dart';

class BottomNavScaffold extends StatefulWidget {
  const BottomNavScaffold({super.key});

  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const HomeScreen(), // 0
      ExploreScreen(onCancel: () => setState(() => _currentIndex = 0)), // 1
      const SettingsScreenOffical(),
      const HomeScreen(), // 3 not used because menu opens sheet
    ];
  }

  void _openMenuSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, // ✅ important
      builder: (_) => const _AppMenuSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xFF004C89);
    const Color unselectedColor = Colors.grey;

    if (_currentIndex < 0 || _currentIndex >= _pages.length) {
      _currentIndex = 0;
    }

    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,

        onTap: (index) {
          if (index == 3) {
            _openMenuSheet();
            return;
          }

          if (index < _pages.length) {
            setState(() => _currentIndex = index);
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Request'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'My Request',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}

// ====================== MENU SHEET UI ======================

class _AppMenuSheet extends StatelessWidget {
  const _AppMenuSheet();

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: 14 + MediaQuery.of(context).viewInsets.bottom,
          top: 8,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 18,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 5,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),

              Row(
                children: const [
                  Icon(Icons.menu, color: primary),
                  SizedBox(width: 8),
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              _MenuItem(
                icon: Icons.person_outline,
                title: "Profile",
                subtitle: "View & edit your profile",
                onTap: (ctx) {
                  Navigator.pop(ctx);
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (_) => ViewProfileScreen()),
                  );
                },
              ),

              _MenuItem(
                icon: Icons.settings_outlined,
                title: "Settings",
                subtitle: "App settings & preferences",
                onTap: (ctx) {
                  Navigator.pop(ctx);
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (_) => SettingsScreenOffical()),
                  );
                },
              ),
              _MenuItem(
                icon: Icons.description_outlined,
                title: "Terms & Conditions",
                subtitle: "Read the terms of use",
                onTap: (ctx) {
                  Navigator.pop(ctx);
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(
                      builder: (_) => const TermsConditionScreen(),
                    ),
                  );
                },
              ),
              _MenuItem(
                icon: Icons.privacy_tip_outlined,
                title: "Policies",
                subtitle: "Privacy & policies",
                onTap: (ctx) {
                  Navigator.pop(ctx);
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (_) => const PoliciesScreen()),
                  );
                },
              ),
              _MenuItem(
                icon: Icons.mic_none,
                title: "About & Support",
                subtitle: "Learn more about Voice Up",
                onTap: (ctx) {
                  Navigator.pop(ctx);
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                  );
                },
              ),

              const SizedBox(height: 6),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.black.withOpacity(0.12)),
                  ),
                  child: const Text("Close"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final void Function(BuildContext ctx) onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  static const Color primary = Color(0xFF004C89);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F8FC),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withOpacity(0.06)),
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
                    style: const TextStyle(fontWeight: FontWeight.w800),
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
