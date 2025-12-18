import 'package:flutter/material.dart';

class ComplaintMakingScreen extends StatefulWidget {
  const ComplaintMakingScreen({super.key});

  @override
  State<ComplaintMakingScreen> createState() => _ComplaintMakingScreenState();
}

class _ComplaintMakingScreenState extends State<ComplaintMakingScreen> {
  static const Color darkBlue = Color(0xFF004C89);

  int selectedType = 0; // 0 = Road, 1 = Garbage

  final titleCtrl = TextEditingController();
  final issueCtrl = TextEditingController();
  final locationCtrl = TextEditingController();

  @override
  void dispose() {
    titleCtrl.dispose();
    issueCtrl.dispose();
    locationCtrl.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() => selectedType = 0);
    titleCtrl.clear();
    issueCtrl.clear();
    locationCtrl.clear();
  }

  void _submit() {
    // TODO: send to backend / firestore etc.
    debugPrint("TYPE: ${selectedType == 0 ? "Road" : "Garbage"}");
    debugPrint("TITLE: ${titleCtrl.text}");
    debugPrint("ISSUE: ${issueCtrl.text}");
    debugPrint("LOCATION: ${locationCtrl.text}");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Submitted!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Container(
            width: 360,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                // ====== TOP ROW: "Report an issue" + Road/Garbage toggle
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Report an issue:",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          _segBtn("Road", selectedType == 0, () {
                            setState(() => selectedType = 0);
                          }),
                          _segBtn("Garbage", selectedType == 1, () {
                            setState(() => selectedType = 1);
                          }),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ====== Short title
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Short title",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: titleCtrl,
                  decoration: InputDecoration(
                    hintText: "e.g: near the hospital",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ====== Report the issue
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Report the issue",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "broken and needs repair. It's a safety concern\nfor children playing.",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: TextField(
                    controller: issueCtrl,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: "e.g: near the hospital",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ====== Location
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pin your Location",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: locationCtrl,
                  decoration: InputDecoration(
                    hintText: "your location",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.my_location),
                      onPressed: () {
                        // If you later add GPS, this is where you'll fill the field.
                        // For now: keep as manual input.
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ====== Bottom buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _reset,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.refresh),
                        label: const Text("Re-set"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.receipt_long),
                        label: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _segBtn(String text, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selected ? darkBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
