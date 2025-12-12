import 'package:flutter/material.dart';

// Screens
import '../screens/home_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/profile_screen.dart';

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
      const HomeScreen(), // index 0
      // Explore (renamed → Request)
      ExploreScreen(
        onCancel: () {
          setState(() {
            _currentIndex = 0; // Go home when cancel pressed
          });
        },
      ), // index 1

      const SettingsScreen(), // index 2 (renamed → My Request)

      const ProfileScreen(), // index 3 (renamed → Notifications)
    ];
  }

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xFF004C89);
    const Color unselectedColor = Colors.grey;

    // Safety
    if (_currentIndex < 0 || _currentIndex >= _pages.length) {
      _currentIndex = 0;
    }

    return Scaffold(
      body: _pages[_currentIndex],

      // ------------------ BOTTOM NAV BAR ------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,

        onTap: (index) {
          if (index < _pages.length) {
            setState(() {
              _currentIndex = index;
            });
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Request', // ← changed
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'My Request', // ← changed
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications', // ← changed
          ),
        ],
      ),
    );
  }
}
