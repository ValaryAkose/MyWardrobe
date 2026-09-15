import 'package:flutter/material.dart';

import '../../app/theme.dart';

class StylePreferencesScreen extends StatefulWidget {
  const StylePreferencesScreen({super.key});

  @override
  State<StylePreferencesScreen> createState() =>
      _StylePreferencesScreenState();
}

class _StylePreferencesScreenState
    extends State<StylePreferencesScreen> {
  final List<String> _styles = [
    'Minimal',
    'Classic',
    'Street',
    'Romantic',
    'Elegant',
    'Sporty',
    'Bohemian',
    'Trendy',
  ];

  final Set<String> _selectedStyles = {};

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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Spacer(),
                  const Text(
                    '1 of 4',
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
                'What is your\nstyle?',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 42,
                  height: 1.05,
                  color: MyWardrobeColors.text,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Choose the styles that feel most like you.',
                style: TextStyle(
                  fontSize: 15,
                  color: MyWardrobeColors.secondaryText,
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: GridView.builder(
                  itemCount: _styles.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.45,
                  ),
                  itemBuilder: (context, index) {
                    final style = _styles[index];
                    final selected =
                        _selectedStyles.contains(style);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selected) {
                            _selectedStyles.remove(style);
                          } else {
                            _selectedStyles.add(style);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        decoration: BoxDecoration(
                          color: selected
                              ? MyWardrobeColors.lavender
                              : MyWardrobeColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selected
                                ? MyWardrobeColors.violet
                                : MyWardrobeColors.border,
                            width: selected ? 1.5 : 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                style,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: selected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: MyWardrobeColors.text,
                                ),
                              ),
                            ),
                            if (selected)
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  size: 20,
                                  color: MyWardrobeColors.violet,
                                ),
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
                  onPressed: _selectedStyles.isEmpty
                      ? null
                      : () {
                          // Next onboarding screen will go here.
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyWardrobeColors.text,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        MyWardrobeColors.border,
                    disabledForegroundColor:
                        MyWardrobeColors.secondaryText,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
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