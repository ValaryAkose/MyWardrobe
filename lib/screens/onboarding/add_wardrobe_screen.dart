import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../app/theme.dart';

class AddWardrobeScreen extends StatelessWidget {
  const AddWardrobeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Spacer(),
                  const Text(
                    '4 of 4',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: MyWardrobeColors.secondaryText,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 34),

              const Text(
                'Let\'s build\nyour wardrobe',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 42,
                  height: 1.05,
                  color: MyWardrobeColors.text,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Add a few pieces to get your first personalized outfit.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: MyWardrobeColors.secondaryText,
                ),
              ),

              const SizedBox(height: 36),

              Expanded(
                child: Column(
                  children: [
                    _AddOption(
                      icon: Icons.camera_alt_outlined,
                      title: 'Take a photo',
                      subtitle: 'Photograph a clothing item',
                      color: MyWardrobeColors.lavender,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Camera will be connected next.'),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 14),

                    _AddOption(
                      icon: Icons.photo_library_outlined,
                      title: 'Choose from photos',
                      subtitle: 'Select clothing from your gallery',
                      color: MyWardrobeColors.blush,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Photo gallery will be connected next.',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 14),

                    _AddOption(
                      icon: Icons.add_rounded,
                      title: 'Add manually',
                      subtitle: 'Enter the clothing details yourself',
                      color: MyWardrobeColors.white,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Manual entry will be connected next.',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.home,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyWardrobeColors.text,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Start with my wardrobe',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'I’ll do this later',
                    style: TextStyle(color: MyWardrobeColors.secondaryText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _AddOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: MyWardrobeColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: MyWardrobeColors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: MyWardrobeColors.text),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MyWardrobeColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: MyWardrobeColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: MyWardrobeColors.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
