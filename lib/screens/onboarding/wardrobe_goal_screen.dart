import 'package:flutter/material.dart';

import '../../app/theme.dart';

class WardrobeGoalScreen extends StatefulWidget {
  const WardrobeGoalScreen({super.key});

  @override
  State<WardrobeGoalScreen> createState() => _WardrobeGoalScreenState();
}

class _WardrobeGoalScreenState extends State<WardrobeGoalScreen> {
  final List<Map<String, String>> _goals = [
    {
      'title': 'Wear what I own more',
      'subtitle': 'Get more outfits from my current wardrobe.',
    },
    {
      'title': 'Build better outfits',
      'subtitle': 'Create looks that feel more put together.',
    },
    {
      'title': 'Shop smarter',
      'subtitle': 'Know what I actually need before buying.',
    },
    {
      'title': 'Discover my style',
      'subtitle': 'Understand and develop my personal style.',
    },
    {
      'title': 'Organize everything',
      'subtitle': 'Keep my wardrobe organized in one place.',
    },
  ];

  String? _selectedGoal;

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
                    '3 of 4',
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
                'What do you\nwant to achieve?',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 40,
                  height: 1.05,
                  color: MyWardrobeColors.text,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'We will use this to personalize your experience.',
                style: TextStyle(
                  fontSize: 15,
                  color: MyWardrobeColors.secondaryText,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.separated(
                  itemCount: _goals.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final goal = _goals[index];
                    final title = goal['title']!;
                    final subtitle = goal['subtitle']!;
                    final selected = _selectedGoal == title;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGoal = title;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: selected
                              ? MyWardrobeColors.blush
                              : MyWardrobeColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selected
                                ? MyWardrobeColors.violet
                                : MyWardrobeColors.border,
                            width: selected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: selected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      color: MyWardrobeColors.text,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    subtitle,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      color: MyWardrobeColors.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
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
                  onPressed: _selectedGoal == null
                      ? null
                      : () {
                          // Final onboarding screen will go here.
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
