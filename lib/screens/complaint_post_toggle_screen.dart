import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/explore_screen.dart'; // <-- ADD THIS
import '../screens/complaint_making_screen.dart';

class ComplaintPostToggleScreen extends StatefulWidget {
  const ComplaintPostToggleScreen({super.key});

  @override
  State<ComplaintPostToggleScreen> createState() =>
      _ComplaintPostToggleScreenState();
}

class _ComplaintPostToggleScreenState extends State<ComplaintPostToggleScreen> {
  bool isComplaintSelected = true;

  static const Color darkBlue = Color(0xFF004C89);
  static const Color yellow = Color(0xFFFFD600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),

            // ================= POST / COMPLAINT TOGGLE =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // POST
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ExploreScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "POST",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // COMPLAINT
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "COMPLAINT",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 150),

            // ================= MAIN CARD =================
            Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mic, size: 34, color: darkBlue),
                    const SizedBox(height: 12),

                    const Text(
                      "Voice Up Confidently",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: darkBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    // ❌ underline removed
                    const Text(
                      "For example, the road has been\ndamaged for a long distance and is\nin a state of disrepair.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 13,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 26),

                    const Text(
                      "Make sure the damage or impact\nyou have will be long-range or\nmassive.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ================= CONFIRM =================
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ComplaintMakingScreen(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: yellow,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ================= BACK BUTTON =================
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
