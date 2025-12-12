import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../navigation/bottom_nav_scaffold.dart'; // for navigating back to home

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedIssueType;

  @override
  void dispose() {
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // ================== POST HANDLER ==================
  void _onPostPressed() {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    // Create overlay entry for the toast notification
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        right: 16,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.check_circle, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Posted successfully',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Wait 4 seconds, then remove toast and go to Home
    Future.delayed(const Duration(seconds: 4), () {
      overlayEntry.remove();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const BottomNavScaffold()),
        (route) => false, // remove all previous routes
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xFFCBD5E1);
    const Color darkBlue = Color(0xFF004C89);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(title: 'Voice Up'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= UPLOADED PHOTOS TITLE =================
            const Text(
              'Uploaded Photos',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            // ================= BIG PHOTO PREVIEW =================
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
                // TODO: Replace with Image.asset or selected image
              ),
            ),

            const SizedBox(height: 8),

            // ================= SMALL PHOTOS + ADD MORE =================
            Row(
              children: [
                _buildSmallPhotoPlaceholder(),
                const SizedBox(width: 8),
                _buildSmallPhotoPlaceholder(),
                const SizedBox(width: 8),

                // + Add more button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: implement image picker
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: borderColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.add),
                    label: const Text('Add more'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ================= LOCATION FIELD =================
            _buildLabelWithDot('Location'),
            const SizedBox(height: 6),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Location',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.location_on_outlined),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: darkBlue, width: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ================= ISSUE TYPE DROPDOWN =================
            const Text(
              'Issue type',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _selectedIssueType,
              decoration: InputDecoration(
                hintText: 'Select issue types...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: darkBlue, width: 1.5),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Potholes', child: Text('Potholes')),
                DropdownMenuItem(value: 'Cracks', child: Text('Cracks')),
                DropdownMenuItem(
                  value: 'Erosion damage',
                  child: Text('Erosion damage'),
                ),
                DropdownMenuItem(
                  value: 'Faded road markings',
                  child: Text('Faded road markings'),
                ),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedIssueType = value;
                });
              },
            ),

            const SizedBox(height: 18),

            // ================= DESCRIPTION FIELD =================
            const Text(
              'Description:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "broken and needs repair. It's a safety concern for...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: darkBlue, width: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const SizedBox(height: 24),

            // ================= BUTTONS ROW =================
            Row(
              children: [
                // ---- DRAFT BUTTON ----
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: handle save draft
                    },
                    icon: const Icon(
                      Icons.save_outlined,
                      color: Colors.black87,
                    ),
                    label: const Text(
                      "Draft",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // ---- POST BUTTON ----
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _onPostPressed, // 👈 show toast + go home
                    icon: const Icon(Icons.send, color: Colors.white),
                    label: const Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // small helpers ==============

  Widget _buildSmallPhotoPlaceholder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        width: 70,
        color: Colors.grey[300],
        child: const Icon(Icons.image, size: 28, color: Colors.grey),
      ),
    );
  }

  Widget _buildLabelWithDot(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 4),
        const Text('*', style: TextStyle(color: Colors.red, fontSize: 14)),
      ],
    );
  }
}
