import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../app/theme.dart';

class OccasionPreferencesScreen extends StatefulWidget {
  const OccasionPreferencesScreen({super.key});

  @override
  State<OccasionPreferencesScreen> createState() =>
      _OccasionPreferencesScreenState();
}

class _OccasionPreferencesScreenState extends State<OccasionPreferencesScreen> {
  final List<String> _occasions = [
    'Work',
    'Everyday',
    'Going out',
    'Travel',
    'Events',
    'University',
    'Exercise',
  ];

  final Set<String> _selectedOccasions = {};

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
                    '2 of 4',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: MyWardrobeColors.secondaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'What do you\ndress for?',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 42,
                  height: 1.05,
                  color: MyWardrobeColors.text,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Select everything that applies to you.',
                style: TextStyle(
                  fontSize: 15,
                  color: MyWardrobeColors.secondaryText,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: _occasions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final occasion = _occasions[index];
                    final selected = _selectedOccasions.contains(occasion);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected) {
                            _selectedOccasions.remove(occasion);
                          } else {
                            _selectedOccasions.add(occasion);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        height: 64,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: selected
                              ? MyWardrobeColors.lavender
                              : MyWardrobeColors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: selected
                                ? MyWardrobeColors.violet
                                : MyWardrobeColors.border,
                            width: selected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              occasion,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: selected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: MyWardrobeColors.text,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              selected
                                  ? Icons.check_circle_rounded
                                  : Icons.circle_outlined,
                              color: selected
                                  ? MyWardrobeColors.violet
                                  : MyWardrobeColors.secondaryText,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedOccasions.isEmpty
                      ? null
                      : () {
                          Navigator.pushNamed(context, AppRoutes.wardrobeGoal);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyWardrobeColors.text,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: MyWardrobeColors.border,
                    disabledForegroundColor: MyWardrobeColors.secondaryText,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
