
import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../app/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 18),
          child: Column(
            children: [
              const Spacer(),

              Container(
                width: double.infinity,
                height: 330,
                decoration: BoxDecoration(
                  color: MyWardrobeColors.lavender,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MW',
                        style: TextStyle(
                          fontFamily: 'DM Serif Display',
                          fontSize: 72,
                          color: MyWardrobeColors.text,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'MY WARDROBE',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w600,
                          color: MyWardrobeColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 34),

              const Text(
                'Your wardrobe.',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 35,
                  color: MyWardrobeColors.text,
                ),
              ),

              const Text(
                'Your style.',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 35,
                  color: MyWardrobeColors.violet,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Discover better outfits from the clothes you already own.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: MyWardrobeColors.secondaryText,
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.signup,
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
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.login,
                  );
                },
                child: const Text(
                  'I already have an account  •  Log In',
                  style: TextStyle(
                    color: MyWardrobeColors.text,
                    fontWeight: FontWeight.w500,
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
