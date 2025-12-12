import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // adjust path if needed

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xFFE2E8F0);
    const Color chipBlue = Color(0xFFDDEBFF);
    const Color chipBlueText = Color(0xFF1D4ED8);
    const Color darkBlue = Color(0xFF004C89);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(title: "Voice Up"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
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
              // ======= TOP ROW: STATUS CHIP =======
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: chipBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "In Progress",
                      style: TextStyle(
                        color: chipBlueText,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // ======= DESCRIPTION =======
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Description: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text:
                          "The public park's main gate is broken and needs repair. It's a safety concern for children playing.",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // ======= MAIN IMAGE =======
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/post1.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 10),

              // ======= STATS ROW =======
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.favorite_border, size: 20),
                      SizedBox(width: 4),
                      Text("4,200"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.chat_bubble_outline, size: 20),
                      SizedBox(width: 4),
                      Text("85"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.lock_outline, size: 20),
                      SizedBox(width: 4),
                      Text("30"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ======= STATUS LIST =======
              _statusRow(
                color: Colors.green,
                label: "Seen Verified",
                bold: true,
              ),
              _statusRow(color: Colors.green, label: "Hold", bold: true),
              _statusRow(color: Colors.black, label: "In Progress", bold: true),
              _statusRow(color: Colors.grey, label: "Completed"),
              _statusRow(color: Colors.grey, label: "Closed"),
              _statusRow(color: Colors.grey, label: "Seen Verified"),

              const SizedBox(height: 18),

              // ======= REPLY HEADER STRIP =======
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Road Development Authority (RDA) replied your post..",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 12),

              // ======= REPLY CARD =======
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // avatar + title
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFE6B3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add_road,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Road Development Authority (RDA)",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "@Kandy",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Description: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text:
                                "we considered your post.. we have started the repairing works for the issue. hope we will finish it soon.",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/post5.jpg',
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ======= BACK + RE-TAG BUTTONS ROW =======
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // BACK BUTTON
                        SizedBox(
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                              ); // 👈 go back to previous screen
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                162,
                                169,
                                174,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Back",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        // RE-TAG BUTTON
                        SizedBox(
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: handle Re-tag action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBlue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Re-tag",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // helper row for status list
  static Widget _statusRow({
    required Color color,
    required String label,
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
