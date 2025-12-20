import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  // Theme colors
  static const Color primary = Color(0xFF0B3B73);
  static const Color cardBg = Color(0xFFF6F8FC);

  // Avatar selection (6-in-1)
  int _selectedAvatar = 0;

  // Form + controllers
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController(text: "Alex Johnson");
  final _emailCtrl = TextEditingController(text: "alex.johnson@gmail.com");
  final _phoneCtrl = TextEditingController(text: "+94 ");
  final _locationCtrl = TextEditingController(text: "Colombo");

  String _gender = "Male";

  @override
  void initState() {
    super.initState();
    // Enforce +94 prefix always
    _phoneCtrl.addListener(_ensureSriLankaPrefix);
  }

  void _ensureSriLankaPrefix() {
    const prefix = "+94 ";
    final v = _phoneCtrl.text;

    if (!v.startsWith(prefix)) {
      final digitsOnly = v.replaceAll(RegExp(r"[^0-9]"), "");
      // remove leading 94 if user pasted it
      final cleaned = digitsOnly.startsWith("94")
          ? digitsOnly.substring(2)
          : digitsOnly;
      final next = "$prefix$cleaned";
      _phoneCtrl.value = TextEditingValue(
        text: next,
        selection: TextSelection.collapsed(offset: next.length),
      );
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() {
      _selectedAvatar = 0;
      _gender = "Male";
    });
    _nameCtrl.text = "";
    _emailCtrl.text = "";
    _phoneCtrl.text = "+94 ";
    _locationCtrl.text = "";
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    // TODO: Push to backend / firestore
    debugPrint("AvatarIndex: $_selectedAvatar");
    debugPrint("Name: ${_nameCtrl.text}");
    debugPrint("Gender: $_gender");
    debugPrint("Email: ${_emailCtrl.text}");
    debugPrint("Phone: ${_phoneCtrl.text}");
    debugPrint("Location: ${_locationCtrl.text}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully ✅")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F3F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Change Profile"),
        foregroundColor: Colors.black87,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Top gradient header
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 14,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                primary.withOpacity(0.12),
                                primary.withOpacity(0.03),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              _AvatarPicker(
                                selectedIndex: _selectedAvatar,
                                onSelect: (i) =>
                                    setState(() => _selectedAvatar = i),
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "My Profile",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Manage your personal information",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Fields (DON'T REMOVE)
                        _CardField(
                          label: "Full Name",
                          child: TextFormField(
                            controller: _nameCtrl,
                            textInputAction: TextInputAction.next,
                            decoration: _inputDeco(hint: "Enter full name"),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty)
                                return "Full name is required";
                              if (v.trim().length < 2)
                                return "Enter a valid name";
                              return null;
                            },
                          ),
                        ),

                        _CardField(
                          label: "Gender",
                          child: DropdownButtonFormField<String>(
                            value: _gender,
                            decoration: _inputDeco(),
                            items: const [
                              DropdownMenuItem(
                                value: "Male",
                                child: Text("Male"),
                              ),
                              DropdownMenuItem(
                                value: "Female",
                                child: Text("Female"),
                              ),
                            ],
                            onChanged: (val) =>
                                setState(() => _gender = val ?? "Male"),
                          ),
                        ),

                        _CardField(
                          label: "Email",
                          child: TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: _inputDeco(hint: "example@email.com"),
                            validator: (v) {
                              final value = (v ?? "").trim();
                              if (value.isEmpty) return "Email is required";
                              final ok = RegExp(
                                r"^[^\s@]+@[^\s@]+\.[^\s@]+$",
                              ).hasMatch(value);
                              if (!ok) return "Enter a valid email";
                              return null;
                            },
                          ),
                        ),

                        _CardField(
                          label: "Phone Number (Sri Lanka)",
                          child: TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: _inputDeco(hint: "+94 7X XXX XXXX"),
                            inputFormatters: [
                              // allow digits, spaces, and plus
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[0-9 +]"),
                              ),
                              LengthLimitingTextInputFormatter(16),
                            ],
                            validator: (v) {
                              final value = (v ?? "").trim();
                              if (value.isEmpty || value == "+94")
                                return "Phone number is required";
                              if (!value.startsWith("+94"))
                                return "Phone must start with +94";
                              // Must have some digits after prefix
                              final rest = value
                                  .replaceFirst("+94", "")
                                  .replaceAll(RegExp(r"[^0-9]"), "");
                              if (rest.length < 9)
                                return "Enter a valid Sri Lanka phone number";
                              return null;
                            },
                          ),
                        ),

                        _CardField(
                          label: "Location",
                          child: TextFormField(
                            controller: _locationCtrl,
                            textInputAction: TextInputAction.done,
                            decoration: _inputDeco(hint: "City / Area"),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty)
                                return "Location is required";
                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 14),

                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _reset,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.grey.shade800,
                                  side: BorderSide(color: Colors.grey.shade300),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("Cancel"),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _save,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text("Save changes"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDeco({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: cardBg,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
    );
  }
}

class _CardField extends StatelessWidget {
  final String label;
  final Widget child;

  const _CardField({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _AvatarPicker extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _AvatarPicker({required this.selectedIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final avatars = <_AvatarData>[
      _AvatarData(icon: Icons.person, bg: const Color(0xFF4F8EF7)),
      _AvatarData(icon: Icons.face, bg: const Color(0xFFF7B84F)),
      _AvatarData(icon: Icons.work, bg: const Color(0xFF68B0AB)),
      _AvatarData(icon: Icons.person_outline, bg: const Color(0xFFB56B6B)),
      _AvatarData(icon: Icons.tag_faces, bg: const Color(0xFF7C8CE4)),
      _AvatarData(icon: Icons.sentiment_satisfied, bg: const Color(0xFFE477A6)),
    ];

    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 14,
          runSpacing: 12,
          children: List.generate(avatars.length, (i) {
            final a = avatars[i];
            final selected = i == selectedIndex;

            return InkWell(
              onTap: () => onSelect(i),
              borderRadius: BorderRadius.circular(999),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected
                        ? _ChangeProfileScreenState.primary
                        : Colors.transparent,
                    width: 2.2,
                  ),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: _ChangeProfileScreenState.primary
                                .withOpacity(0.22),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ]
                      : [],
                ),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: a.bg.withOpacity(0.18),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: a.bg,
                    child: Icon(a.icon, color: Colors.white, size: 22),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _AvatarData {
  final IconData icon;
  final Color bg;
  _AvatarData({required this.icon, required this.bg});
}
